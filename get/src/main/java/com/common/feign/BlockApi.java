package com.common.feign;

import com.alibaba.fastjson.JSONObject;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@FeignClient(name = "bbct-Block",url = "${configs.blockChain.url}",fallback = BlockApiRollback.class)
public interface BlockApi {

    /**
     * 获取所有地址对应的uid
     * */
    @RequestMapping(value = "/bbct/getaddresseswithuid", method = RequestMethod.GET)
    JSONObject getAddressesWithUid();

    /**
     * 为用户获取对应的ETH地址
     * */
    @RequestMapping(value = "/bbct/getnewaddress", method = RequestMethod.POST)
    JSONObject getNewAddress(@RequestBody Map<String,Object> params);

    /**
     * 提现eth
     * */
    @RequestMapping(value = "/bbct/sendeth", method = RequestMethod.POST)
    JSONObject sendETH(@RequestBody Map<String,Object> params);

    /**
     * 查询eth的被提现地址和归集地址的余额
     * */
    @RequestMapping(value = "/bbct/getethcfgaddressbalance", method = RequestMethod.GET)
    JSONObject getETHCfgAddressBalance();

    /**
     * 获取服务器中的eth余额
     * */
    @RequestMapping(value = "/bbct/getethbalance", method = RequestMethod.POST)
    JSONObject getETHBalance(@RequestBody Map<String,Object> params);

    /**
     * 归集所有的eth
     * */
    @RequestMapping(value = "/bbct/collectiveeth", method = RequestMethod.POST)
    JSONObject collectiveETH();

    /**
     * 提现ERC代币
     * */
    @RequestMapping(value = "/bbct/senderc", method = RequestMethod.POST)
    JSONObject sendERC(@RequestBody Map<String,Object> params);

    /**
     * 查询eth的被提现地址和归集地址的余额
     * */
    @RequestMapping(value = "/bbct/geterccfgaddressbalance", method = RequestMethod.POST)
    JSONObject getERCCfgAddressBalance(@RequestBody Map<String,Object> params);

    /**
     * 查看某个币种所有账户的余额
     * */
    @RequestMapping(value = "/bbct/getercbalance", method = RequestMethod.POST)
    JSONObject getERCBalance(@RequestBody Map<String,Object> params);

    /**
     * 给具有某个币种的账户充值手续费，以便归集
     * */
    @RequestMapping(value = "/bbct/chargefeeforerc", method = RequestMethod.POST)
    JSONObject chargeFeeForERC(@RequestBody Map<String,Object> params);

    /**
     * 归集某个币种
     * */
    @RequestMapping(value = "/bbct/collectiveerc", method = RequestMethod.POST)
    JSONObject collectiveERC(@RequestBody Map<String,Object> params);
}