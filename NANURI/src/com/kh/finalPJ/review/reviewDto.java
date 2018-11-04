package com.kh.finalPJ.review;

import java.io.Serializable;


/*
DROP TABLE REVIEW
CASCADE CONSTRAINTS;

CREATE TABLE REVIEW(
SEQ NUMBER(8) PRIMARY KEY,         
ID VARCHAR2(50) NOT NULL,         
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
WDATE DATE NOT NULL,
DEL NUMBER(1) NOT NULL,
G_CODE VARCHAR2(50) NOT NULL, 
RATING NUMBER(10) NOT NULL
);

CREATE SEQUENCE SEQ_R
START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SEQ_R;
*/
public class reviewDto implements Serializable{

	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int del;
	private String g_code;
	private int rating;
	private String g_img;
	
	public reviewDto() {
		
	}

	public reviewDto(int seq, String id, String title, String content, String wdate, int del, String g_code, int rating,
			String g_img) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.g_code = g_code;
		this.rating = rating;
		this.g_img = g_img;
	}

	@Override
	public String toString() {
		return "reviewDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", del=" + del + ", g_code=" + g_code + ", rating=" + rating + ", g_img=" + g_img + "]";
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

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getG_img() {
		return g_img;
	}

	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	
}
