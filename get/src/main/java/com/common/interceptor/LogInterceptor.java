package com.common.interceptor;

import com.alibaba.fastjson.JSON;
import com.common.basicskills.domain.LogDO;
import com.common.basicskills.service.LogService;
import com.common.utils.*;
import com.system.base.domain.UserDO;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

public class LogInterceptor implements HandlerInterceptor {

    LogService logService;


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {
        saveLog(request,response,o,e);
    }

    //请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {
//        System.out.println(111);
    }

    /**
     * 保存日志
     *
     * @param request
     * @param response
     * @param o
     * @param e
     */
    private void saveLog(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws IOException {
        if(logService == null) {
           logService = (LogService) ContextUtils.getBean(LogService.class);
        }
        String requestURI = request.getRequestURI();
        if(requestURI.endsWith(".jpg") || requestURI.endsWith(".png") ||
                requestURI.endsWith(".js") || requestURI.endsWith(".css") ||
                requestURI.endsWith(".html") || requestURI.equals("/manager/getVerify") ||
                requestURI.equals("/error") || requestURI.endsWith(".gif") ||
                requestURI.endsWith(".woff2") || requestURI.endsWith(".map")
                || requestURI.endsWith(".ico")

                ){
            return;
        }
        String ipAddr = IPUtils.getIpAddr(request);
        String type = null;
        if(e == null){
            type = "normal";
        }else{
            type = "error";
        }

        UserDO currUser = null;
        try {
            currUser = ShiroUtils.getUser();
        }catch (UnavailableSecurityManagerException shiroe){
            shiroe.getMessage();
        }

        LogDO sysLog = new LogDO();
        if(currUser == null){
            sysLog.setUserId(-1L);
            sysLog.setUsername("获取用户信息为空");
        }else {
            sysLog.setUserId(currUser.getUserId());
            sysLog.setUsername(currUser.getUsername());
        }

        sysLog.setMethod(requestURI);
        sysLog.setIp(ipAddr);
        Map<String, String> paramJson = JSONUtils.getParamJson(request,response);
        sysLog.setParams(JSON.toJSONString(paramJson));
        sysLog.setOperation(type);
        sysLog.setGmtCreate(new Date());
        sysLog.setApp("sesame");
        logService.save(sysLog);
    }

}
