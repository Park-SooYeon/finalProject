package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_order_list");
		return mv;
	}
	
	
	@RequestMapping(value="/admin/partner/hotel_order_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_order_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_order_modify.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_order_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_order_delete.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_order_list");
		return mv;
	}
	
	
}
