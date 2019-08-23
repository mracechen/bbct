package com.system.language.domain;

/**
 * @author sunYaLong
 * @data 2018/9/7
 */
public class TranslateResultPO {

    /**
     * 翻译原语言标识
     */
    private String from;

    /**
     * 翻译目标语言标识
     */
    private String to;

    /**
     * 翻译后的对象
     */
    private TranslateResultPO.Trans[] trans_result;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Trans[] getTrans_result() {
        return trans_result;
    }

    public void setTrans_result(Trans[] trans_result) {
        this.trans_result = trans_result;
    }

    public static class Trans {

        /**
         * 翻译前的值
         */
        private String src;

        /**
         * 翻译后的值
         */
        private String dst;

        public String getSrc() {
            return src;
        }

        public void setSrc(String src) {
            this.src = src;
        }

        public String getDst() {
            return dst;
        }

        public void setDst(String dst) {
            this.dst = dst;
        }
    }
}
