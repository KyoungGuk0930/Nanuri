package com.kh.finalPJ.member;

/*
DROP TABLE SECESSION
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_SECESSION;

CREATE TABLE SECESSION(
	SEQ NUMBER(8) PRIMARY KEY,
	DEL_ID VARCHAR2(50) NOT NULL,
	DEL_REASON VARCHAR2(200) NOT NULL,
	DEL_SDATE DATE NOT NULL,
	DEL_EDATE DATE NOT NULL,
	STATUS NUMBER(1) NOT NULL
);

  
CREATE SEQUENCE SEQ_SECESSION
START WITH 1 INCREMENT BY 1;
  
INSERT INTO SECESSION VALUES(
SEQ_SECESSION.NEXTVAL,'delete01','delete01',SYSDATE-9,SYSDATE -2,0);

INSERT INTO SECESSION VALUES(
SEQ_SECESSION.NEXTVAL,'delete02','delete02',SYSDATE,SYSDATE+7,0);
*/

public class secessionDto {
	
	private String del_id;
	private String del_reason;
	private String del_sdate;
	private String del_edate;
	private int status;

	
	public secessionDto() {
		super();
	}


	public secessionDto(String del_id, String del_reason, String del_sdate, String del_edate, int status) {
		super();
		this.del_id = del_id;
		this.del_reason = del_reason;
		this.del_sdate = del_sdate;
		this.del_edate = del_edate;
		this.status = status;
	}


	public String getDel_id() {
		return del_id;
	}


	public void setDel_id(String del_id) {
		this.del_id = del_id;
	}


	public String getDel_reason() {
		return del_reason;
	}


	public void setDel_reason(String del_reason) {
		this.del_reason = del_reason;
	}


	public String getDel_sdate() {
		return del_sdate;
	}


	public void setDel_sdate(String del_sdate) {
		this.del_sdate = del_sdate;
	}


	public String getDel_edate() {
		return del_edate;
	}


	public void setDel_edate(String del_edate) {
		this.del_edate = del_edate;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "secessionDto [del_id=" + del_id + ", del_reason=" + del_reason + ", del_sdate=" + del_sdate
				+ ", del_edate=" + del_edate + ", status=" + status + "]";
	}
	
}
