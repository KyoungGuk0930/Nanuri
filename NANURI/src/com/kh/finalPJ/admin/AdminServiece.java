package com.kh.finalPJ.admin;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalPJ.goods.goodsDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.member.secessionDto;

public interface AdminServiece {
	public List<memberDto> getMemberList(); 
	public List<secessionDto> getSecessionList();
	public List<goodsDto> getGoodsList();
	public List<String> getGCodes(); 
	
	public boolean goodsRegist(goodsDto goods);
	
	public boolean stockUpdate(Map<String, Object> map);
	public boolean quantityUpdate(Map<String, Object> map);
	public boolean upImgOnly(Map<String, Object> map);
	
	public boolean goodsApply(Map<String, Object> map);
	
	public boolean finalSecession(String id);
	public boolean restoreMember(String id);
	
}
