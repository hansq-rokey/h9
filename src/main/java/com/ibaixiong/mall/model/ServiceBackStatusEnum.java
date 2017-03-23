package com.ibaixiong.mall.model;

/**
 * created by 重剑 on 2015/8/30 0030
 *
 * 订单条目的状态（退货）
 *
 */
public enum ServiceBackStatusEnum {

    /* 提交申请 */
    BACK_APPLY(10),

    /* 待签收 */
    BACK_WAIT_SIGN(20),

    /* 审核中 */
    BACK_CHECK(30),

    /* 申请换货已通过审核并已发货 */
    BACK_AGREE_REFUSE(40),

    /* 同意 */
    BACK_AGREE(41),

    /* 拒绝 */
    BACK_REFUSE(42),

    /* 等待退款 */
    BACK_WAIT_REIMBURSE(50),

    /* 已退款 */
    BACK_REIMBURSED(60);

    public byte getCode() {
        return this.code;
    }

    private byte code;


    private ServiceBackStatusEnum(int code) {
        this.code = (byte) code;
    }

}
