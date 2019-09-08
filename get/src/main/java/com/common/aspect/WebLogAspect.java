package com.common.aspect;

import com.common.utils.IDUtils;
import com.common.utils.Result;
import com.common.utils.StringUtils;
import com.common.utils.i18n.LanguageEnum;
import com.common.utils.i18n.Languagei18nUtils;
import jdk.nashorn.internal.runtime.Scope;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Locale;

@Aspect
@Component
public class WebLogAspect {

    private static final Logger logger = LoggerFactory.getLogger(WebLogAspect.class);

    @Autowired
    private Languagei18nUtils languagei18nUtils;

    @Pointcut("execution( * com.api..*.*(..))")//两个..代表所有子目录，最后括号里的两个..代表所有参数
    public void logPointCut() {
    }


    @Before("logPointCut()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        request.setAttribute("sign", IDUtils.randomStr());

        // 记录下请求内容
        logger.info("请求地址 : " + request.getRequestURL().toString());
        logger.info("HTTP METHOD : " + request.getMethod());
        // 获取真实的ip地址
        //logger.info("IP : " + IPAddressUtil.getClientIpAddress(request));
        logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "."
                + joinPoint.getSignature().getName());
        logger.info("参数 : " + Arrays.toString(joinPoint.getArgs()));
//        loggger.info("参数 : " + joinPoint.getArgs());

    }

    @AfterReturning(returning = "ret", pointcut = "logPointCut()")// returning的值和doAfterReturning的参数名一致
    public void doAfterReturning(Object ret) throws Throwable {
        logger.info("返回值 : " + ret);
    }

    @Around("logPointCut()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object ob = pjp.proceed();// ob 为方法的返回值
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String language = request.getHeader("language");
        Result result = (Result) ob;
        Locale locale = null;
        try {
            LanguageEnum languageEnum = LanguageEnum.valueOf(language);
            locale = languageEnum.getLocale();
        }catch (Exception e){}
        if(locale == null){
            locale = Locale.getDefault();
        }
        if(result.getMsgCode() != null){
            String message = languagei18nUtils.getMessage(result.getMsgCode(), locale, result.getMsgParams());
            result.setMsg(message);
        }
        logger.info("耗时 : " + (System.currentTimeMillis() - startTime));
        return result;
    }
}
