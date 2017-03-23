package com.ibaixiong.mall.model;

public enum MaterialDisplayEnum {
	B("b"),
	C("c");
	
	private String display;

	private MaterialDisplayEnum(String display) {
		this.display = display;
	}

	public String getDisplay() {
		return display;
	}
}
