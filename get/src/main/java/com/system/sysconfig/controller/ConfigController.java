package com.system.sysconfig.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.common.utils.IDUtils;
import com.get.statuc.R;
import com.common.utils.ReflectUtils;
import com.common.utils.Result;
import com.system.sysconfig.ConfigHandler;
import com.system.sysconfig.domain.ConfigDO;
import com.system.sysconfig.service.ConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 配置表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-09-06 11:20:36
 */

@Controller
@RequestMapping("${backPathPrefix}/sysconfig/config")
public class ConfigController {

    @Autowired
    private ConfigService configService;

    @GetMapping()
    @RequiresPermissions("sysconfig:config:config")
    String Config(String clazzName, Model model) {
        model.addAttribute("clazzName", clazzName);
        return "sysconfig/config/" + clazzName;
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("sysconfig:config:config")
    public Result list(String clazzName) throws Exception {
        if (clazzName == null || clazzName.length() == 0) {
            return Result.error("配置信息没有填写clazzName");
        }

        // 获得所有配置类,遍历装在配置
        List<Class> configsClazz = ConfigHandler.configsClazz;
        Class targetConfigClazz = null;
        for (Class config : configsClazz) {
            String simpleName = config.getSimpleName();
            if (clazzName.equals(simpleName)) {
                targetConfigClazz = config;
                break;
            }
        }
        if (targetConfigClazz == null) {
            return Result.error("没有找到" + clazzName + "对应的配置类,请在ConfigHandler中配置");
        }

        // 获得当前类的配置信息
        List<ConfigDO> configs = getConfig(targetConfigClazz);
        return Result.ok(configs);
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("sysconfig:config:edit")
    public R update(String data, String clazzName) throws IllegalAccessException, NoSuchFieldException, InstantiationException {
        if (clazzName == null || clazzName.length() == 0) {
            return R.error("配置信息没有填写clazzName");
        }

        // 获得配置类的class
        List<Class> configsClazz = ConfigHandler.configsClazz;
        Class targetConfigClazz = null;
        for (Class config : configsClazz) {
            String simpleName = config.getSimpleName();
            if (clazzName.equals(simpleName)) {
                targetConfigClazz = config;
                break;
            }
        }

        // 获得数据
        JSONObject obj = (JSONObject) JSON.parse(data);
        // 将值分装到clss对象9
        Set<Map.Entry<String, Object>> entries = obj.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            String kay = entry.getKey();
            String value = String.valueOf(entry.getValue());
            String prefix = ReflectUtils.getPrefix(targetConfigClazz);
            if (prefix == null) {
                R.error("报错错误,没有定义缓存的前缀");
            }

            // 保存到数据库
            ConfigDO configDO = new ConfigDO(IDUtils.randomStr(), prefix + kay, value, prefix, new Date(), new Date(), "0");
            configService.update(configDO);
        }

        return R.ok();
    }


    /**
     * 获得换成对象的所有方法的缓存值
     *
     * @param clazz
     * @return
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws InvocationTargetException
     */
    public List<ConfigDO> getConfig(Class clazz) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        List<ConfigDO> configDOS = new ArrayList<>();
        Object instance = clazz.newInstance();
        Method[] declaredMethods = clazz.getDeclaredMethods();
        for (Method declaredMethod : declaredMethods) {
            if (declaredMethod.getName().startsWith("get")) {
                ConfigDO value = (ConfigDO) declaredMethod.invoke(instance);
                configDOS.add(value);
            }
        }
        return configDOS;
    }


}
