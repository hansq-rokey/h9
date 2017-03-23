package com.ibaixiong.mall.exception;

/**
 * 沒有找到订单信息
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年10月27日
 *
 */
public class NotFindOrderException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2303052077054185744L;

	public NotFindOrderException() {
		super();
	}

	public NotFindOrderException(String message) {
		super(message);
	}

	public NotFindOrderException(Throwable cause) {
		super(cause);
	}

	public NotFindOrderException(String message, Throwable cause) {
		super(message, cause);
	}

}
