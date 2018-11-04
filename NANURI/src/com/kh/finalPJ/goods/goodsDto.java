package com.kh.finalPJ.goods;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE NA_GOODS(
    G_NAME VARCHAR2(50) NOT NULL,
    G_CODE VARCHAR2(50) PRIMARY KEY,
    G_IMG VARCHAR2(50),
    G_PRICE NUMBER(8) NOT NULL
);
	
INSERT INTO GOODS VALUES('스토케 익스플로리','BC1111',NULL,55000)
*/

public class goodsDto {
	private String g_name;
	private String g_code;
	private String g_img;
	private int g_price;
	private int g_quantity;
	
	private MultipartFile g_imgF;
	
	public goodsDto() {
		super();
	}
	
	public goodsDto(String g_name, String g_code, String g_img, int g_price, int g_quantity, MultipartFile g_imgF) {
		super();
		this.g_name = g_name;
		this.g_code = g_code;
		this.g_img = g_img;
		this.g_price = g_price;
		this.g_quantity = g_quantity;
		this.g_imgF = g_imgF;
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
	public String getG_img() {
		return g_img;
	}
	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	public int getG_price() {
		return g_price;
	}
	public void setG_price(int g_price) {
		this.g_price = g_price;
	}
	
	public int getG_quantity() {
		return g_quantity;
	}

	public void setG_quantity(int g_quantity) {
		this.g_quantity = g_quantity;
	}

	public MultipartFile getG_imgF() {
		return g_imgF;
	}

	public void setG_imgF(MultipartFile g_imgF) {
		this.g_imgF = g_imgF;
	}

	@Override
	public String toString() {
		return "goodsDto [g_name=" + g_name + ", g_code=" + g_code + ", g_img=" + g_img + ", g_price=" + g_price
				+ ", g_quantity=" + g_quantity + ", g_imgF=" + g_imgF + "]";
	}
}
