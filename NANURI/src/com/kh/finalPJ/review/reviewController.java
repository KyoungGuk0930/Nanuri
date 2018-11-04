package com.kh.finalPJ.review;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.finalPJ.goods.goodsBbsDto;
import com.kh.finalPJ.goods.goodsDto;
import com.kh.finalPJ.member.memberDto;
import com.sun.net.httpserver.HttpServer;

@Controller
public class reviewController {

	private static final Logger logger = LoggerFactory.getLogger(reviewController.class);

	@Autowired
	reviewService reviewSrevice;

	/* 글 목록 */
	@RequestMapping(value = "reviewlist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String revlist(Model model, reviewParam param, HttpServletRequest req) throws Exception {
		logger.info("Welcome reviewController revlist!! " + new Date());

		if (param.getSeq() > 0) {
			reviewDto goToDto = reviewSrevice.goToDto(param.getSeq());
			model.addAttribute("goToDto", goToDto);
		}

		 List<reviewDto> list = reviewSrevice.getreview();
		// model.addAttribute("reviewlist", list);

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();

		param.setStart(start);
		param.setEnd(end);

		// int totalRecordCount = list.size(); // 전체 글수

		// 글의 갯수
		int totalRecordCount = reviewSrevice.getrevCount(param);
		List<reviewDto> revlist = reviewSrevice.getrevPagingList(param);

		model.addAttribute("reviewlist", revlist);

		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 5);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		// 선택한 카테고리와 검색한 단어를 설정
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());

		return "reviewlist.tiles";
	}

	/* 글쓰기 */
	@RequestMapping(value = "reviewwrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String revwrite(Model model, String g_code) throws Exception {

		logger.info("Welcome reviewController revwrite!!!! " + new Date());

		model.addAttribute("g_code", g_code);

		return "reviewwrite.tiles";
	}

	@RequestMapping(value = "reviewwriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String revwriteAF(HttpServletRequest request, Model model) throws Exception {

		logger.info("Welcome reviewController revwriteAf!!!!! " + new Date());

		memberDto mem = null;
		if (request.getSession().getAttribute("login") != null) {
			mem = (memberDto) request.getSession().getAttribute("login");
		} else {
			return "redirect:login.do";
		}

		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String g_code = request.getParameter("g_code");
		String wdate = request.getParameter("wdate");
		int rating = Integer.parseInt(request.getParameter("rating"));

		reviewDto revdto = new reviewDto();
		revdto.setId(id);
		revdto.setG_code(g_code);
		revdto.setTitle(title);
		revdto.setContent(content);
		revdto.setRating(rating);

		// System.out.println(revdto.toString());

		if (revdto.getContent().equals("<p>&nbsp;</p>") || revdto.getTitle().equals("")) {

			return "redirect:reviewwrite.do";
		}
		reviewSrevice.writeReview(revdto);

		return "redirect:reviewlist.do";
	}

	/* 해당상품으로 가기 */
	@ResponseBody
	@RequestMapping(value = "getGoodsSeq.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<Object, Object> getGoodsSeq(String g_code, Model model) throws Exception {
		Map<Object, Object> seq = new HashMap<>();

		int g_seq = reviewSrevice.getGoodsSeq(g_code);

		seq.put("g_seq", g_seq);

		return seq;
	}

	/* 글 삭제 */
	@RequestMapping(value = "deleterev.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleterev(HttpServletRequest request, reviewDto dto, Model model) throws Exception {

		logger.info("Welcome reviewController deleterev!!!!!!! " + new Date());

		memberDto mem = null;
		if (request.getSession().getAttribute("login") != null) {
			mem = (memberDto) request.getSession().getAttribute("login");
		} else {
			return "redirect:login.do";
		}

		reviewSrevice.deleterev(dto.getSeq());

		return "redirect:/reviewlist.do";
	}

	/* 글수정 */
	@RequestMapping(value = "reviewupdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	private String reviewupdate(reviewDto dto, Model model) throws Exception {

		logger.info("Welcome reviewController reviewupdate! " + new Date());

		reviewDto rdto = reviewSrevice.detailreview(dto.getSeq());
		model.addAttribute("reviewupdate", rdto);

		return "reviewupdate.tiles";
	}

	@RequestMapping(value = "reviewupdateAf.do", method = RequestMethod.POST)
	public String reviewupdateAf(HttpServletRequest request, int seq, Model model) throws Exception {

		logger.info("Welcome reviewController reviewupdateAf!!!!!!!!! " + new Date());

		memberDto mem = null;
		if (request.getSession().getAttribute("login") != null) {
			mem = (memberDto) request.getSession().getAttribute("login");
		} else {
			return "redirect:login.do";
		}

		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String wdate = request.getParameter("wdate");
		int rating = Integer.parseInt(request.getParameter("rating"));

		reviewDto revdto = new reviewDto();
		revdto.setSeq(seq);
		revdto.setId(id);
		revdto.setTitle(title);
		revdto.setContent(content);
		revdto.setWdate(wdate);
		revdto.setRating(rating);

		reviewSrevice.reviewupdate(revdto, seq);

		return "redirect:/reviewlist.do";
	}

}
