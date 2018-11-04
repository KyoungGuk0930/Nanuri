package com.kh.finalPJ.goods;

import java.util.ArrayList;
import java.util.List;

import com.kh.finalPJ.member.RStatusDto;
import com.kh.finalPJ.member.basketDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

public interface goodsService {
	
    /* bbsList */
	public List<goodsBbsDto> getbbs(String startindex, String endindex, String category) throws Exception;
	
	/*getbbslength*/
	public List<goodsBbsDto> getbbslength() throws Exception;

	
	/* findgoods */
	public List<goodsBbsDto> findgoods(String title,String lists, String category) throws Exception;

	/* readcount */
	public void readcount(int seq) throws Exception;
	
	/*getgoodsdetail*/
	public goodsBbsDto getgoodsdetail(int seq) throws Exception;
	
	/*getreview_qna*/
	public List<reviewDto> getreview_qna(String g_code) throws Exception;
	
	/*basketinsert*/
	public boolean basketinsert(basketDto dto) throws Exception;
	
	/* getbbscategory */
	public List<goodsBbsDto> getbbscategory(String division) throws Exception;
	
	public memberDto selectMember(String id);
	public goodsDto selectGoods(String g_code);
	
	public boolean RStatusInsert(List<RStatusDto> R_Status);
	
	/* headselect */
	public List<goodsBbsDto> headselect(String title) throws Exception;
	
	/* headselectajax */
	public List<goodsBbsDto> headselectajax(String title) throws Exception;

	public List<qaDto> getQnAlist_g(String g_code);
	
	public List<Integer> getRef(String id);
	
	public List<Integer> AllgetRef();
}
