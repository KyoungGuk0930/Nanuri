package com.kh.finalPJ.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalPJ.goods.goodsDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.member.secessionDto;

@Service
public class AdminServieceImpl implements AdminServiece{

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<memberDto> getMemberList() {
		return adminDao.getMemberList();
	}

	@Override
	public List<secessionDto> getSecessionList() {
		return adminDao.getSecessionList();
	}
	@Override
	public List<goodsDto> getGoodsList(){
		return adminDao.getGoodsList();
	}

	@Override
	public List<String> getGCodes() {
		return adminDao.getGCodes();
	}

	@Override
	public boolean goodsRegist(goodsDto goods) {
		boolean insCk01 = adminDao.goodsRegist(goods);
		boolean insCk02 = adminDao.stockRegist(goods.getG_code());

		return insCk01 && insCk02;
	}
	
	@Override
	public boolean stockUpdate(Map<String, Object> map) {
		return adminDao.stockUpdate(map);
	}
	
	@Override
	public boolean quantityUpdate(Map<String, Object> map) {
		return adminDao.quantityUpdate(map);
	}
	
	@Override
	public boolean upImgOnly(Map<String, Object> map) {
		return adminDao.upImgOnly(map);
	}

	@Override
	public boolean goodsApply(Map<String, Object> map) {
		return adminDao.goodsApply(map);
	}

	@Override
	public boolean finalSecession(String id) {
		boolean updCk = adminDao.secessionUpdate(id);
		boolean delCk = adminDao.finalSecession(id);
		
		return delCk && updCk;
	}

	@Override
	public boolean restoreMember(String id) {
		boolean updCk = adminDao.secessionCancle(id);
		boolean delCk = adminDao.restoreMember(id);
		
		return delCk && updCk;
	}
}
