package com.ibaixiong.mall.exception;

/**
 * 创建订单失败
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年10月27日
 *
 */
public class CreateOrderFailedException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2303052077054185744L;

	public CreateOrderFailedException() {
		super();
	}

	public CreateOrderFailedException(String message) {
		super(message);
	}

	public CreateOrderFailedException(Throwable cause) {
		super(cause);
	}

	public CreateOrderFailedException(String message, Throwable cause) {
		super(message, cause);
	}

}
