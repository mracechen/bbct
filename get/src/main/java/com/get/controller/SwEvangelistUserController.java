package com.get.controller;

import com.common.utils.IDUtils;
import com.common.utils.StringUtils;
import com.get.domain.SwEvangelistDO;
import com.get.domain.SwUserBasicDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwEvangelistService;
import com.get.service.SwUserBasicService;
import com.get.service.SwWalletsService;
import com.get.statuc.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.domain.SwEvangelistUserDO;
import com.get.service.SwEvangelistUserService;

/**
 * 用户持有优币金表
 *
 * @author chglee
 * @email sun1920185681@163.com
 * @date 2019-08-22 16:18:09
 */

@Controller
@RequestMapping("/manager/get/swEvangelistUser")
public class SwEvangelistUserController {
    @Autowired
    private SwEvangelistUserService swEvangelistUserService;

    @Autowired
    private SwUserBasicService swUserBasicService;

    @Autowired
    private SwEvangelistService swEvangelistService;

    @Autowired
    private SwWalletsService swWalletsService;

    @GetMapping()
    @RequiresPermissions("get:swEvangelistUser:swEvangelistUser")
    public String SwEvangelistUser() {
        return "get/swEvangelistUser/swEvangelistUser";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("get:swEvangelistUser:swEvangelistUser")
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
        List<SwEvangelistUserDO> swEvangelistUserList = swEvangelistUserService.list(query);
        int total = swEvangelistUserService.count(query);
        PageUtils pageUtils = new PageUtils(swEvangelistUserList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("get:swEvangelistUser:add")
    String add() {
        return "get/swEvangelistUser/add";
    }

    @GetMapping("/edit/{tid}")
    @RequiresPermissions("get:swEvangelistUser:edit")
    String edit(@PathVariable("tid") String tid, Model model) {
            SwEvangelistUserDO swEvangelistUser = swEvangelistUserService.get(tid);
        model.addAttribute("swEvangelistUser", swEvangelistUser);
        return "get/swEvangelistUser/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("get:swEvangelistUser:add")
    public R save(SwEvangelistUserDO swEvangelistUser) {
        try {
            if(swEvangelistUser.getUserId() == null){
                return R.error("该用户不存在");
            }
            SwUserBasicDO swUserBasicDO = swUserBasicService.get(swEvangelistUser.getUserId());
            if(swUserBasicDO == null){
                return R.error("该用户不存在");
            }
            if(!swUserBasicDO.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
                return R.error("该用户不是布道者，无法获得优币金");
            }
            SwEvangelistUserDO hisEvangelist = swEvangelistUserService.getByUserId(swEvangelistUser.getUserId(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
            if(hisEvangelist != null){
                return R.error("该用户已拥有激活的优币金");
            }
            SwEvangelistDO swEvangelistDO = swEvangelistService.get(swEvangelistUser.getEvangelistId());
            SwWalletsDO wallet = swWalletsService.getWallet(swEvangelistUser.getUserId(), swEvangelistDO.getCoinTypeId());
            //余额不足
            if(wallet != null && wallet.getCurrency().compareTo(new BigDecimal(String.valueOf(swEvangelistDO.getEvangelistNum()))) < 0){
                return R.error("余额不足");
            }
            BigDecimal multiply = new BigDecimal(String.valueOf(swEvangelistDO.getEvangelistNum()))
                    .multiply(new BigDecimal(String.valueOf(swEvangelistDO.getPercent())))
                    .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model);
            swEvangelistUser.setTid(IDUtils.randomStr());
            swEvangelistUser.setCreateDate(new Date());
            swEvangelistUser.setUpdateDate(new Date());
            swEvangelistUser.setDelFlag(CommonStatic.NOTDELETE);
            swEvangelistUser.setUserId(swEvangelistUser.getUserId());
            swEvangelistUser.setStatus(CommonStatic.NO_RELEASE);
            swEvangelistUser.setTotalNum(multiply.doubleValue());
            swEvangelistUser.setLeftNum(multiply.doubleValue());
            if (swEvangelistUserService.save(swEvangelistUser) > 0) {
                return R.ok();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("get:swEvangelistUser:edit")
    public R update(SwEvangelistUserDO swEvangelistUser) {
        swEvangelistUser.setUpdateDate(new Date());
            swEvangelistUserService.update(swEvangelistUser);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelistUser:remove")
    public R remove( String tid) {
        if (swEvangelistUserService.remove(tid) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("get:swEvangelistUser:batchRemove")
    public R remove(@RequestParam("ids[]") String[]tids) {
            swEvangelistUserService.batchRemove(tids);
        return R.ok();
    }

}
