package com.kh.finalPJ.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

@Repository
public class memberDaoImpl implements memberDao {

	@Autowired
	SqlSession sqlsession;

	private String namespace = "membersqls.";

	@Override
	public memberDto login(memberDto mem) throws Exception {
		return sqlsession.selectOne(namespace + "login", mem);
	}

	@Override
	public Integer idCheck(String id) throws Exception {
		return sqlsession.selectOne(namespace + "idCheck", id);
	}

	@Override
	public Integer emailCheck(String email) throws Exception {
		return sqlsession.selectOne(namespace + "emailCheck", email);
	}

	@Override
	public Integer nickCheck(String nickname) throws Exception {
		return sqlsession.selectOne(namespace + "nickCheck", nickname);
	}

	@Override
	public boolean addMember(memberDto mem) throws Exception {
		int n = sqlsession.insert(namespace + "addMember", mem);
		return n > 0 ? true : false;
	}

	@Override
	public boolean userUpdateAf(memberDto mem) throws Exception {
		int n = sqlsession.update(namespace + "userUpdateAf", mem);
		return n > 0 ? true : false;
	}

	@Override
	public boolean secessionAf(secessionDto sec) throws Exception {
		int n = sqlsession.insert(namespace + "secessionAf", sec);
		return n > 0 ? true : false;
	}

	@Override
	public void delUpdateAf(secessionDto sec) throws Exception {
		sqlsession.update(namespace + "delUpdateAf", sec);
	}

	@Override
	public List<basketListDto> getBasketList(String id) throws Exception {
		return sqlsession.selectList(namespace + "getBasketList", id);
	}

	@Override
	public boolean basketListDel(Integer seq) throws Exception {
		int n = sqlsession.delete(namespace + "checkDelAf", seq);
		return n > 0 ? true : false;
	}

	@Override
	public Integer getTotalPrice(Integer seq) throws Exception {
		return sqlsession.selectOne(namespace + "totalPrice", seq);
	}

	@Override
	public Integer getGoodsSeq(String g_code) throws Exception {
		return sqlsession.selectOne(namespace + "getGoodsSeq", g_code);
	}

	@Override
	public List<RStatusDto> getR_StatusList(String id) throws Exception {
		return sqlsession.selectList(namespace + "getR_StatusList", id);
	}

	@Override
	public boolean rentalListDel(Integer seq) throws Exception {
		int n = sqlsession.delete(namespace + "rentalListDel", seq);
		return n > 0 ? true : false;
	}

	@Override
	public Integer getOrderCount(String id) throws Exception {
		return sqlsession.selectOne(namespace + "getOrderCount", id);
	}

	@Override
	public Integer getWishListCount(String id) throws Exception {
		return sqlsession.selectOne(namespace + "getWishListCount", id);
	}

	@Override
	public List<qaDto> getAdminQaList() throws Exception {
		return sqlsession.selectList(namespace + "getAdminQaList");
	}

	@Override
	public List<reviewDto> getMyReviewList(String id) throws Exception {
		return sqlsession.selectList(namespace + "getMyReviewList", id);
	}

}
