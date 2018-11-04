package com.kh.finalPJ.goods;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalPJ.common.orderedDto;
import com.kh.finalPJ.member.RStatusDto;
import com.kh.finalPJ.member.basketDto;
import com.kh.finalPJ.member.memberDto;
import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

@Controller
public class goodsController {
	private static final Logger logger = LoggerFactory.getLogger(goodsController.class);

	@Autowired
	goodsService goodsService;

	// getList
	@RequestMapping(value = "rentallist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getList(Model model, HttpServletRequest request) throws Exception {

		List<goodsBbsDto> list = goodsService.getbbslength();
		
		
		model.addAttribute("bbslist", list);

		return "rentallist.tiles";

	}

	// goodsdetaile view
	@RequestMapping(value = "goodsdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsdetaile(Model model, int seq, String g_code, HttpServletRequest req) throws Exception {
		
		memberDto mem = null;
		if(req.getSession().getAttribute("login") != null) {
			mem =(memberDto) req.getSession().getAttribute("login");
		}else {	// 세션값이 없을때
			mem = new memberDto();
			mem.setId("null");
		}
		String id = mem.getId();
	
		// readcount
		goodsService.readcount(seq);
		// getdetaile
		goodsBbsDto dto = goodsService.getgoodsdetail(seq);
		// g_code 연결(rivew,qna)
		List<reviewDto> code = goodsService.getreview_qna(g_code);
		
		for (int i = 0; i < code.size(); i++) {
			System.out.println("-------------------");
			System.out.println(code.get(i).getContent());
			System.out.println("-------------------");
		}
		
		List<qaDto> g_qalist = goodsService.getQnAlist_g(g_code); 
		List<Integer> allref = goodsService.AllgetRef();
		List<Integer> reflist = goodsService.getRef(id);	
		
		String title = null;
		String category = dto.getG_code().substring(0, 2);
		
				// 유아
				if (category.equals("BC")) {
					title = "유아동";
				}
				// 레저
				else if (category.equals("LS")) {
					title = "레저";
				}
				// 패션
				else if (category.equals("FC")) {
					title = "패션";
				}
				// 리빙
				else if (category.equals("LV")) {
					title = "리빙";
				}

		model.addAttribute("detail", dto);
		model.addAttribute("reviewDto", code);
		model.addAttribute("title", title);
		
		model.addAttribute("g_qalist", g_qalist);
		model.addAttribute("allref", allref);
		model.addAttribute("reflist", reflist);
		
		return "rentaldetaile.tiles";
		
		
	}

	/* 이름 + SELECTBOX 검색 */
	@ResponseBody
	@RequestMapping(value = "findtitle.do", method = RequestMethod.POST)
	public Map<Object, Object> findtitle(HttpServletRequest req) throws Exception {

		String title = req.getParameter("title");
		String lists = req.getParameter("lists");
		String category = req.getParameter("category");

	/*	System.out.println(category);
		System.out.println(title);
		System.out.println(lists);*/

		Map<Object, Object> map = new HashMap<>();

		List<goodsBbsDto> list = goodsService.findgoods(title, lists, category);

		map.put("list", list);

		return map;

	}

	/* 페이징 인덱스 */
	@ResponseBody
	@RequestMapping(value = "findlist.do", method = RequestMethod.POST)
	public Map<Object, Object> findlist(HttpServletRequest req) throws Exception {

		String startindex = req.getParameter("startindex");
		String endindex = req.getParameter("endindex");
		String category = req.getParameter("category");

		List<goodsBbsDto> list = goodsService.getbbs(startindex, endindex, category);
		Map<Object, Object> map = new HashMap<>();

		map.put("list", list);

		return map;

	}

	/* 장바구니 insert */
	@ResponseBody
	@RequestMapping(value = "basketinsert.do", method = RequestMethod.POST)
	public boolean basketinsert(Model model, HttpServletRequest req) throws Exception {

		String id = req.getParameter("id");
		String g_code = req.getParameter("gcode");
		int month = (Integer.parseInt(req.getParameter("month")));
		int amount = (Integer.parseInt(req.getParameter("amount")));
		int resultnum = (Integer.parseInt(req.getParameter("resultnum")));

		// System.out.println(resultnum +
		// "ddddddddddddddddddddddddddddddddddddddddddd");

		basketDto dto = new basketDto();
		dto.setId(id);
		dto.setG_code(g_code);
		dto.setMonth(month);
		dto.setAmount(amount);
		dto.setSum_price(resultnum);

		System.out.println(dto.toString());

		return goodsService.basketinsert(dto);

	}

