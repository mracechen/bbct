package com.get.controller;

import com.common.utils.IDUtils;
import com.common.utils.StringUtils;
import com.get.domain.SwPartnerDO;
import com.get.domain.SwUserBasicDO;
import com.get.service.SwPartnerService;
import com.get.service.SwUserBasicService;
import com.get.statuc.CommonStatic;
import com.get.statuc.PageUtils;
import com.get.statuc.Query;
import com.get.statuc.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwPartnerUserDO;
import com.get.service.SwPartnerUserService;

/**
 * 用户持有升币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:21:37
 */

@Controller
@RequestMapping("/manager/get/swPartnerUser")
public class SwPartnerUserController {
    @Autowired
    private SwPartnerUserService swPartnerUserService;

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwPartnerService swPartnerService;

    @GetMapping()
    @RequiresPermissions("get:swPartnerUser:swPartnerUser")
    public String SwPartnerUser() {
        return "get/swPartnerUser/swPartnerUser";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swPartnerUser:swPartnerUser")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        params.put("delFlag", CommonStatic.NOTDELETE);
        if(params.get("createStartDate") != null && StringUtils.isNotBlank(params.get("createStartDate").toString())){
            String createStartDate = params.get("createStartDate").toString();

            params.put("beginDate",createStartDate + " 00:00:00");
        }
        if(params.get("createEndDate") != null && StringUtils.isNotBlank(params.get("createEndDate").toString())){
            String createEndDate = params.get("createEndDate").toString();
            params.put("endDate",createEndDate + " 23:59:59");
        }
        //查询列表数据
        Query query = new Query(params);
        List<SwPartnerUserDO> swPartnerUserList = swPartnerUserService.list(query);
        int total = swPartnerUserService.count(query);
        PageUtils pageUtils = new PageUtils(swPartnerUserList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swPartnerUser:add")
    String add() {
        return "get/swPartnerUser/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swPartnerUser:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwPartnerUserDO swPartnerUser = swPartnerUserService.get(tid);
        model.addAttribute("swPartnerUser", swPartnerUser);
        return "get/swPartnerUser/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swPartnerUser:add")
    public R save(SwPartnerUserDO swPartnerUser) {
        try {
            if(swPartnerUser.getUserId() == null){
                return R.error("该用户不存在");
            }
            SwUserBasicDO swUserBasicDO = swUserBasicService.get(swPartnerUser.getUserId());
            if(swUserBasicDO == null){
                return R.error("该用户不存在");
            }
            if(!swUserBasicDO.getUserType().equals(CommonStatic.USER_TYPE_PARTNER)){
                return R.error("该用户不是合伙人，无法获得升币金");
            }
            SwPartnerUserDO hisPartner = swPartnerUserService.getByUserId(swPartnerUser.getUserId(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(hisPartner != null){
                return R.error("该用户已拥有激活的升币金");
            }
            SwPartnerDO swPartnerDO = swPartnerService.get(swPartnerUser.getPartnerId());
            swPartnerUser.setTid(IDUtils.randomStr());
            swPartnerUser.setCreateDate(new Date());
            swPartnerUser.setUpdateDate(new Date());
            swPartnerUser.setDelFlag(CommonStatic.NOTDELETE);
            swPartnerUser.setPartnerId(swPartnerDO.getTid());
            swPartnerUser.setStatus(CommonStatic.NO_RELEASE);
            double userTotal = new BigDecimal(
                    String.valueOf(swPartnerDO.getPartnerNum() == null ? 0 : swPartnerDO.getPartnerNum())
            ).multiply(
                    new BigDecimal(String.valueOf(swPartnerDO.getPercent() == null ? 0 : swPartnerDO.getPercent()))
            ).doubleValue();
            swPartnerUser.setTotalNum(userTotal);
            swPartnerUser.setLeftNum(userTotal);
            if (swPartnerUserService.save(swPartnerUser) > 0) {
                return R.ok();
            }
        }catch (Exception e){
            return R.error();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swPartnerUser:edit")
    public R update(SwPartnerUserDO swPartnerUser) {
        swPartnerUser.setUpdateDate(new Date());
            swPartnerUserService.update(swPartnerUser);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swPartnerUser:remove")
    public R remove( String tid) {
        if (swPartnerUserService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swPartnerUser:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swPartnerUserService.batchRemove(tids);
        return R.ok();
    }

}
