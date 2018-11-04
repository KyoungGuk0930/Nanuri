package com.kh.finalPJ.review;

import java.util.HashMap;
import java.util.List;

import com.kh.finalPJ.goods.goodsBbsDto;

public interface reviewDao {
	
	/*글 목록*/
	List<reviewDto> getreview();
	
	/*페이징리스트*/
	List<reviewDto> getrevPagingList(reviewParam param) throws Exception;
	int getrevCount(reviewParam param) throws Exception;
	
	/*글 쓰기*/
	boolean writeReview(reviewDto dto) throws Exception;
	
	/*디테일보기*/
	public reviewDto detailreview(int seq) throws Exception;
	
	/* 후기에서 해당 페이지 가는~*/
	int godetail(reviewDto dto)throws Exception;
	
	/*글삭제*/
	public void deleterev(int seq) throws Exception;
	
	/*글 수정*/
	public void reviewupdate(reviewDto dto, int seq)throws Exception;
	
	/*해당상품으로 가기*/
	public int getGoodsSeq(String g_code)throws Exception; 
	
	/*장바구니에서 상품디테일가기*/
	public reviewDto goToDto(int seq)throws Exception;
}
