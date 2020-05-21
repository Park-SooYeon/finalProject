package partner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.DitailViewVo;

@Controller
public class PtnHtCompController {
	
	PtnHtCompDao dao;
	
	public PtnHtCompController(PtnHtCompDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/dashboard.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView dashboard(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("dashboard");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_list.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		List<DitailViewVo> list = dao.select();

		
		mv.addObject("list", list);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_add.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_add");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/insert.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insertR(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_modify.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_delete.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	
}
