package com.kh.finalPJ.member;

public class basketListDto {

	private int seq;
	private String id;
	private String g_img;
	private String g_name;
	private String g_code;
	private int amount;
	private int month;
	private int sum_price;

	public basketListDto() {

	}

	public basketListDto(int seq, String id, String g_img, String g_name, String g_code, int amount, int month,
			int sum_price) {
		super();
		this.seq = seq;
		this.id = id;
		this.g_img = g_img;
		this.g_name = g_name;
		this.g_code = g_code;
		this.amount = amount;
		this.month = month;
		this.sum_price = sum_price;
	}

	@Override
	public String toString() {
		return "basketListDto [seq=" + seq + ", id=" + id + ", g_img=" + g_img + ", g_name=" + g_name + ", g_code="
				+ g_code + ", amount=" + amount + ", month=" + month + ", sum_price=" + sum_price + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getG_img() {
		return g_img;
	}

	public void setG_img(String g_img) {
		this.g_img = g_img;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getSum_price() {
		return sum_price;
	}

	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}
}
