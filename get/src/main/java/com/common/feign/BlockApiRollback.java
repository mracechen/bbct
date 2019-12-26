package com.common.feign;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

public class BlockApiRollback implements BlockApi{
    @Override
    public JSONObject getAddressesWithUid() {
        return null;
    }

    @Override
    public JSONObject getNewAddress(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject sendETH(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject getETHCfgAddressBalance() {
        return null;
    }

    @Override
    public JSONObject getETHBalance(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject collectiveETH() {
        return null;
    }

    @Override
    public JSONObject sendERC(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject getERCCfgAddressBalance(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject getERCBalance(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject chargeFeeForERC(@RequestBody Map<String, Object> params) {
        return null;
    }

    @Override
    public JSONObject collectiveERC(@RequestBody Map<String, Object> params) {
        return null;
    }
}