package com.kh.finalPJ.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

@Service
public class memberServiceImpl implements memberService {

	@Autowired
	private memberDao memberdao;

	@Override
	public memberDto login(memberDto mem) throws Exception {
		return memberdao.login(mem);
	}

	@Override
	public Integer idCheck(String id) throws Exception {
		return memberdao.idCheck(id);
	}

	@Override
	public Integer emailCheck(String email) throws Exception {
		return memberdao.emailCheck(email);
	}

	@Override
	public Integer nickCheck(String nickname) throws Exception {
		return memberdao.nickCheck(nickname);
	}

	@Override
	public boolean addMember(memberDto mem) throws Exception {
		return memberdao.addMember(mem);
	}

	@Override
	public boolean userUpdateAf(memberDto mem) throws Exception {
		return memberdao.userUpdateAf(mem);
	}

	@Override
	public boolean secessionAf(secessionDto sec) throws Exception {
		memberdao.delUpdateAf(sec);
		return memberdao.secessionAf(sec);
	}

	@Override
	public List<basketListDto> getBasketList(String id) throws Exception {
		return memberdao.getBasketList(id);
	}

	@Override
	public boolean basketListDel(Integer seq) throws Exception {
		return memberdao.basketListDel(seq);
	}

	@Override
	public Integer getTotalPrice(Integer seq) throws Exception {
		return memberdao.getTotalPrice(seq);
	}

	@Override
	public Integer getGoodsSeq(String g_code) throws Exception {
		return memberdao.getGoodsSeq(g_code);
	}

	@Override
	public List<RStatusDto> getR_StatusList(String id) throws Exception {
		return memberdao.getR_StatusList(id);
	}

	@Override
	public boolean rentalListDel(Integer seq) throws Exception {
		return memberdao.rentalListDel(seq);
	}

	@Override
	public Integer getOrderCount(String id) throws Exception {
		return memberdao.getOrderCount(id);
	}

	@Override
	public Integer getWishListCount(String id) throws Exception {
		return memberdao.getWishListCount(id);
	}

	@Override
	public List<qaDto> getAdminQaList() throws Exception {
		return memberdao.getAdminQaList();
	}

	@Override
	public List<reviewDto> getMyReviewList(String id) throws Exception {
		return memberdao.getMyReviewList(id);
	}

}
