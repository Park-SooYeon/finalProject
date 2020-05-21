package adSuper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.membershipVo;

@Controller
public class AdSuperController {
	AdSuperDao dao;
	
	AdSuperController(AdSuperDao dao){
		this.dao = dao;
	}
	
	ModelAndView mv;
	
	@RequestMapping(value = "/admin/super/user_list.os", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView user_list(HttpServletRequest req) {
		mv = new ModelAndView();
		System.out.println("user_list컨트롤 들어오나");
		List<membershipVo> list = dao.select();
		mv.setViewName("user_list");
		mv.addObject("list", list);
//		for(membershipVo vo : list) {
//			System.out.println(vo.getMember_id());
//			System.out.println(vo.getState());
//		}
		return mv;
		//admin/super/user_list.jsp
	}
	
	
	
	
	
	
	
	@RequestMapping( value ="mypage.mp", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mypage(HttpServletRequest req) {
		mv = new ModelAndView();
		mv.setViewName("member_modify");
		return mv;
	}
	
	@RequestMapping( value = "mybooking.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mybooking() {
		mv = new ModelAndView();
		mv.setViewName("my_page");
		return mv;
	}

	@RequestMapping( value = "mytrip.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mytrip(HttpServletRequest req, HttpServletResponse resp) {
		mv = new ModelAndView();
		mv.setViewName("my_list");
		return mv;
	}
	
	@RequestMapping( value = "modify.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modify(HttpServletRequest req) {
		mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping( value = "modifyR.mp", method = {RequestMethod.POST})
	public ModelAndView modifyR(HttpServletRequest req, HttpServletResponse resp) {
		mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping( value = "deleteR.mp", method = {RequestMethod.POST})
	public ModelAndView deleteR(HttpServletRequest req) {
		mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping( value = "repl.mp", method = {RequestMethod.POST})
	public ModelAndView repl() {
		mv = new ModelAndView();
		mv.setViewName("repl");
		return mv;
	}
	
	@RequestMapping( value = "replR.mp", method = {RequestMethod.POST})
	public ModelAndView replR(HttpServletRequest req, HttpServletResponse resp) {
		
		mv = new ModelAndView();
		String msg = "";
		
		return mv;
	}
	
}
