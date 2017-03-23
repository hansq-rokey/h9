package com.ibaixiong.mall.exception;

/**
 * 商品下没有找到该规格
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年10月27日
 *
 */
public class ProductFormatNotMatchException extends RuntimeException {

	/**
	 * 商品下没有找到该规格或该规格商品已下架
	 */
	private static final long serialVersionUID = 2303052077054185744L;

	public ProductFormatNotMatchException() {
		super();
	}

	public ProductFormatNotMatchException(String message) {
		super(message);
	}

	public ProductFormatNotMatchException(Throwable cause) {
		super(cause);
	}

	public ProductFormatNotMatchException(String message, Throwable cause) {
		super(message, cause);
	}

}
