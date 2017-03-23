package com.ibaixiong.mall.model;

/**
 * created by 重剑 on 2015/8/30 0030
 *
 * 订单条目的状态（退货）
 *
 */
public enum ServiceRepairStatusEnum {

    /* 提交申请 */
    REPAIR_APPLY(10),

    /* 待签收 */
    REPAIR_WAIT_SIGN(20),

    /* 审核中 */
    REPAIR_CHECK(30),

    /* 申请换货已通过审核并已发货 */
    REPAIR_AGREE_REFUSE(40),

    /* 同意 */
    REPAIR_AGREE(41),

    /* 拒绝 */
    REPAIR_REFUSE(42),

    /* 维修中 */
    REPAIR_REPAIRING(50),

    /* 已退款 */ 
    REPAIR_SENDED(60),

    /*已签收*/
    REPAIR_SIGNED(70);
    
    public byte getCode() {
        return this.code;
    }

    private byte code;


    private ServiceRepairStatusEnum(int code) {
        this.code = (byte) code;
    }

}
