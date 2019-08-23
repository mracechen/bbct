package com.common.filter;

import com.alibaba.fastjson.JSON;
import com.common.config.spring.SettlementConfig;
import com.common.utils.*;
import com.get.domain.SwUserBasicDO;
import com.system.sysconfig.configbean.SettlementCommonConfig;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 拦截防止xss注入
 * 通过Jsoup过滤请求参数内的特定字符
 *
 * @author yangwk
 */
public class SecurityFilter implements Filter {

    private static Logger logger = LoggerFactory.getLogger(SecurityFilter.class);

    /**
     * 结算时需要拦截的接口以,号分割
     */
    public static String[] interceptInterface;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String method = req.getMethod();
        String requestURI = req.getRequestURI();
        res.setHeader("Access-Control-Allow-Origin", "*");
        res.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, OPTIONS");
        res.setHeader("Access-Control-Max-Age", "3600");
        res.setHeader("Access-Control-Allow-Credentials", "true");
        res.setHeader("Access-Control-Allow-Headers", "Accept, Origin, X-Requested-With, Content-Type,Last-Modified,accessKey");
        /*if ("OPTIONS".equals(method)) {//检测是options方法则直接返回200
            res.setStatus(HttpStatus.OK.value());
        } else {
            filterChain.doFilter(req, res);
        }*/


        //res.setHeader("Access-Control-Allow-Origin", "*");
  /*      res.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        res.setHeader("Access-Control-Max-Age", "3600");
        res.setHeader("Access-Control-Allow-Headers", "x-requested-with");*/

        // 判断是否为结算时间
//        if (SesameTask.settlementSwitch) {
//            for (String interceptUrl : interceptInterface) {
//                if (requestURI.startsWith(interceptUrl)) {
//                    R result = R.error("系统结算中!");
//                    String s = JSON.toJSONString(result);
//                    responseError(req, res, s);
//                    return;
//                }
//            }
//        }

        if(!method.equals("OPTIONS")){
            // 调用app接口判断
            if (requestURI.startsWith("/api") || requestURI.startsWith("//api")) {

                SettlementCommonConfig settlementCommonConfig = new SettlementCommonConfig();
                String flag = settlementCommonConfig.getFilterInterface().getFieldValue();
                if("1".equals(flag)){
                    Result result = new Result("1000","系统维护中...",null);
                    String s = JSON.toJSONString(result);
                    responseError(req, res, s);
                    return;
                }

                // 判断是否为app的公共接口
                if (requestURI.indexOf("/api/app/pc") != -1) {
                    filterChain.doFilter(request, response);
                    return;
                }

                // 判断是否为app的登陆后可调用的接口
                if (requestURI.startsWith("/api/app/pv") || requestURI.startsWith("//api/app/pv")) {
                    SwUserBasicDO user = AppUserUtils.getUser(req);

                    if (user == null) {
                        Result result = new Result("908","请登录后重试",null);
                        String s = JSON.toJSONString(result);
                        responseError(req, res, s);
                        return;
                    }

                    filterChain.doFilter(request, response);
                    return;
                }

            }
        }
        filterChain.doFilter(request, response);
    }

    /**
     * 返回错误信息
     *
     * @param req
     * @param res
     * @param msg
     */
    private void responseError(HttpServletRequest req, HttpServletResponse res, String msg) {
        try {
            req.setCharacterEncoding("utf-8");
            res.setCharacterEncoding("utf-8");
            res.setHeader("Content-type", "text/html;charset=utf-8");
            res.getWriter().print(msg);
            res.setStatus(200);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
    }

    /**
     * 设置结算配置
     */
    public static void setConfig() {
        SettlementConfig bean = (SettlementConfig) ContextUtils.getBean(SettlementConfig.class);
        String urls = bean.getInterceptInterface();
        if (StringUtils.isBlank(urls)) {
            logger.info("结算的时候没有配置拦截的接口异常! ");
        }
        interceptInterface = urls.split(",");
    }
}  
