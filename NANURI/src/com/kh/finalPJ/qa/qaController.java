package com.kh.finalPJ.qa;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.finalPJ.member.memberDto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class qaController {

	private static final Logger logger = LoggerFactory.getLogger(qaController.class);
	
	@Autowired
	qaService QaService;	

	@RequestMapping(value = "qnalist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getQaList(qaParam param,HttpServletRequest req, Model model) throws Exception {
		
		logger.info("qaController getQaList" + new Date());		
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		// 글의 갯수 
		int totalRecordCount = QaService.getBbsCount(param);
		memberDto mem = null;
		if(req.getSession().getAttribute("login") != null) {
			mem =(memberDto) req.getSession().getAttribute("login");
		}else {	// 세션값이 없을때
			mem = new memberDto();
			mem.setId("null");
		}
		String id = mem.getId();
		
		List<Integer> allref = QaService.AllgetRef();
		List<Integer> reflist = QaService.getRef(id);	
		List<qaDto> qalist = QaService.getBbsPagingList(param);		
		List<qaDto> adminlist = QaService.getAdminQaList();	
		
		model.addAttribute("allref", allref);
		model.addAttribute("reflist", reflist);
		model.addAttribute("qalist", qalist);
		model.addAttribute("adminlist", adminlist);			

		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
					
		return "qalist.tiles";
	}
	
	@RequestMapping(value = "qaWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qaWrite(HttpServletRequest req, int g_seq,String g_code, Model model) {
		
		logger.info("qaController qaWrite" + new Date());
		
		System.out.println("mmmmmmmmmmmmmg_seq" + g_seq);
		if(req.getSession().getAttribute("login") != null) {			
			
			if(g_code != null || g_seq == -1) {			
				model.addAttribute("g_code", g_code);
				model.addAttribute("g_seq", g_seq);
				return "qaWrite.tiles";
			}else{			
				return "qaWrite.tiles";
			}
		}else {	// 세션값이 없을때
			return "login.do";
		}		
	}
	
	@RequestMapping(value = "qaWriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qaWriteAf(HttpServletRequest req, qaDto dto, int g_seq, Model model) {
		
		logger.info("qaController qaWriteAf" + new Date());
				
		if(req.getSession().getAttribute("login") != null) {			
			boolean c = dto.isCheck(); // 체크박스 체크여부확인
			
			if(c) {
				dto.setSecret(1);
			}else {
				dto.setSecret(0);
			}
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  dto" + dto.toString());
			System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  g_seq" + g_seq);
		
			boolean b = QaService.QaWrite(dto);
			if(b) {
				if(dto.getG_code() != null && g_seq != -1) {
					model.addAttribute("g_code", dto.getG_code());
					model.addAttribute("seq", g_seq);
					return "redirect:/goodsdetail.do";
				}else {
					return "redirect:/qnalist.do";
				}
			}else {
				return "redirect:/qaWrite.do";
			}
		}else {	// 세션값이 없을때
			return "login.do";
		}		
		
	} 
	
	// 디테일 후기 할때도 이함수 사용하면됨
	@RequestMapping(value = "ansWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ansWrite(HttpServletRequest req, int ref, String g_code, int secret, Model model) {
		
		logger.info("qaController ansWrite" + new Date());
		
		if(req.getSession().getAttribute("login") != null) {			
			
			qaDto ansdto = new qaDto(ref, g_code, secret);
			model.addAttribute("ansdto", ansdto);
			
			return "ansWrite.tiles";
			
		}else {	// 세션값이 없을때
			return "login.do";
		}
	}	
	
	@RequestMapping(value = "ansWriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ansWriteAf(HttpServletRequest req, qaDto dto, Model model) {
		
		logger.info("qaController ansWriteAf" + new Date());
		
		if(req.getSession().getAttribute("login") != null) {			
			
			boolean b = QaService.ansWrite(dto);
			
			if(b) {
				return "redirect:/qnalist.do";
			}else {
				return "redirect:/ansWriteAf.do";
			}
			
		}else {	// 세션값이 없을때
			return "login.do";
		}
	}
	
	@RequestMapping(value = "qaAdminWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String qaAdminWrite(HttpServletRequest req, Model model) {
		
		logger.info("qaController qaAdminWrite" + new Date());
		
		if(req.getSession().getAttribute("login") != null) {			
			return "qaAdminWrite.tiles";
		}else {	// 세션값이 없을때
			return "login.do";
		}		
	}
	
	@RequestMapping(value = "qaAdminWriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String qaAdminWriteAf(HttpServletRequest req, qaDto dto,Model model) {
		
		logger.info("qaController qaAdminWriteAf" + new Date());
		
		if(req.getSession().getAttribute("login") != null) {			
						
			boolean b = QaService.qaAdminWrite(dto);
			
			if(b) {		
				return "redirect:/qnalist.do";
			}else {
				return "redirect:/qaAdminWriteAf.do";
			}
			
		}else {	// 세션값이 없을때
			return "login.do";
		}
	}
	
	@RequestMapping(value = "delete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(HttpServletRequest req, int ref, Model model) {
		
		logger.info("qaController delete" + new Date());
		
		if(req.getSession().getAttribute("login") != null) {			
			
			boolean b = QaService.qaDelete(ref);
			
			if(b) {		
				return "redirect:/qnalist.do";
			}else {
				return "redirect:/delete.do";
			}
			
		}else {	// 세션값이 없을때
			return "login.do";
		}
		
	}
	
	@RequestMapping(value = "ansDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ansDelete(HttpServletRequest req, int seq, Model model) {
		
		logger.info("qaController ansDelete" + new Date());
		
		if(req.getSession().getAttribute("login") != null) {			
			boolean b = QaService.ansDelete(seq);
			
			if(b) {
				return "redirect:/qnalist.do";
			}else {
				return "redirect:/qnalist.do";
			}
			
		}else {	// 세션값이 없을때
			return "login.do";
		}
		
		
	}	
}



















