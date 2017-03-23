package com.ibaixiong.mall.exception;

/**
 * 沒有找到订单物流信息
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年10月27日
 *
 */
public class NotFindLogisticsOrderException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2303052077054185744L;

	public NotFindLogisticsOrderException() {
		super();
	}

	public NotFindLogisticsOrderException(String message) {
		super(message);
	}

	public NotFindLogisticsOrderException(Throwable cause) {
		super(cause);
	}

	public NotFindLogisticsOrderException(String message, Throwable cause) {
		super(message, cause);
	}

}
