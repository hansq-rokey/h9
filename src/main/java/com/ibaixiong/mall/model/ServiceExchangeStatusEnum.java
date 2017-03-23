package com.ibaixiong.mall.model;

/**
 * created by 重剑 on 2015/8/30 0030
 *
 * 订单条目的状态（退货）
 *
 */
public enum ServiceExchangeStatusEnum {

    /* 提交申请 */
    EXCHANGE_APPLY(10),

    /* 审核中 */
    EXCHANGE_CHECK(20),

    /* 待处理 */
    EXCHANGE_AGREE_REFUSE(30),

    /* 同意 */
    EXCHANGE_AGREE(31),

    /* 拒绝 */
    EXCHANGE_REFUSE(32),

    /* 配货中 */
    EXCHANGE_PACKING(40),

    /* 已发货*/
    EXCHANGE_SENDED(50);

    public byte getCode() {
        return this.code;
    }

    private byte code;


    private ServiceExchangeStatusEnum(int code) {
        this.code = (byte) code;
    }

}
