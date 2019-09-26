package com.common.basicskills.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;

/**
 * @author: hqs
 * @Date: 2018/9/18 14:34
 * @Description: 打杂的控制器
 */
@Controller
@RequestMapping("/js/euedit")
public class UeditorController {

    /**
     * ueditr后端配置
     *
     * @param action
     * @param nocache
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ueditor")
    public String ueditor(@RequestParam("action") String action, String nocache, HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("application/json;charset=utf-8");
            //Resource resource = new ClassPathResource("config.json");
            ClassPathResource classPathResource = new ClassPathResource("config.json");
            InputStreamReader reader = new InputStreamReader(classPathResource.getInputStream(), "UTF-8");
            BufferedReader br = new BufferedReader(reader);
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                stringBuilder.append(line);
            }
            return stringBuilder.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}