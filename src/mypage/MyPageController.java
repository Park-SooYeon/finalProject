package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mypage_mybatis.TripListVo;

@Controller
public class MyPageController {
	MyPageDao dao;
	
	MyPageController(MyPageDao dao){
		this.dao = dao;
	}
	
	ModelAndView mv;
	
	@RequestMapping(value = "profile.mp", method= {RequestMethod.GET, RequestMethod.POST})
	public String profile(HttpServletRequest req) {
		mv = new ModelAndView();
		return "my_social";
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
	
	@RequestMapping( value = "newtrip.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public String modify(HttpServletRequest req) {
		System.out.println("여기 들어오는지");
		TripListVo vo = new TripListVo(); 
		
		String trip_name = "";
		String member_id = "testId";
		int days_count = 0;
		String start_date = "";
		String end_date = "test";
		int trip_auth = 1;
		
		if(req.getParameter("trip_name")!=null && req.getParameter("trip_name")!="") {
			trip_name = req.getParameter("trip_name");
		};
		
		if(req.getParameter("days_count")!=null && req.getParameter("days_count")!="") {
			days_count = Integer.parseInt(req.getParameter("days_count"));
		}
		
		if(req.getParameter("start_date")!=null && req.getParameter("start_date")!="") {
			start_date = req.getParameter("start_date");
		}
		
		if(req.getParameter("end_date")!=null && req.getParameter("end_date")!="") {
			end_date = req.getParameter("end_date");
		}
		trip_auth = Integer.parseInt(req.getParameter("trip_auth"));
		
		vo.setTrip_name(trip_name);
		vo.setMember_id(member_id);
		vo.setDays_count(days_count);
		vo.setStart_date("2020-05-11");
		vo.setEnd_date("2020-05-13");
		vo.setTrip_auth(trip_auth);
		
		System.out.println(trip_name);
		System.out.println(member_id);
		System.out.println(days_count);
		System.out.println(start_date);
		System.out.println(end_date);
		System.out.println(trip_auth);
		
		String msg = dao.insert(vo);
		System.out.println(msg);
		
		return "my_list";
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
