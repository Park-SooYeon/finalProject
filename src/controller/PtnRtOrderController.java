package partner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PtnRtOrderController {
	PtnRtOrderDao dao;
	
	public PtnRtOrderController(PtnRtOrderDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/rent_order_list.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
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
