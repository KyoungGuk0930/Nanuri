package com.kh.finalPJ.goods;

import java.io.Serializable;

/*
CREATE TABLE R_BBS(
SEQ NUMBER(8) PRIMARY KEY,
G_CODE VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(50) NOT NULL,
R_DATE DATE NOT NULL,
READCOUNT NUMBER(8) NOT NULL
);

ALTER TABLE R_BBS
ADD CONSTRAINT FK_G_CODE FOREIGN KEY(G_CODE)
REFERENCES GOODS(G_CODE);

CREATE SEQUENCE SEQ_R_BBS
START WITH 1 INCREMENT BY 1;

INSERT INTO NA_R_BBS
VALUES(SEQ_NA_R_BBS.NEXTVAL,22,'하하하하하','굳굳',SYSDATE,0);

*/
public class goodsBbsDto implements Serializable {

	private int rownum;
	
	private int seq;
	private String g_code;
	private String title;
	private String content;
	private String r_date;
	private int g_price;
	private int stardot;
	private int readcount;
	
	// 검색 dto
	private String lists;
	private String category;
	
	// 상품 이미지
	private String g_img;
	
	public goodsBbsDto() {}

	
	

	public goodsBbsDto(int seq, String g_code, String title, String content, String r_date, int g_price, int readcount,
			String g_img) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
		this.g_price = g_price;
		this.readcount = readcount;
		this.g_img = g_img;
	}




	public goodsBbsDto(int seq, String g_code, String title, String content, String r_date, int g_price, String g_img) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
		this.g_price = g_price;
		this.g_img = g_img;
	}




	public goodsBbsDto(String title, String lists) {
		super();
		this.title = title;
		this.lists = lists;
	}

	


	public goodsBbsDto(String title, String lists, String category) {
		super();
		this.title = title;
		this.lists = lists;
		this.category = category;
	}




	public goodsBbsDto(int seq, String g_code, String title, String content, String r_date) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
	}



	public goodsBbsDto(int seq, String g_code, String title, String content, String r_date, int g_price) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
		this.g_price = g_price;
	}


	
	
	
	public goodsBbsDto(int seq, String g_code, String title, String content, String r_date, int g_price, int stardot) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
		this.g_price = g_price;
		this.stardot = stardot;
	}

	
	

	public goodsBbsDto(int seq, String g_code, String title, String content, String r_date, int g_price, int stardot,
			int readcount) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
		this.g_price = g_price;
		this.stardot = stardot;
		this.readcount = readcount;
	}

	
	public goodsBbsDto(int rownum, int seq, String g_code, String title, String content, String r_date, int g_price,
			String g_img) {
		super();
		this.rownum = rownum;
		this.seq = seq;
		this.g_code = g_code;
		this.title = title;
		this.content = content;
		this.r_date = r_date;
		this.g_price = g_price;
		this.g_img = g_img;
	}




	public int getRownum() {
		return rownum;
	}

	


	public String getCategory() {
		return category;
	}




	public void setCategory(String category) {
		this.category = category;
	}




	public void setRownum(int rownum) {
		this.rownum = rownum;
	}




	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public int getStardot() {
		return stardot;
	}

	
	public String getG_img() {
		return g_img;
	}




	public void setG_img(String g_img) {
		this.g_img = g_img;
	}




	public void setStardot(int stardot) {
		this.stardot = stardot;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getLists() {
		return lists;
	}




	public void setLists(String lists) {
		this.lists = lists;
	}




	public String getG_code() {
		return g_code;
	}


	public void setG_code(String g_code) {
		this.g_code = g_code;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getR_date() {
		return r_date;
	}


	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	
	
	

	public int getG_price() {
		return g_price;
	}


	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	
}
