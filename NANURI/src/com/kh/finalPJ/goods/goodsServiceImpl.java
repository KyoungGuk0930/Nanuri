package com.kh.finalPJ.goods;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalPJ.member.RStatusDto;
import com.kh.finalPJ.member.basketDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

@Service
public class goodsServiceImpl implements goodsService {

	@Autowired
	goodsDao goodsDao;

	
	@Override
	public List<goodsBbsDto> getbbs(String startindex, String endindex, String category) {
		
		return goodsDao.getbbs(startindex,endindex,category);
	}

	

	@Override
	public List<goodsBbsDto> getbbslength() throws Exception {
		return goodsDao.getbbslength();
	}



	@Override
	public List<goodsBbsDto> findgoods(String title,String lists,String category) {
		return goodsDao.findgoods(title,lists,category);
	}


	@Override
	public void readcount(int seq) {
		goodsDao.readcount(seq);
	}


	@Override
	public goodsBbsDto getgoodsdetail(int seq) throws Exception {
		
		return goodsDao.getgoodsdetail(seq);
	}


	@Override
	public List<reviewDto> getreview_qna(String g_code) throws Exception {
		return goodsDao.getreview_qna(g_code);
	}



	@Override
	public boolean basketinsert(basketDto dto) throws Exception {
		return goodsDao.basketinsert(dto);
		
	}



	@Override
	public List<goodsBbsDto> getbbscategory(String division) throws Exception {
		return goodsDao.getbbscategory(division);
	}


	// START - BIT
	@Override
	public memberDto selectMember(String id) {
		return goodsDao.selectMember(id);
	}

	@Override
	public goodsDto selectGoods(String g_code) {
		return goodsDao.selectGoods(g_code);
	}
	
	@Override
	public boolean RStatusInsert(List<RStatusDto> R_Status) {
		return goodsDao.RStatusInsert(R_Status);
	}
	// END - BIT


	public List<goodsBbsDto> headselect(String title) throws Exception {
		
		return goodsDao.headselect(title);
	}



	@Override
	public List<goodsBbsDto> headselectajax(String title) throws Exception {
		// TODO Auto-generated method stub
		return goodsDao.headselectajax(title);
	}



	@Override
	public List<qaDto> getQnAlist_g(String g_code) {
		return goodsDao.getQnAlist_g(g_code);
	}
	
	@Override
	public List<Integer> getRef(String id) {
		return goodsDao.getRef(id);
	}

	@Override
	public List<Integer> AllgetRef() {
		return goodsDao.AllgetRef();
	}
	
}
