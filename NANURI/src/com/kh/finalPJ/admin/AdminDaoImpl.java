package com.kh.finalPJ.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalPJ.goods.goodsDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.member.secessionDto;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "adminSqls.";
	
	@Override
	public List<memberDto> getMemberList(){
		List<memberDto> memberlist = sqlSession.selectList(namespace + "getMemberList");
		return memberlist;
	}

	@Override
	public List<secessionDto> getSecessionList() {
		List<secessionDto> memberlist = sqlSession.selectList(namespace + "getSecessionList");
		return memberlist;
	}

	@Override
	public List<goodsDto> getGoodsList() {
		List<goodsDto> goodsList = sqlSession.selectList(namespace + "getGoodsList");
		return goodsList;
	}
	
	@Override
	public List<String> getGCodes() {
		List<String> codeList = sqlSession.selectList(namespace + "getGCodes");
		return codeList;
	}

	@Override
	public boolean goodsRegist(goodsDto goods) {
		return sqlSession.insert(namespace + "goodsRegist",goods)>0 ? true : false;
	}

	@Override
	public boolean stockRegist(String g_code) {
		return sqlSession.insert(namespace + "stockRegist",g_code)>0 ? true : false;
	}
	
	@Override
	public boolean stockUpdate(Map<String, Object> map) {
		return sqlSession.update(namespace + "stockUpdate",map)>0 ? true : false;
	}

	@Override
	public boolean quantityUpdate(Map<String, Object> map) {
		return sqlSession.update(namespace + "quantityUpdate",map)>0 ? true : false;
	}
	
	@Override
	public boolean upImgOnly(Map<String, Object> map) {
		return sqlSession.update(namespace + "upImgOnly",map)>0 ? true : false;
	}

	@Override
	public boolean goodsApply(Map<String, Object> map) {
		return sqlSession.insert(namespace + "goodsApply",map)>0 ? true : false;
	}

	@Override
	public boolean finalSecession(String id) {
		return sqlSession.delete(namespace + "finalSecession",id)>0? true:false;
	}

	@Override
	public boolean secessionUpdate(String id) {
		return sqlSession.update(namespace + "secessionUpdate",id)>0? true:false;
	}

	@Override
	public boolean secessionCancle(String id) {
		return sqlSession.update(namespace + "secessionCancle",id)>0? true:false;
	}

	@Override
	public boolean restoreMember(String id) {
		return sqlSession.delete(namespace + "restoreMember",id)>0? true:false;
	}
	
}
