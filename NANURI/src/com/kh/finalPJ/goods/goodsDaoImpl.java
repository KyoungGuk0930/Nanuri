package com.kh.finalPJ.goods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalPJ.member.RStatusDto;
import com.kh.finalPJ.member.basketDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

@Repository
public class goodsDaoImpl implements goodsDao {


	@Autowired
	SqlSession sqlSession;

	private String namespace = "goods.";

	 /* bbsList */
	@Override
	public List<goodsBbsDto> getbbs(String startindex, String endindex, String category) {


		goodspage dto = new goodspage();

		dto.setStartindex(startindex);
		dto.setEndindex(endindex);
		dto.setCategory(category);

		System.out.println(dto.getCategory());

		List<goodsBbsDto> list = sqlSession.selectList(namespace + "getbbs",dto);

		System.out.println(list.size());

		/*for (int i = 0; i < list.size(); i++) {
			System.out.println("asdkfjahlsdkfjhawlkf" + list.get(i));
		}*/

		return list;
	}




	@Override
	public List<goodsBbsDto> getbbslength() {
		List<goodsBbsDto> list = sqlSession.selectList(namespace + "getbbslength");
		return list;
	}




	/* readcount */
	@Override
	public void readcount(int seq) {

		sqlSession.update(namespace + "readcount", seq);

		System.out.println(seq);

	}

	/* getgoodsdetail */
	@Override
	public goodsBbsDto getgoodsdetail(int seq) {

		goodsBbsDto dto = sqlSession.selectOne(namespace + "getgoodsdetail", seq);

		return dto;
	}



	/* AJAX 검색 (title + selectbox) */
	@Override
	public List<goodsBbsDto> findgoods(String title,String lists,String category) {


		List<goodsBbsDto> list = null;

		if(title.equals("")) {
			// 타이틀의 값이 없을때
			// order by 만 돌려줌
			goodsBbsDto dto = new goodsBbsDto();

			dto.setTitle(title);
			dto.setLists(lists);
			dto.setCategory(category);

			list = sqlSession.selectList(namespace + "findchecked", dto);

			System.out.println(dto.getLists());

			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getG_price());
			}

			System.out.println("들어옴");

		}else {
			// 값이 있을때
			// LIKE 랑 ORDER BY 같이 돌려줌
			goodsBbsDto dto = new goodsBbsDto();

			dto.setTitle(title);
			dto.setLists(lists);
			dto.setCategory(category);

			list = sqlSession.selectList(namespace + "findgoodsAll", dto);




			System.out.println("안들어옴");
		}



		return list;
	}

	/*리뷰 및 qna 끌어오기*/
	@Override
	public List<reviewDto> getreview_qna(String g_code) {

		List<reviewDto> list = sqlSession.selectList(namespace + "getreview_qna", g_code);
		return list;
	}



	/*basketinsert*/
	@Override
	public boolean basketinsert(basketDto dto) {

		return sqlSession.insert(namespace + "basketinsert", dto)>0 ? true: false;
	}




	@Override
	public List<goodsBbsDto> getbbscategory(String division) {

		List<goodsBbsDto> list = sqlSession.selectList(namespace + "getbbscategory",division);

		System.out.println(list.size() + " dao ");

		return list;
	}

	
	
	// START - BIT
	@Override
	public memberDto selectMember(String id) {
		return sqlSession.selectOne(namespace + "selectMember",id);
	}

	@Override
	public goodsDto selectGoods(String g_code) {
		return sqlSession.selectOne(namespace + "selectGoods",g_code);
	}

	@Override
	public boolean RStatusInsert(List<RStatusDto> R_Status) {
		boolean insertCk = true;
		for (RStatusDto rStatusDto : R_Status) {
			if(sqlSession.insert(namespace +"orderComplete", rStatusDto)<1){
				insertCk = false;
			}
		}
		return insertCk;
	}
	// END - BIT 
	
	
	@Override
	public List<goodsBbsDto> headselect(String title) {
		List<goodsBbsDto> list = sqlSession.selectList(namespace + "headselect",title);
		return list;
	}

	@Override
	public List<goodsBbsDto> headselectajax(String title) {

		List<goodsBbsDto> list = sqlSession.selectList(namespace + "headselect",title);

		return list;
	}

	@Override
   public List<qaDto> getQnAlist_g(String g_code) {
      
      List<qaDto> list = sqlSession.selectList(namespace + "getQnAlist_g", g_code);
      
      return list;
   }
   
   @Override
	public List<Integer> getRef(String id) {
		List<Integer> ref = sqlSession.selectList(namespace + "getRef", id);
		return ref;
	}

	@Override
	public List<Integer> AllgetRef() {
		List<Integer> ref = sqlSession.selectList(namespace + "AllgetRef");
		return ref;
	}



}
