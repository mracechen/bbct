package com.get.service.impl;

import com.alibaba.fastjson.JSON;
import com.common.utils.IDUtils;
import com.common.utils.MyMD5Utils;
import com.common.utils.Result;
import com.common.utils.blockChain.BaseParamEntity;
import com.common.utils.blockChain.RegisterParanEntity;
import com.get.domain.*;
import com.get.service.*;
import com.get.statuc.CommonStatic;
import com.system.sysconfig.configbean.SettlementCommonConfig;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

import com.get.dao.SwUserBasicDao;
import org.springframework.transaction.annotation.Transactional;


@Service
@Component
public class SwUserBasicServiceImpl implements SwUserBasicService {
    @Autowired
    private SwUserBasicDao swUserBasicDao;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwCoinTypeService swCoinTypeService;

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

    @Autowired
    private SwPartnerService swPartnerService;

    @Value("${configs.blockChain.url}")
    private String blockChainUrl;

    @Value("${configs.blockChain.method.insertMemo}")
    private String insertMemoMethod;

    private Log log = LogFactory.getLog(SwUserBasicServiceImpl.class);

    @Override
    public SwUserBasicDO get(Integer tid) {
        return swUserBasicDao.get(tid);
    }

    @Override
    public SwUserBasicDO getByEmail(String email) {
        return swUserBasicDao.getByEmail(email);
    }

    @Override
    public List<Integer> getByIds(List<Integer> ids){
        return swUserBasicDao.getByIds(ids);
    }

    @Override
    public SwUserBasicDO get(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.getByUserBasic(swUserBasic);
    }

    @Override
    public List<SwUserBasicDO> findRecommenders(Integer userId, Integer generate) {
        return swUserBasicDao.findRecommenders(userId,generate);
    }

