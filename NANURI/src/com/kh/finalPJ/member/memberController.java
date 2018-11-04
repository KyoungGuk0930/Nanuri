package com.kh.finalPJ.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalPJ.qa.qaDto;
import com.kh.finalPJ.review.reviewDto;

@Controller
public class memberController {

	@Autowired
	private memberService memberservice;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		return "login.tiles";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "login.tiles";
	}

	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String signUp() {
		return "regist.tiles";
	}

	@ResponseBody
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public Map<Object, Object> loginAf(HttpServletRequest req, memberDto mem) throws Exception {
		Map<Object, Object> map = new HashMap<>();
		memberDto login = null;
		// [반환값 - ( 아이디없음 : 0, 비밀번호 오류 : 1, 로그인 성공 : 2, 탈퇴대기 회원 : 3)]
		if (memberservice.idCheck(mem.getId()) == 0) {
			// 아이디 없음
			req.getSession().invalidate();
			map.put("cnt", 0);
			return map;
		}
		login = memberservice.login(mem);
		if (login != null && !login.getId().equals("")) {
			// 로그인 성공
			if (login.getAuth() == 1) {
				// 탈퇴대기중인 회원일 경우
				req.getSession().invalidate();
				map.put("cnt", 3);
				return map;
			} else {
				// 관리자, 일반회원 로그인 성공
				req.getSession().setAttribute("login", login);
				map.put("cnt", 2);
				return map;
			}
		} else {
			// 비밀번호 오류
			req.getSession().invalidate();
			map.put("cnt", 1);
			return map;
		}
	}

	@ResponseBody
	@RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
	public Map<Object, Object> idCheck(String id) throws Exception {
		int cnt = 0;
		Map<Object, Object> map = new HashMap<>();
		cnt = memberservice.idCheck(id);
		map.put("cnt", cnt);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "nickCheck.do", method = RequestMethod.POST)
	public Map<Object, Object> nickCheck(String nickname) throws Exception {
		int cnt = 0;
		Map<Object, Object> map = new HashMap<>();
		cnt = memberservice.nickCheck(nickname);
		map.put("cnt", cnt);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "emailCheck.do", method = RequestMethod.POST)
	public Map<Object, Object> emailCheck(String email) throws Exception {
		int cnt = 0;
		Map<Object, Object> map = new HashMap<>();
		cnt = memberservice.emailCheck(email);
		map.put("cnt", cnt);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public Map<String, Integer> regiAf(memberDto mem) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		boolean isS = memberservice.addMember(mem);
		if (isS) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}
		return map;
	}

	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage(HttpServletRequest req, Model model) throws Exception {
		memberDto mem = (memberDto) req.getSession().getAttribute("login");
		if (mem == null) {
			return "redirect:login.do";
		} else {
			int orderCnt = memberservice.getOrderCount(mem.getId());
			int wishCnt = memberservice.getWishListCount(mem.getId());
			List<reviewDto> DummyReviewList = memberservice.getMyReviewList(mem.getId());
			List<qaDto> DummyqaList = memberservice.getAdminQaList();
			List<reviewDto> reviewList = new ArrayList<>();
			List<qaDto> qaList = new ArrayList<>();
			if (DummyqaList.size() > 4) {
				for (int i = 0; i < 4; i++) {
					qaList.add(i, DummyqaList.get(i));
				}
			} else {
				qaList = DummyqaList;
			}
			if (DummyReviewList.size() > 2) {
				for (int i = 0; i < 2; i++) {
					reviewList.add(i, DummyReviewList.get(i));
				}
			} else {
				reviewList = DummyReviewList;
			}
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("qaList", qaList);
			model.addAttribute("orderCnt", orderCnt);
			model.addAttribute("wishCnt", wishCnt);
			return "mypage.tiles";
		}
	}

	@RequestMapping(value = "userUpdate.do", method = RequestMethod.GET)
	public String userUpdate(HttpServletRequest req) {
		memberDto mem = (memberDto) req.getSession().getAttribute("login");
		if (mem == null) {
			return "redirect:login.do";
		} else {
			return "userUpdate.tiles";
		}
	}

	@ResponseBody
	@RequestMapping(value = "userUpdateAf.do", method = RequestMethod.POST)
	public Map<String, Integer> userUpdateAf(memberDto mem, HttpServletRequest req) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		boolean isS = memberservice.userUpdateAf(mem);
		if (isS) {
			req.getSession().invalidate();
			memberDto login = null;
			login = memberservice.login(mem);
			if (login != null && !login.getId().equals("")) {
				req.getSession().setAttribute("login", login);
			} else {
				req.getSession().invalidate();
			}
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}
		return map;
	}

	@RequestMapping(value = "secession.do", method = RequestMethod.GET)
	public String secession(HttpServletRequest req, Model model) throws Exception {
		memberDto mem = (memberDto) req.getSession().getAttribute("login");
		if (mem == null) {
			return "redirect:login.do";
		} else {
			int orderCnt = memberservice.getOrderCount(mem.getId());
			int wishCnt = memberservice.getWishListCount(mem.getId());
			List<reviewDto> DummyReviewList = memberservice.getMyReviewList(mem.getId());
			List<qaDto> DummyqaList = memberservice.getAdminQaList();
			List<reviewDto> reviewList = new ArrayList<>();
			List<qaDto> qaList = new ArrayList<>();
			if (DummyqaList.size() > 4) {
				for (int i = 0; i < 4; i++) {
					qaList.add(i, DummyqaList.get(i));
				}
			} else {
				qaList = DummyqaList;
			}
			if (DummyReviewList.size() > 2) {
				for (int i = 0; i < 2; i++) {
					reviewList.add(i, DummyReviewList.get(i));
				}
			} else {
				reviewList = DummyReviewList;
			}
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("qaList", qaList);
			model.addAttribute("orderCnt", orderCnt);
			model.addAttribute("wishCnt", wishCnt);
			return "secession.tiles";
		}
	}

	@ResponseBody
	@RequestMapping(value = "secessionAf.do", method = RequestMethod.POST)
	public Map<String, Integer> secessionAf(secessionDto sec, HttpServletRequest req) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		boolean isS = memberservice.secessionAf(sec);
		if (isS) {
			req.getSession().invalidate();
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}
		return map;
	}

	@RequestMapping(value = "rentalList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String rentalList(HttpServletRequest req, Model model) throws Exception {
		memberDto mem = (memberDto) req.getSession().getAttribute("login");
		if (mem == null) {
			return "redirect:login.do";
		} else {
			int orderCnt = memberservice.getOrderCount(mem.getId());
			int wishCnt = memberservice.getWishListCount(mem.getId());
			List<reviewDto> DummyReviewList = memberservice.getMyReviewList(mem.getId());
			List<qaDto> DummyqaList = memberservice.getAdminQaList();
			List<reviewDto> reviewList = new ArrayList<>();
			List<qaDto> qaList = new ArrayList<>();
			if (DummyqaList.size() > 4) {
				for (int i = 0; i < 4; i++) {
					qaList.add(i, DummyqaList.get(i));
				}
			} else {
				qaList = DummyqaList;
			}
			if (DummyReviewList.size() > 2) {
				for (int i = 0; i < 2; i++) {
					reviewList.add(i, DummyReviewList.get(i));
				}
			} else {
				reviewList = DummyReviewList;
			}
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("qaList", qaList);
			model.addAttribute("orderCnt", orderCnt);
			model.addAttribute("wishCnt", wishCnt);
			String id = mem.getId();
			List<RStatusDto> list = memberservice.getR_StatusList(id);
			model.addAttribute("list", list);
			return "rentalList.tiles";
		}
	}

	@RequestMapping(value = "basketList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String basketList(HttpServletRequest req, Model model) throws Exception {
		memberDto mem = (memberDto) req.getSession().getAttribute("login");
		if (mem == null) {
			return "redirect:login.do";
		} else {
			int orderCnt = memberservice.getOrderCount(mem.getId());
			int wishCnt = memberservice.getWishListCount(mem.getId());
			List<reviewDto> DummyReviewList = memberservice.getMyReviewList(mem.getId());
			List<qaDto> DummyqaList = memberservice.getAdminQaList();
			List<reviewDto> reviewList = new ArrayList<>();
			List<qaDto> qaList = new ArrayList<>();
			if (DummyqaList.size() > 4) {
				for (int i = 0; i < 4; i++) {
					qaList.add(i, DummyqaList.get(i));
				}
			} else {
				qaList = DummyqaList;
			}
			if (DummyReviewList.size() > 2) {
				for (int i = 0; i < 2; i++) {
					reviewList.add(i, DummyReviewList.get(i));
				}
			} else {
				reviewList = DummyReviewList;
			}
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("qaList", qaList);
			model.addAttribute("orderCnt", orderCnt);
			model.addAttribute("wishCnt", wishCnt);
			String id = mem.getId();
			List<basketListDto> list = memberservice.getBasketList(id);
			model.addAttribute("list", list);
			return "basketList.tiles";
		}
	}

	@ResponseBody
	@RequestMapping(value = "basketListDel.do", method = RequestMethod.POST)
	public Map<String, Integer> checkDelAf(String delList, HttpServletRequest req) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		String Multi_seq[];
		String Single_seq[];

		if (delList.indexOf("end") != -1) {
			Single_seq = delList.split("-");
			if (memberservice.basketListDel(Integer.parseInt(Single_seq[0]))) {
				map.put("cnt", 1);
			} else {
				map.put("cnt", 0);
			}
		} else {
			Multi_seq = delList.split("-");
			for (int i = 0; i < Multi_seq.length; i++) {
				if (memberservice.basketListDel(Integer.parseInt(Multi_seq[i]))) {
					map.put("cnt", 1);
				} else {
					map.put("cnt", 0);
				}
			}
		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "getTotalPrice.do", method = RequestMethod.POST)
	public Map<String, Integer> getTotalPrice(String totalPrice, HttpServletRequest req) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		String seq[] = totalPrice.split("-");
		Integer total = 0;
		for (int i = 0; i < seq.length; i++) {
			total += memberservice.getTotalPrice(Integer.parseInt(seq[i]));
		}
		map.put("total", total);
		return map;
	}

	@RequestMapping(value = "memToGoods_Detail.do", method = RequestMethod.GET)
	public String memToGoods_Detail(Model model, String g_code) throws Exception {
		int seq = memberservice.getGoodsSeq(g_code);
		if (seq > 0) {
			model.addAttribute("seq", seq);
			model.addAttribute("g_code", g_code);
			return "redirect:goodsdetail.do";
		} else {
			return "basketList.tiles";
		}
	}

	@ResponseBody
	@RequestMapping(value = "rentalListDel.do", method = RequestMethod.POST)
	public Map<String, Integer> rentalListDel(String delList, HttpServletRequest req) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		String Multi_seq[];
		String Single_seq[];

		if (delList.indexOf("end") != -1) {
			Single_seq = delList.split("-");
			if (memberservice.rentalListDel(Integer.parseInt(Single_seq[0]))) {
				map.put("cnt", 1);
			} else {
				map.put("cnt", 0);
			}
		} else {
			Multi_seq = delList.split("-");
			for (int i = 0; i < Multi_seq.length; i++) {
				if (memberservice.rentalListDel(Integer.parseInt(Multi_seq[i]))) {
					map.put("cnt", 1);
				} else {
					map.put("cnt", 0);
				}
			}
		}
		return map;
	}

	public List<Object> changeList(List<Object> Dummy, List<Object> list) {
		if (Dummy.size() > 4) {
			for (int i = 0; i < 4; i++) {
				list.add(i, Dummy.get(i));
			}
		} else {
			list = Dummy;
		}
		return list;
	}
}
