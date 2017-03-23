package com.ibaixiong.mall.exception;

/**
 * 沒有找到产品异常类
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年10月27日
 *
 */
public class NotFindProductException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2303052077054185744L;

	public NotFindProductException() {
		super();
	}

	public NotFindProductException(String message) {
		super(message);
	}

	public NotFindProductException(Throwable cause) {
		super(cause);
	}

	public NotFindProductException(String message, Throwable cause) {
		super(message, cause);
	}

}
