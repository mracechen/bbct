package com.common.utils.PropertyUtils;

import lombok.Data;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;

import javax.annotation.PostConstruct;

@SpringBootConfiguration
@ConfigurationProperties(prefix = "configs.usercache")
@Data
public class ConfigsBean {
    public String prefix;

    public static String s_prefix;

    @PostConstruct
    public void enStatic(){
        s_prefix = prefix;
    }
}