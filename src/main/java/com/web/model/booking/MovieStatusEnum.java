package com.web.model.booking;

public enum MovieStatusEnum {

	OUT("已下檔"),
	IN("上映中"),
	UN("未上映");

	MovieStatusEnum(String desc) {
		this.desc = desc;
	}

	private String desc;

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
