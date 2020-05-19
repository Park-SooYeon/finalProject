package mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		// mypage/my_social.jsp
	}
	
	@RequestMapping( value ="mypage.mp", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mypage(HttpServletRequest req) {
		mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping( value = "mybooking.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mybooking() {
		mv = new ModelAndView();
		mv.setViewName("my_page");
		return mv;
	}

	@RequestMapping( value = "mytrip.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select(HttpServletRequest req, HttpServletResponse resp) {
		mv = new ModelAndView();
		List<TripListVo> list = dao.select();
		mv.setViewName("trip_list");
		mv.addObject("list", list);
		return mv;
		// mypage/my_list.jsp
	}
	
	@ResponseBody
	@RequestMapping( value = "newtrip.mp", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/html;charset=utf8")
	public String insert(HttpServletRequest req) {
		System.out.println("여기 들어오는지");
		TripListVo vo = new TripListVo(); 
		
		String trip_name = "";
		String member_id = "testId";
		int days_count = 0;
		String start_date = "";
		String end_date = "";
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
		
		trip_auth = Integer.parseInt(req.getParameter("trip_auth"));
		
		vo.setTrip_name(trip_name);
		vo.setMember_id(member_id);
		vo.setDays_count(days_count);

		if(start_date!="") {
			String[] values = start_date.split(" - ");
			start_date = values[0];
			end_date = values[1];
		}
		vo.setStart_date(start_date);
		vo.setEnd_date(end_date);
		vo.setTrip_auth(trip_auth);
		
		String msg = dao.insert(vo);
		System.out.println(msg);
		
		return msg;
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
