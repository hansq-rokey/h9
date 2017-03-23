package com.ibaixiong.mall.model;

/**
 * 送货时间
 * @author ywg
 *
 */
public enum SendGoodsValueEnum {

	/**不限*/
	UNLIMITED("1","不限时间，周一到周日"),
	/**工作日*/
	WORKING("2","工作日，周一到周五"),
	/**周末*/
	WEEKEND("3","休息日，周六到周日");
	
	private String code;
	
	private String message;

	private SendGoodsValueEnum(String code, String message) {
		this.code = code;
		this.message = message;
	}
	
	public static SendGoodsValueEnum getSendGoodsValueEnum(String code){
		for(SendGoodsValueEnum sg:SendGoodsValueEnum.values()){
			if(sg.getCode().equals(code)){
				return sg;
			}
		}
		return null;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}
