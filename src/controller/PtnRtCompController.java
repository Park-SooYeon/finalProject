package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.PtnHtCompDao;
import dao.PtnRtCompDao;
import rent_parameter.CompanyVo;

@Controller
public class PtnRtCompController {
	
	PtnRtCompDao dao;
	
	public PtnRtCompController(PtnRtCompDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/rent_comp_list.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 세션 아이디로 파트너 시리얼 가져오기
		//PtnHtCompDao compDao = new PtnHtCompDao();
		System.out.println("member_id : " + member_id);
		int serial = dao.getSerial(member_id);
		
	
				
		System.out.println("serial" + serial);
		List<CompanyVo> list = dao.select(serial);
		System.out.println("list : " + list);
		
		mv.addObject("list", list);
		mv.setViewName("rent_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_comp_add.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_comp_modal");
		return mv;
	}
	
	
	@RequestMapping(value="/admin/partner/rent_comp_view.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		CompanyVo vo = null; 
		
		
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 세션 아이디로 파트너 시리얼 가져오기
		//PtnHtCompDao compDao = new PtnHtCompDao();
		int serial = dao.getSerial(member_id);
		
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_comp_modify.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_comp_delete.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_comp_list");
		return mv;
	}
	
	
}
