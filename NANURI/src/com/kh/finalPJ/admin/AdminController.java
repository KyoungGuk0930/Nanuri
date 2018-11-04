package com.kh.finalPJ.admin;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.finalPJ.common.controller;
import com.kh.finalPJ.goods.goodsBbsDto;
import com.kh.finalPJ.goods.goodsDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.member.secessionDto;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(controller.class);
	
	@Autowired
	AdminServiece adminserviece;
	
	// 관리자 메인 화면
	@RequestMapping(value="admin.do",method = RequestMethod.GET)
	public String admin(Model model) throws Exception{
		return "adminMain.tiles";
	}
	
	// 회원관리 뷰
	@RequestMapping(value="manageMember.do",method = RequestMethod.GET)
	public String manageMember(Model model) throws Exception{
		List<memberDto> memberlist = adminserviece.getMemberList();
		model.addAttribute("memberlist",memberlist);
		
		return "memberList.tiles";
	}
	
	// 회원탈퇴 승인 뷰
	@RequestMapping(value="approve.do",method = RequestMethod.GET)
	public String approve(Model model) throws Exception{
		List<secessionDto> secessionList = adminserviece.getSecessionList();
		model.addAttribute("secessionList",secessionList);
		
		return "approve.tiles";
	}
	
	// 회원 탈퇴 승인 기능
	@RequestMapping(value="finalSecession.do",method = RequestMethod.GET)
	public String finalSecession(String id,Model model) throws Exception{
		if(adminserviece.finalSecession(id)) {
			logger.info(id + " 회원 탈퇴 성공!" + new Date());
		}
		
		return "redirect:/approve.do";
	}
	
	@RequestMapping(value="restoreMember.do",method = RequestMethod.GET)
	public String restoreMember(String id,Model model) throws Exception{
		if(adminserviece.restoreMember(id)) {
			logger.info(id + " 회원 복구 성공!" + new Date());
		}
		
		return "redirect:/approve.do";
	}
	
	
	
	// 재고 관리 뷰
	@RequestMapping(value="manageStock.do",method = RequestMethod.GET)
	public String manageStock(Model model) throws Exception{
		List<goodsDto> goodsList = adminserviece.getGoodsList();
		model.addAttribute("goodsList",goodsList);
		
		return "stock.tiles";
	}

	// 재고 관리 : 상품 등록 기능
	// 이미지 파일 이름 : 상품코드Main.확장자 
	@RequestMapping(value="goodsRegist.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String goodsRegist(HttpServletRequest req,goodsDto goods, Model model) throws Exception{
		
		String filename = ChangeFileName.changeMainImgN(goods.getG_code(),goods.getG_imgF());
		String fupload = req.getServletContext().getRealPath("/resources/img/main_img");
		
		try {
			File file = new File(fupload + "/" + filename);
			FileUtils.writeByteArrayToFile(file, goods.getG_imgF().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		goods.setG_img(filename);
		
		boolean b = adminserviece.goodsRegist(goods);
		if(b) System.out.println("등록 성공!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		List<goodsDto> goodsList = adminserviece.getGoodsList();
		model.addAttribute("goodsList",goodsList);
		
		return "stock.tiles";
	}

	// 재고 관리 : 상품 내용 변경하는 부분
	@ResponseBody
	@RequestMapping(value="stockUpdate.do",method = {RequestMethod.GET, RequestMethod.POST})
	public Boolean stockUpdate(@RequestBody Map<String, Object> map) throws Exception{
		boolean b = false;

		if(map.get("change").equals("g_quantity")) {
			b = adminserviece.quantityUpdate(map);
		}
		else{
			b = adminserviece.stockUpdate(map);
		}

		return b;
	}

	@ResponseBody
	@RequestMapping(value="changeFile.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String changeFile(MultipartHttpServletRequest req,String g_code, Model model) throws Exception{
		logger.info(g_code);
		logger.info(req.getFile("g_imgF").getOriginalFilename());
		
		String filename = ChangeFileName.changeMainImgN(g_code,req.getFile("g_imgF"));
		String fupload = req.getServletContext().getRealPath("/resources/img/main_img");
		System.out.println(fupload);
		
		try {
			File file = new File(fupload + "/" + filename);
			FileUtils.writeByteArrayToFile(file, req.getFile("g_imgF").getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("g_code", g_code);
		map.put("filename", filename);
		
		boolean b = adminserviece.upImgOnly(map);
		
		if(b) {
			return filename;
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value="goodsApply.do",method = RequestMethod.GET)
	public String goodsApply(Model model) throws Exception{
		List<String> codeList = adminserviece.getGCodes();
		model.addAttribute("codeList",codeList);
		
		return "goodsApply.tiles";
	}

	@RequestMapping(value="goodsApplyAf.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String goodsApplyAf(MultipartHttpServletRequest req, goodsBbsDto bbsDto, Model model) throws Exception{
		List<MultipartFile> sub_imgs = req.getFiles("sub_imgs");
		MultipartFile content = req.getFile("content_img");
		
		List<String> sub_filenames = ChangeFileName.changeSubImgN(bbsDto.getG_code(), sub_imgs);
		String content_filename = ChangeFileName.changeContentImgN(bbsDto.getG_code(), content);
		
		String sub_fupload = req.getServletContext().getRealPath("/resources/img/sub_imgs");
		String content_fupload = req.getServletContext().getRealPath("/resources/img/rental_content");
		File newFile = null;
		
		try {
			
			for(int i = 0; i<sub_filenames.size(); i++) {
				newFile = new File(sub_fupload + "/" + sub_filenames.get(i));
				FileUtils.writeByteArrayToFile(newFile, sub_imgs.get(i).getBytes());
				newFile = null;
			}
			
			newFile = new File(content_fupload + "/" + content_filename);
			FileUtils.writeByteArrayToFile(newFile, content.getBytes());
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String,Object> map = new HashMap<>();
		map.put("g_code", bbsDto.getG_code());
		map.put("title", bbsDto.getTitle());
		map.put("sub_imgs", sub_filenames);
		map.put("content", content_filename);
		
		adminserviece.goodsApply(map);
		
		List<String> codeList = adminserviece.getGCodes();
		model.addAttribute("codeList",codeList);
		return "goodsApply.tiles";
	}
	
	@RequestMapping(value="manageRental.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String manageRental(Model model) throws Exception{
		return "rentalList.tiles";
	}
	
	@RequestMapping(value="manageSales.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String sales(Model model) throws Exception{
		return "manageSales.tiles";
	}
	
}
