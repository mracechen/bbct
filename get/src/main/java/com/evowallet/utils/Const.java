package com.evowallet.utils;

public class Const {

    public static final String CODE_ORDER_KEY = "CODE_ORDER_KEY-";
    public static final String CODE_ORDER_KEY_COIN = "CODE_ORDER_KEY_COIN-";

    public static final String CODE = "-";

    public static class OrderType{

        public static final int SELL = 1;
        public static final int BUY = 2;

    }

    public static class OrderStatus{
        public static final int ON_CANCAL = 1;
        public static final int ON_PINDINF = 2;
        public static final int ON_TRANSACTION= 3;
        public static final int ON_FINISH= 4;

    }
}
