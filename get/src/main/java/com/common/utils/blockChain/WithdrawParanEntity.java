package com.common.utils.blockChain;

import lombok.Data;

@Data
public class WithdrawParanEntity {
    public String address;
    public String targetCoin;
    public String userId;
}