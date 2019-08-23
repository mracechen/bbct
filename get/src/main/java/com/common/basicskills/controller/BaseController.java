package com.common.basicskills.controller;

import com.common.utils.ShiroUtils;
import com.system.base.domain.UserDO;
import org.springframework.stereotype.Controller;

@Controller
public class BaseController {
    public UserDO getUser() {
        return ShiroUtils.getUser();
    }

    public Long getUserId() {
        return getUser().getUserId();
    }

    public String getUsername() {
        return getUser().getUsername();
    }
}