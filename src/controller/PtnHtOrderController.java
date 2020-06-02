package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.PlaceVo;
import bean.hotelBookingVo;
import dao.PtnHtCompDao;
import dao.PtnHtOrderDao;

@Controller
public class PtnHtOrderController {
	PtnHtOrderDao dao;
	
	public PtnHtOrderController(PtnHtOrderDao dao) {
		this.dao = dao;
	}
	

	@RequestMapping(value="/admin/partner/hotel_order_list.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 세션 아이디로 파트너 시리얼 가져오기
		PtnHtCompDao compDao = new PtnHtCompDao();
		int serial = compDao.getSerial(member_id);
		
		Map<String, String> info = dao.selectInfo(serial);
		 
		List<hotelBookingVo> list = dao.select(serial);
		
		mv.addObject("info", info);
		mv.addObject("list", list);
		mv.setViewName("hotel_order_list");
		return mv;
	}
	
	
	@RequestMapping(value="/admin/partner/hotel_order_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		hotelBookingVo vo = null; 
		
		// booking serial 가져오기 
		int serial = Integer.parseInt(req.getParameter("bserial"));
		vo = dao.view(serial);

		mv.addObject("vo", vo);
		mv.setViewName("hotel_order_modal");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_order_cancle.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		hotelBookingVo vo = null; 
		
		int serial = Integer.parseInt(req.getParameter("bserial"));
		int result = dao.modify(serial);
		
		mv.addObject("result", result);
		mv.setViewName("hotel_order_list");
		return mv;
	}
	
	
	
	
}
