package com.kh.finalPJ.member;

/*
DROP TABLE R_STATUS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_R_STATUS;

CREATE TABLE R_STATUS(
	    SEQ NUMBER(8) PRIMARY KEY,
	    G_CODE VARCHAR2(50) NOT NULL,
	    ID VARCHAR2(50) NOT NULL,
	    AMOUNT NUMBER(8),
	    S_DATE DATE NOT NULL,
	    E_DATE DATE NOT NULL,
	    TOTAL_PRICE NUMBER(8) NOT NULL,
	    ORDER_NUM VARCHAR(20) NOT NULL
	);

CREATE SEQUENCE SEQ_R_STATUS
START WITH 1 INCREMENT BY 1;

ALTER TABLE R_STATUS
ADD CONSTRAINT FK_ID_03 FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

ALTER TABLE R_STATUS
ADD CONSTRAINT FK_R_G_CODE FOREIGN KEY(G_CODE)
REFERENCES GOODS(G_CODE);

INSERT INTO R_STATUS VALUES(SEQ_R_STATUS.NEXTVAL,'BC1111','user',1,SYSDATE,ADD_MONTHS(to_date(SYSDATE,'YY-MM-DD'),3),65000,S1810241);

INSERT INTO R_STATUS VALUES(SEQ_R_STATUS.NEXTVAL,'BC1112','user',1,SYSDATE,ADD_MONTHS(to_date(SYSDATE,'YY-MM-DD'),1),75000,S1810242);
*/
public class RStatusDto {
	private int seq;
	private String g_code;
	private String g_img;
	private String g_name;
	private String id;
	private int amount;
	private String s_date;
	private String e_date;
	private int total_price;
	private String order_num;

	public RStatusDto() {

	}

	public RStatusDto(String g_code, String id, int amount, String s_date, String e_date, int total_price,
			String order_num) {
		super();
		this.g_code = g_code;
		this.id = id;
		this.amount = amount;
		this.s_date = s_date;
		this.e_date = e_date;
		this.total_price = total_price;
		this.order_num = order_num;
	}

	public RStatusDto(int seq, String g_code, String g_img, String g_name, String id, int amount, String s_date,
			String e_date, int total_price, String order_num) {
		super();
		this.seq = seq;
		this.g_code = g_code;
		this.g_img = g_img;
		this.g_name = g_name;
		this.id = id;
		this.amount = amount;
		this.s_date = s_date;
		this.e_date = e_date;
		this.total_price = total_price;
		this.order_num = order_num;
	}

	@Override
	public String toString() {
		return "RStatusDto [seq=" + seq + ", g_code=" + g_code + ", g_img=" + g_img + ", g_name=" + g_name + ", id="
				+ id + ", amount=" + amount + ", s_date=" + s_date + ", e_date=" + e_date + ", total_price="
				+ total_price + ", order_num=" + order_num + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
}
