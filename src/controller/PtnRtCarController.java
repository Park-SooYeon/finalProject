package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.PtnRtCarDao;
import dao.PtnRtCompDao;
import rent_parameter.CarVo;
import rent_parameter.CompanyVo;

@Controller
public class PtnRtCarController {
	PtnRtCarDao dao;
	
	public PtnRtCarController(PtnRtCarDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/rent_car_list.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		CarVo vo = null; 
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 세션 아이디로 파트너 시리얼 가져오기
		//PtnHtCompDao compDao = new PtnHtCompDao();
		PtnRtCompDao compDao = new PtnRtCompDao();
		int serial = compDao.getSerial(member_id);
		
		System.out.println("serial" + serial);
		List<CarVo> list = dao.select(serial);
		System.out.println("list : " + list);
		
		mv.addObject("list", list);
		mv.setViewName("rent_car_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_car_add.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		CompanyVo vo = null; 
		
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 세션 아이디로 파트너 시리얼 가져오기
		//PtnHtCompDao compDao = new PtnHtCompDao();
		PtnRtCompDao compDao = new PtnRtCompDao();
		int serial = compDao.getSerial(member_id);
		System.out.println("serial : " + serial);
		List<CompanyVo> list = dao.selectComp(serial);
		
		mv.addObject("list", list);
		mv.setViewName("rent_car_add");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_car_insertR.pr", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insertR(MultipartHttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		
		
		mv.setViewName("rent_car_list");
		return mv;
	}
	
	
	@RequestMapping(value="/admin/partner/rent_car_view.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_car_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_car_modify.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_car_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/rent_car_delete.pr", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("rent_car_list");
		return mv;
	}
	
	
}
