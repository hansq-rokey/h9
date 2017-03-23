package com.ibaixiong.mall.exception;

/**
 * 支付异常
 * 
 * @author chenzehe
 * @Email chenzehe@ibaixiong.com
 * @Description TODO
 * @date 2015年12月7日
 *
 */
public class PayException extends RuntimeException {

	private static final long serialVersionUID = 8872387793918832483L;

	public PayException() {
		super();
	}

	public PayException(String message) {
		super(message);
	}

	public PayException(Throwable cause) {
		super(cause);
	}

	public PayException(String message, Throwable cause) {
		super(message, cause);
	}

}
