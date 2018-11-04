package com.kh.finalPJ.goods;

import java.util.ArrayList;
import java.util.List;

import com.kh.finalPJ.member.RStatusDto;
import com.kh.finalPJ.member.basketDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

public interface goodsDao {

	List<goodsBbsDto> getbbs(String startindex, String endindex, String category);
	
	List<goodsBbsDto> getbbslength();
	
	List<goodsBbsDto> findgoods(String title,String lists,String category);
	
	void readcount(int seq);
	
	goodsBbsDto getgoodsdetail(int seq);
	
	List<reviewDto> getreview_qna(String g_code);
	
	boolean basketinsert(basketDto dto);
	
	List<goodsBbsDto> getbbscategory(String division);
	
	public memberDto selectMember(String id);
	public goodsDto selectGoods(String g_code);
	
	public boolean RStatusInsert(List<RStatusDto> R_Status);
	
	List<goodsBbsDto> headselect(String title);
	
	List<goodsBbsDto> headselectajax(String title);
	
	List<qaDto> getQnAlist_g(String g_code);
	
	public List<Integer> getRef(String id);
	
	public List<Integer> AllgetRef();
	
	 
	 
}
