package com.ibaixiong.mall.model;

/**
 * created by 重剑 on 2015/8/24
 *
 * 订单状态的枚举
 *
 */
public enum ServiceTypeEnum {
	
	/*退货*/
	BACK(1),
	/*换货*/
	EXCHANGE(2),
	/*维修*/
	REPAIR(3);
    public byte getCode() {
        return this.code;
    }

    private byte code;


    private ServiceTypeEnum(int code) {
        this.code = (byte)code;
    }
}
