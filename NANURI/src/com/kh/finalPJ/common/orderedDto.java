package com.kh.finalPJ.common;

public class orderedDto {
	private String id; 
	private String g_code;
	private String amount;
	private String month;
	private String resultnum;
	public orderedDto() {
		super();
	}
	public orderedDto(String id, String g_code, String amount, String month, String resultnum) {
		super();
		this.id = id;
		this.g_code = g_code;
		this.amount = amount;
		this.month = month;
		this.resultnum = resultnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getResultnum() {
		return resultnum;
	}
	public void setResultnum(String resultnum) {
		this.resultnum = resultnum;
	}
	@Override
	public String toString() {
		return "orderedDto [id=" + id + ", g_code=" + g_code + ", amount=" + amount + ", month=" + month
				+ ", resultnum=" + resultnum + "]";
	}
	
	

}