	/* 카테고리 */
	@RequestMapping(value = "rental_category.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rental_category(Model model, String division) throws Exception {

		List<goodsBbsDto> list = null;
		String title = null;
		// 유아
		if (division.equals("BC")) {
			list = goodsService.getbbscategory(division);
			title = "유아동";
		}
		// 레저
		else if (division.equals("LSC")) {
			list = goodsService.getbbscategory(division);
			title = "레저";
		}
		// 패션
		else if (division.equals("FC")) {
			list = goodsService.getbbscategory(division);
			title = "패션";
		}
		// 리빙
		else if (division.equals("LVC")) {
			list = goodsService.getbbscategory(division);
			title = "리빙";
		}
		
		
		
		
		model.addAttribute("title", title);
		model.addAttribute("bbslist", list);

		
		return "rentallist.tiles";

	}

	@RequestMapping(value = "order.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String order(Model model,String id, String data) throws Exception {

		String splitData[] = data.split("/");
		memberDto member = goodsService.selectMember(id);
		List<goodsDto> goodsList = new ArrayList<>();
		List<orderedDto> orderList = new ArrayList<>();
		
		for (String str : splitData) {
			String singleData[] = str.split(",");
			
			goodsDto goods = goodsService.selectGoods(singleData[0]);
			orderedDto ordered=new orderedDto(id,singleData[0],singleData[1],singleData[2],singleData[3]);
			
			goodsList.add(goods);
			orderList.add(ordered);
		}
	
		model.addAttribute("member", member);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("orderList", orderList);
		return "order.tiles";
	}

	@RequestMapping(value = "orderAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderAf(Model model, String data) throws Exception {
		SimpleDateFormat transFormat = new SimpleDateFormat("yy/MM/dd");
		Date today = new Date();

		System.out.println(data);
		String splitData[] = data.split("/");

		List<RStatusDto> dtoList = new ArrayList<>();
		for(int i = 0; i< splitData.length; i++) {
			String dtoData[] = splitData[i].split(",");

			String s_date = transFormat.format(today);
			String e_date="";

			Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    cal.add(Calendar.MONTH, Integer.parseInt(dtoData[3]));
		    e_date = transFormat.format(cal.getTime());

		    RStatusDto R_Status = new RStatusDto();
		    R_Status.setG_code(dtoData[0]);
		    R_Status.setId(dtoData[1]);
		    R_Status.setAmount(Integer.parseInt(dtoData[2]));
		    R_Status.setS_date(s_date);
		    R_Status.setE_date(e_date);
		    R_Status.setTotal_price(Integer.parseInt(dtoData[4]));
		    R_Status.setOrder_num(dtoData[5]);

			dtoList.add(R_Status);
		}

		if(goodsService.RStatusInsert(dtoList)) {
			System.out.println("성공!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}else {
			System.out.println("실.....패............");
		}

		return "redirect:rentalList.do";
	}

	// headselect
	@RequestMapping(value = "headselect.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String headselect(Model model, String title) throws Exception {

		List<goodsBbsDto> list = goodsService.headselect(title);

		System.out.println(list.size());

		String head = "검색 된 상품";
		model.addAttribute("title", head);
		model.addAttribute("bbslist", list);
		return "rentallist_select.tiles";

	}

	// headselectajax
	@ResponseBody
	@RequestMapping(value = "headselectajax.do", method = RequestMethod.POST)
	public Map<Object, Object> headselectajax(Model model, HttpServletRequest req) throws Exception {

		String title = req.getParameter("title");

		List<goodsBbsDto> list = goodsService.headselectajax(title);

		System.out.println(list.size());
		Map<Object, Object> map = new HashMap<>();

		map.put("list", list);

		return map;
	}

}
