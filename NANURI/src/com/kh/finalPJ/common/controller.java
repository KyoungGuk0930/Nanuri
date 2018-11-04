package com.kh.finalPJ.common;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.finalPJ.goods.goodsBbsDto;

@Controller
public class controller {
	private static final Logger logger = LoggerFactory.getLogger(controller.class);
	
	@Autowired
	CommonService CommonService;
	
	@RequestMapping(value="main.do",method = RequestMethod.GET)
	public String test(Model model) throws Exception{
		
		// 조회순
		List<goodsBbsDto> count = CommonService.mainreadcount();
		// 최신순
		List<goodsBbsDto> date = CommonService.maindate();
		
		
		model.addAttribute("readbbs",count);
		model.addAttribute("datedds",date);
		return "main.tiles";
	}
	
	
}
