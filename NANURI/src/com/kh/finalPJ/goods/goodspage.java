package com.kh.finalPJ.goods;

public class goodspage {
	
	private String startindex;
	private String endindex;
	private String category;
	
	public goodspage() {}
	
	
	public goodspage(String startindex, String endindex) {
		super();
		this.startindex = startindex;
		this.endindex = endindex;
	}
	

	public goodspage(String startindex, String endindex, String category) {
		super();
		this.startindex = startindex;
		this.endindex = endindex;
		this.category = category;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getStartindex() {
		return startindex;
	}


	public void setStartindex(String startindex) {
		this.startindex = startindex;
	}


	public String getEndindex() {
		return endindex;
	}


	public void setEndindex(String endindex) {
		this.endindex = endindex;
	}
	
	
	
}

