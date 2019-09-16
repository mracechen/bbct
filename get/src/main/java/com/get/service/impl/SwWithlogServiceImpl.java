package com.get.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.common.utils.IDUtils;
import com.common.utils.StringUtils;
import com.common.utils.blockChain.BaseParamEntity;
import com.common.utils.blockChain.RegisterParanEntity;
import com.common.utils.blockChain.WithdrawParanEntity;
import com.get.domain.SwAccountRecordDO;
import com.get.domain.SwCoinTypeDO;
import com.get.domain.SwWalletsDO;
import com.get.service.SwAccountRecordService;
import com.get.service.SwCoinTypeService;
import com.get.service.SwWalletsService;
import com.get.statuc.CommonStatic;
import com.get.statuc.NumberStatic;
import com.get.statuc.RecordEnum;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.get.dao.SwWithlogDao;
import com.get.domain.SwWithlogDO;
import com.get.service.SwWithlogService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SwWithlogServiceImpl implements SwWithlogService {
    @Autowired
    private SwWithlogDao swWithlogDao;

    @Autowired
    private SwWithlogService swWithlogService;

    @Autowired
    private SwWalletsService swWalletsService;

    @Autowired
    private SwAccountRecordService swAccountRecordService;

    @Autowired
    private SwCoinTypeService swCoinTypeService;

    @Value("${configs.blockChain.url}")
    private String blockChainUrl;

    @Value("${configs.blockChain.method.withdraw}")
    private String withdraw;

    @Value("${configs.withdrawFee}")
    private Double withdrawFee;

    private Log log = LogFactory.getLog(SwUserBasicServiceImpl.class);

    @Override
    public SwWithlogDO get(String tid) {
        return swWithlogDao.get(tid);
    }

    @Override
    public SwWithlogDO getByTxid(String txid) {
        return swWithlogDao.getByTxid(txid);
    }

    @Override
    public List<SwWithlogDO> list(Map<String, Object> map) {
        return swWithlogDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return swWithlogDao.count(map);
    }

    @Override
    public int save(SwWithlogDO swWithlog) {
        return swWithlogDao.save(swWithlog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int update(SwWithlogDO swWithlog) {
        return swWithlogDao.update(swWithlog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int withlogCompleted(SwWithlogDO swWithlog) throws Exception{
        if(swWithlog.getStatus().equals(CommonStatic.TRANSFER_SUCCESS)){
            SwWalletsDO wallet = swWalletsService.getWallet(swWithlog.getUserId(), swWithlog.getCoinTypeId());
            if(wallet == null){
                throw new Exception("钱包异常");
            }
            BigDecimal currency = wallet.getCurrency();
            wallet.setCurrency(new BigDecimal("0").subtract(swWithlog.getAmount()));
            wallet.setUpdateDate(new Date());
            swWalletsService.update(wallet);
            swAccountRecordService.save(SwAccountRecordDO.create(
                    swWithlog.getUserId(),
                    RecordEnum.withdraw.getType(),
                    RecordEnum.withdraw.getDesc(),
                    swWithlog.getCoinTypeId(),
                    new BigDecimal("0").subtract(swWithlog.getAmount()).doubleValue(),
                    currency.subtract(swWithlog.getAmount()).doubleValue()
            ));
        }
        return swWithlogDao.update(swWithlog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int check(SwWithlogDO swWithlog) throws Exception{
        synchronized (this){
            SwWithlogDO swWithlogDO = this.get(swWithlog.getTid());
            if(withdrawFee > swWithlog.getAmount().doubleValue()){
                swWithlogDO.setEx2(CommonStatic.CHECK_FAILED);
                swWithlogDO.setStatus(CommonStatic.TRANSFER_FAILED);
                log.error("提现余额不足！");
            }else{
                if(swWithlog.getEx2() != null){
                    if(swWithlog.getEx2().equals("1")){

                        swWithlogDO.setEx2(CommonStatic.CHECK_SUCCESS);
                        SwCoinTypeDO swCoinTypeDO = swCoinTypeService.get(swWithlogDO.getCoinTypeId());
                        HttpPost post = new HttpPost(blockChainUrl);
                        WithdrawParanEntity params = new WithdrawParanEntity();
                        params.setUserId(String.valueOf(swWithlogDO.getUserId()));
                        params.setAddress(swWithlogDO.getAddress());
                        StringBuilder stringBuilder = new StringBuilder(new BigDecimal(String.valueOf(swWithlogDO.getAmount()))
                                .setScale(NumberStatic.BigDecimal_Scale_Num,NumberStatic.BigDecimal_Scale_Model)
                                .toString());
                        stringBuilder.append(" ");
                        stringBuilder.append(swCoinTypeDO.getCoinName());
                        params.setTargetCoin(stringBuilder.toString());
                        BaseParamEntity baseParamEntity = new BaseParamEntity(withdraw,params);
                        StringEntity entity = new StringEntity(JSON.toJSONString(baseParamEntity));
                        post.setHeader("Content-Type", "application/json;charset=utf8");
                        post.setEntity(entity);
                        log.info("用户【"+swWithlogDO.getUserId()+"】发起"+swCoinTypeDO.getCoinName()+"提现，金额:"+swWithlogDO.getAmount());
                        CloseableHttpResponse response = HttpClientBuilder.create().build().execute(post);
                        Boolean resultStatus = false;
                        if(response.getStatusLine() != null){
                            int statusCode = response.getStatusLine().getStatusCode();
                            if(statusCode == 200){
                                String s = EntityUtils.toString(response.getEntity());
                                JSONObject body = JSON.parseObject(s);
                                Object errorInfo = body.get("error");
                                if(errorInfo == null || errorInfo == "null"){
                                    Object result1 = body.get("result");
                                    if(result1 != null){
                                        JSONObject result = JSON.parseObject(result1.toString());
                                        Object txidObj = result.get("txid");
                                        if(txidObj != null){
                                            String txid = txidObj.toString();
                                            swWithlogDO.setTxid(txid);
                                            resultStatus = true;
                                        }else{
                                            throw new Exception("提币失败！");
                                        }
                                    }
                                }
                            }
                        }
                        if(!resultStatus){
                            throw new Exception("提币失败！");
                        }
                    }else{
                        swWithlogDO.setEx2(CommonStatic.CHECK_FAILED);
                        swWithlogDO.setStatus(CommonStatic.TRANSFER_FAILED);
                    }
                }
            }
            return swWithlogDao.update(swWithlogDO);
        }
    }

    @Override
    public int remove(String tid) {
        SwWithlogDO swWithlog = new SwWithlogDO();
        swWithlog.setDelFlag(CommonStatic.DELETE);
        swWithlog.setTid(tid);
        return swWithlogDao.update(swWithlog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void withdraw(Integer userId, String address, Double amount, String coinName) throws Exception{
        SwCoinTypeDO byCoinName = swCoinTypeService.getByCoinName(coinName);
        SwWithlogDO swWithlogDO = new SwWithlogDO();
        swWithlogDO.setTid(IDUtils.randomStr());
        swWithlogDO.setCreateDate(new Date());
        swWithlogDO.setUpdateDate(new Date());
        swWithlogDO.setDelFlag(CommonStatic.NOTDELETE);
        swWithlogDO.setEx2(CommonStatic.CHECK_WAITING);
        swWithlogDO.setStatus(CommonStatic.TRANSFER_WAITING);
        swWithlogDO.setCoinTypeId(byCoinName.getTid());
        swWithlogDO.setFee(new BigDecimal(String.valueOf(withdrawFee)));
        swWithlogDO.setUserId(userId);
        swWithlogDO.setAmount(new BigDecimal(String.valueOf(amount)));
        swWithlogDO.setAddress(address);
        this.save(swWithlogDO);
    }

    @Override
    public int batchRemove(String[]tids) {
        int count = 0;
        for(String ids : tids){
            count = count + remove(ids);
        }
        return count;
    }

    @Override
    public List<SwWithlogDO> getByIds(List<String> ids) {
        return swWithlogDao.getByIds(ids);
    }

}
