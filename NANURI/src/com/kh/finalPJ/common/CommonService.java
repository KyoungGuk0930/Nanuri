package com.kh.finalPJ.common;

import java.util.List;

import com.kh.finalPJ.goods.goodsBbsDto;

public interface CommonService {

	
	/* mainreadcount */
	public List<goodsBbsDto> mainreadcount() throws Exception;
	
	/* maindate */
	public List<goodsBbsDto> maindate() throws Exception;
}
