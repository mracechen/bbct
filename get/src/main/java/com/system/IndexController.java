package com.system;

import com.common.basicskills.controller.BaseController;
import com.common.utils.RedisUtils;
import com.system.language.service.LanguageService;
import com.system.sysconfig.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 访问首页
 */
@Controller
public class IndexController extends BaseController {

    @Autowired
    RedisUtils redisUtils;

    @Autowired
    ConfigService configService;

/*    @Autowired
    LanguageService languageService;*/

    @GetMapping("/manager/indexLogin")
    String welcome(Model model) {
        return "redirect:/manager/login";
    }

}
