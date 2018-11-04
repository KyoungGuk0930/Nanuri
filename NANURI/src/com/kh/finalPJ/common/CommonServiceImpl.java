package com.kh.finalPJ.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalPJ.goods.goodsBbsDto;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	Commondao Commondao;

	@Override
	public List<goodsBbsDto> mainreadcount() throws Exception {
		
		return Commondao.mainreadcount();
	}

	@Override
	public List<goodsBbsDto> maindate() throws Exception {
		// TODO Auto-generated method stub
		return Commondao.maindate();
	}
	
	
}
