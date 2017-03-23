package com.ibaixiong.mall.model;

/**
 * created by 重剑 on 2015/8/24
 *
 * 订单状态的枚举
 *
 */
public enum OrderStatusEnum {

    /* 待付款 */
    OBLIGATION(10),

    /* 已付款（交易中） */
    PAID(20),
    
    /*配货（交易中）*/
    PICKING(30),
    
    /*发货（交易中）*/
    SIPPING(40),
    
    /* 交易完成 */
    COMPLETED(50),

    /* 订单已关闭 */
    CLOSED(60),
    
    /**售后服务中*/
    AFTERSALE(70);


    public byte getCode() {
        return this.code;
    }

    private byte code;


    private OrderStatusEnum(int code) {
        this.code = (byte)code;
    }
}
