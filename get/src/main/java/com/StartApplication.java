package com;


import com.common.filter.SecurityFilter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableAutoConfiguration(exclude = {
        org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class
})
@EnableTransactionManagement
@ServletComponentScan
@MapperScan(value = {"com.srtz.**.dao"})
@SpringBootApplication
@EnableCaching
@EnableScheduling
public class StartApplication extends SpringBootServletInitializer {

    public static void main(String[] args) throws IllegalAccessException {
        SpringApplication.run(StartApplication.class, args);
        System.out.println("程序启动完毕！！！");

    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(StartApplication.class);
    }

    @Bean
    public FilterRegistrationBean authFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean(new SecurityFilter());
        // registration.addUrlPatterns("/*");
        registration.addInitParameter("paramName", "paramValue");
        registration.setName("authFilter");
        registration.setOrder(1);
        return registration;
    }


}
