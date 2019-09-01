package com.common.task;

import com.get.domain.SwPrincipalUserDO;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.*;

@EnableScheduling
@Component
public class releaseTask {

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwPrincipalUserService swPrincipalUserService;

    @Autowired
    private SwCurrentUserService swCurrentUserService;

    @Autowired
    private SwPeriodUserService swPeriodUserService;

    @Autowired
    private SwEvangelistUserService swEvangelistUserService;

    @Autowired
    private SwPartnerUserService swPartnerUserService;

    @Scheduled(cron = "0 * * * * ?")
    public void all(){

        Calendar calendar = Calendar.getInstance();

        //获取当前所有人的固币金
        Map<String,Object> principalParams = new HashMap<>();
        principalParams.put("delFlag", CommonStatic.NOTDELETE);
        List<SwPrincipalUserDO> list = swPrincipalUserService.list(principalParams);

        list.forEach(e->{
            Date createDate = e.getCreateDate();
            calendar.setTime(createDate);
            int year = calendar.get(Calendar.YEAR);
            int year = calendar.get(Calendar.YEAR);
            int year = calendar.get(Calendar.YEAR);
            int year = calendar.get(Calendar.YEAR);
            int year = calendar.get(Calendar.YEAR);
        });

        System.out.println("定时任务ing");
    }
}
