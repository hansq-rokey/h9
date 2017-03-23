package com.ibaixiong.mall.model;

/**
 * created by 重剑 on 2015/8/30 0030
 *
 * 订单条目的状态（换货、退货、维修）
 *
 */
public enum OrderItemStatusEnum {

    /* 申请换货待审核 */
    EXCHANGE_APPLY(5),

    /* 申请换货并已通过审核 */
    EXCHANGE_AGREED(6),

    /* 申请换货已通货审核并开始配货 */
    EXCHANGE_PREPARING(7),

    /* 申请换货已通过审核并已发货 */
    EXCHANGE_SENT(8),

    /* 申请退货待审核 */
    BACK_APPLY(9),

    /* 申请退货并已通过审核 */
    BACK_AGREED(10),

    /* 申请退货已通货审核并开始配货 */
    BACK_PREPARING(11),

    /* 申请退货已通过审核并已发货 */
    BACK_SENT(12);

    public byte getCode() {
        return this.code;
    }

    private byte code;


    private OrderItemStatusEnum(int code) {
        this.code = (byte) code;
    }

}
