package com.kh.finalPJ.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalPJ.goods.goodsBbsDto;

@Repository
public class CommondaoImpl implements Commondao {
	
	@Autowired
	SqlSession sqlSession;

	private String namespace = "commonSql.";

	@Override
	public List<goodsBbsDto> mainreadcount() {
		List<goodsBbsDto> list = sqlSession.selectList(namespace + "mainreadcount");
		return list;
	}

	@Override
	public List<goodsBbsDto> maindate() {
		List<goodsBbsDto> list = sqlSession.selectList(namespace + "maindate");
		return list;
	}
	
	
	
}
