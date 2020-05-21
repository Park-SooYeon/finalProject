package mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.LikeListVo;
import bean.TripListVo;

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
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping( value = "modify_trip.mp", method = {RequestMethod.POST}, produces = "text/html;charset=utf8")
	public String modifyR(HttpServletRequest req, HttpServletResponse resp) {
		TripListVo vo = new TripListVo();
		
		String trip_name = "";
		String member_id = "testId"; //추후 세션 아이디로 수정
		int days_count = 0;
		String start_date = null;
		String end_date = null;
		int trip_auth = 1;
		
		if(req.getParameter("trip_name")!=null && req.getParameter("trip_name")!="") {
			trip_name = req.getParameter("trip_name");
		};
		
		if(req.getParameter("days_count")!=null && req.getParameter("days_count")!="") {
			System.out.println("days count가 값이 있ㅇㄹ 때");
			days_count = Integer.parseInt(req.getParameter("days_count"));
		}
		
		if(req.getParameter("start_date")!=null && req.getParameter("start_date")!="") {
			start_date = req.getParameter("start_date");
		}
		
		int trip_list_serial = Integer.parseInt(req.getParameter("trip_serial"));
		trip_auth = Integer.parseInt(req.getParameter("trip_auth"));
		
		vo.setTrip_name(trip_name);
		vo.setMember_id(member_id);
		vo.setDays_count(days_count);

		System.out.println(days_count);
		
		if(start_date!="" && start_date!=null) {
			String[] values = start_date.split(" - ");
			start_date = values[0];
			end_date = values[1];
		}
		
		vo.setStart_date(start_date);
		vo.setEnd_date(end_date);
		vo.setTrip_auth(trip_auth);
		vo.setTrip_list_serial(trip_list_serial);
		
		System.out.println(vo.toString());
		
		String msg = dao.modify(vo);
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping( value = "deleteTrip.mp", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/html;charset=utf8")
	public String deleteR(HttpServletRequest req, HttpServletResponse resp) {
		int trip_list_serial = Integer.parseInt(req.getParameter("serial"));
		String msg = dao.delete(trip_list_serial);
		return msg;
	}
	
	@RequestMapping( value = "likeList.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectLike() {
		System.out.println("실행이 안 돼서 속상..");
		mv = new ModelAndView();

		List<LikeListVo> list = dao.selectLike("세왕");
		
		mv.setViewName("like_list");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping( value = "replR.mp", method = {RequestMethod.POST})
	public ModelAndView replR(HttpServletRequest req, HttpServletResponse resp) {
		
		mv = new ModelAndView();
		String msg = "";
		
		return mv;
	}
	
}
