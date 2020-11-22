package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.PtnRtCompDao;
import dao.PtnRtOrderDao;
import rent_parameter.ReserveVo;

@Controller
public class PtnRtOrderController {
	PtnRtOrderDao dao;
	
	public PtnRtOrderController(PtnRtOrderDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/rent_order_list.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		List<ReserveVo> list = null;
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 세션 아이디로 파트너 시리얼 가져오기
		PtnRtCompDao compDao = new PtnRtCompDao();
		int serial = compDao.getSerial(member_id);
		
		Map<String, String> info = dao.selectInfo(serial);
		list = dao.select(serial);
		
		mv.addObject("info", info);
		mv.addObject("list", list);
		mv.setViewName("rent_order_list");
		return mv;
	}
	
	
	@RequestMapping(value="/admin/partner/rent_order_view.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_order_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_order_modify.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_order_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_order_delete.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_order_list");
		return mv;
	}
	
}