    @Override
    public Boolean checkTradingPassword(Integer userId, String email, String sPassword){
        Map<String, Object> queryparams = new HashMap<>();
        String password = MyMD5Utils.encodingAdmin(sPassword);
        queryparams.put("highPass", password);
        queryparams.put("tid", userId);
        queryparams.put("email", email);
        List<SwUserBasicDO> list = this.list(queryparams);
        if (list.size() == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Object userReg(SwUserBasicDO userBasicDO) throws Exception{
        userBasicDO.setLoginPass(MyMD5Utils.encodingAdmin(userBasicDO.getLoginPass()));
        userBasicDO.setCreateDate(new Date());
        userBasicDO.setUpdateDate(new Date());
        userBasicDO.setDelFlag(CommonStatic.NOTDELETE);
        save(userBasicDO);
        HttpPost post = new HttpPost(blockChainUrl);
        RegisterParanEntity params = new RegisterParanEntity();
        params.setUserId(userBasicDO.getTid());
        BaseParamEntity baseParamEntity = new BaseParamEntity(insertMemoMethod,params);
        StringEntity entity = new StringEntity(JSON.toJSONString(baseParamEntity));
        post.setHeader("Content-Type", "application/json;charset=utf8");
        post.setEntity(entity);
        log.info("注册用户，将userID["+userBasicDO.getTid()+"]传给区块链");
        CloseableHttpResponse response = HttpClientBuilder.create().build().execute(post);
        Boolean resultStatus = false;
        if(response.getStatusLine() != null){
            int statusCode = response.getStatusLine().getStatusCode();
            if(statusCode == 200){
                resultStatus = true;
            }
        }
        if(!resultStatus){
            throw new Exception("区块链注册用户失败！");
        }
        Map<String, Object> queryParam = new HashMap<>();
        queryParam.put("email", userBasicDO.getEmail());
        List<SwUserBasicDO> list = swUserBasicDao.list(queryParam);
        SwUserBasicDO user = list.get(0);
        //取出数据库所有币种，每个币种均给他创建一个钱包
        queryParam.clear();
        queryParam.put("delFlag", CommonStatic.NOTDELETE);
        queryParam.put("enable", "0");
        Map<String, String> coinTypeResult = new HashMap<>();
        List<SwCoinTypeDO> list1 = swCoinTypeService.list(queryParam);
        for (SwCoinTypeDO swCoinTypeDO : list1) {
            coinTypeResult.put(swCoinTypeDO.getTid(), swCoinTypeDO.getCoinName());
        }
        Iterator<Map.Entry<String, String>> iterator = coinTypeResult.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry entry = iterator.next();
            Object objKey = entry.getKey();
            if(objKey != null){
                Object objValue = entry.getValue();
                String coinTypeId = objKey.toString();
                if(objValue != null){
                    SwWalletsDO nonemWall = swWalletsService.createWallet(userBasicDO.getTid(),coinTypeId);
                    swWalletsService.save(nonemWall);
                }
            }
        }

        user.setUsername("sz" + user.getTid());
        swUserBasicDao.update(user);
        return Result.ok();
    }

    @Override
    public List<SwUserBasicDO> list(Map<String, Object> map) {
        return swUserBasicDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swUserBasicDao.count(map);
    }

    @Override
    public int save(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.save(swUserBasic);
    }

    @Override
    public int update(SwUserBasicDO swUserBasic) {
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int adminUpdate(SwUserBasicDO swUserBasic) {
        SwUserBasicDO swUserBasicDO = this.get(swUserBasic.getTid());
        if(swUserBasic.getUserType() != null && !swUserBasic.getUserType().equals(swUserBasicDO.getUserType())){
            if(swUserBasic.getUserType().equals(CommonStatic.USER_TYPE_PARTNER)){
                Boolean allow = true;
                if(swUserBasicDO.getRecomId() != 1){
                    allow = false;
                }
                List<SwPrincipalUserDO> swPrincipalUserDOS = swPrincipalUserService.getByUserId(swUserBasic.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPrincipalUserDOS != null && swPrincipalUserDOS.size() > 0){
                    allow = false;
                }
                List<SwCurrentUserDO> swCurrentUserDOS = swCurrentUserService.getByUserId(swUserBasic.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swCurrentUserDOS != null && swCurrentUserDOS.size() > 0){
                    allow = false;
                }
                List<SwPeriodUserDO> swPeriodUserDOS = swPeriodUserService.getByUserId(swUserBasic.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPeriodUserDOS != null && swPeriodUserDOS.size() > 0){
                    allow = false;
                }
                SwEvangelistUserDO swEvangelistUserDO = swEvangelistUserService.getByUserId(swUserBasic.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swEvangelistUserDO != null){
                    allow = false;
                }
                SwPartnerUserDO swPartnerUserDO = swPartnerUserService.getByUserId(swUserBasic.getTid(), CommonStatic.NO_RELEASE, CommonStatic.NOTDELETE);
                if(swPartnerUserDO != null){
                    allow = false;
                }
                if(allow){
                    Map<String,Object> param = new HashMap<>();
                    param.put("delFlag",CommonStatic.NOTDELETE);
                    List<SwPartnerDO> list = swPartnerService.list(param);
                    if(list != null && list.size() == 1){
                        SwPartnerDO swPartnerDO = list.get(0);
                        SwPartnerUserDO swPartnerUser = new SwPartnerUserDO();
                        swPartnerUser.setTid(IDUtils.randomStr());
                        swPartnerUser.setCreateDate(new Date());
                        swPartnerUser.setUpdateDate(new Date());
                        swPartnerUser.setDelFlag(CommonStatic.NOTDELETE);
                        swPartnerUser.setUserId(swUserBasic.getTid());
                        swPartnerUser.setPartnerId(swPartnerDO.getTid());
                        swPartnerUser.setStatus(CommonStatic.NO_RELEASE);
                        double userTotal = new BigDecimal(
                                String.valueOf(swPartnerDO.getPartnerNum() == null ? 0 : swPartnerDO.getPartnerNum())
                        ).multiply(
                                new BigDecimal(String.valueOf(swPartnerDO.getPercent() == null ? 0 : swPartnerDO.getPercent()))
                        ).doubleValue();
                        swPartnerUser.setTotalNum(userTotal);
                        swPartnerUser.setLeftNum(userTotal);
                        swPartnerUserService.save(swPartnerUser);
                    }
                }else{
                    return -1;
                }
            }else if(swUserBasic.getUserType().equals(CommonStatic.USER_TYPE_EVANGELIST)){
                return -1;
            }
        }
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    public int remove(Integer tid) {
        SwUserBasicDO swUserBasic = new SwUserBasicDO();
        swUserBasic.setDelFlag(CommonStatic.DELETE);
        swUserBasic.setTid(tid);
        return swUserBasicDao.update(swUserBasic);
    }

    @Override
    public int batchRemove(Integer[]tids) {
        int count = 0;
        for(Integer ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

    @Override
    public Integer getChildrenUserNum(Integer userId) {
        Map<String,Object> params = new HashMap<>();
        params.put("recomId",userId);
        List<SwUserBasicDO> list = this.list(params);
        return list.size();
    }

    @Override
    public Integer getChildrenTreeUserNum(Integer userId) {
        Integer totalNum = 0;
        List<Integer> params = new ArrayList<>();
        params.add(userId);
        Boolean run = true;
        while(run){
            List<Integer> byIds = swUserBasicDao.getChildrenByIds(params);
            if(byIds.size() == 0){
                run = false;
            }else{
                totalNum += byIds.size();
                params.clear();
                params.addAll(byIds);
            }
        }
        return totalNum;
    }

    @Override
    public Object getUserRecomLike(SwUserBasicDO swUserBasic) {
        Map<String,Object> result = new HashMap();
        SettlementCommonConfig commonConfig = new SettlementCommonConfig();
        String fieldValue = commonConfig.getWebsiteURL().getFieldValue() +"/#/pages/login/register?recomId="+swUserBasic.getTid();
        try {
            result.put("userPushURL", fieldValue);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
