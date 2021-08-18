package com.yuanlrc.base.bean;

public enum OrderStatus {
	RELEASE(1,"发布中"),
	RECEIVED(2,"已接单"),
	COMPLETED(3,"已完成"),
	INCOMPLETE(4,"未完成");
	private int code;

	private String value;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	OrderStatus(int code, String value) {
		this.code = code;
		this.value = value;
	}
}
