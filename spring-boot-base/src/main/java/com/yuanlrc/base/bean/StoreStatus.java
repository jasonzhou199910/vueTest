package com.yuanlrc.base.bean;

public enum StoreStatus {
	RENTED(1,"已租"),
	REVOKE(2,"撤销"),
	RELEASE(3,"发布中");

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

	StoreStatus(int code, String value) {
		this.code = code;
		this.value = value;
	}
}
