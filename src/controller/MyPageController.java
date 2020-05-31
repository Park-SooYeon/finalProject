package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.FollowListVo;
import bean.LikeListVo;
import bean.ReviewVo;
import bean.TripListVo;
import bean.membershipVo;
import dao.MyPageDao;

@Controller
public class MyPageController {
	MyPageDao dao;
	
	MyPageController(MyPageDao dao){
		this.dao = dao;
	}
	
	ModelAndView mv;
	
	@GetMapping(value = "profile.mp")
	public ModelAndView profile(@RequestParam String id, HttpSession session) {
		// get타입으로 아이디 전달받음 (프로필주인)
		mv = new ModelAndView();
		membershipVo vo = dao.selectProfile(id);
		FollowListVo fvo = new FollowListVo();
		
		// 현재 접속해있는 아이디
		String member_id = (String)session.getAttribute("member_id");
		fvo.setMember_id(member_id);
		fvo.setTarget_id(id);
		
		// 해당 아이디 팔로우하고 있는지 여부 판단
		int flag = dao.getFollow(fvo);
		
		// 팔로우 수, 팔로워 수 반환 <follow, n> <follower, n> 형태
		Map<String, Integer> map = dao.getFollowCnt(member_id);
		
		mv.setViewName("my_social");
		mv.addObject("map", map);
		mv.addObject("flag", flag);
		mv.addObject("vo", vo);
		return mv;
	}
	
	// 회원정보 수정
	@RequestMapping( value ="mypage.mp", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mypage(HttpServletRequest req) {
		mv = new ModelAndView();
		return mv;
	}
	
	// 예약내역 확인
	@RequestMapping( value = "mybooking.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public String mybooking() {
		return "my_page";
	}

	// 여행리스트, 관심리스트, 좋아요한 리뷰 보기 페이지
	@RequestMapping( value = "mytrip.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select(HttpSession session) {
		mv = new ModelAndView();
		String member_id = (String)session.getAttribute("member_id");
		List<TripListVo> list = dao.select(member_id);
		mv.setViewName("trip_list");
		mv.addObject("list", list);
		return mv;
		// mypage/my_list.jsp
	}
	
	
	// 새로운 여행 만들었을 때
	@ResponseBody
	@RequestMapping( value = "newtrip.mp", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/html;charset=utf8")
	public String insert(HttpServletRequest req, HttpSession session) {
		System.out.println("여기 들어오는지");
		TripListVo vo = new TripListVo(); 
		
		String trip_name = "";
		String member_id = (String)session.getAttribute("member_id");
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
	public String modifyR(HttpServletRequest req, HttpSession session) {
		TripListVo vo = new TripListVo();
		
		String trip_name = "";
		String member_id = (String)session.getAttribute("member_id"); //추후 세션 아이디로 수정
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
	
	
	// triplist 삭제시에
	@ResponseBody
	@RequestMapping( value = "deleteTrip.mp", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/html;charset=utf8")
	public String deleteR(HttpServletRequest req, HttpServletResponse resp) {
		int trip_list_serial = Integer.parseInt(req.getParameter("serial"));
		String msg = dao.delete(trip_list_serial);
		return msg;
	}
	
	@RequestMapping( value = "likeList.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectLike(HttpSession session) {
		mv = new ModelAndView();
		String member_id = (String)session.getAttribute("member_id");
		// 추후 session으로 값 받아와서 id에 넣어주기
		
		System.out.println(member_id);
		List<LikeListVo> list = dao.selectLike(member_id);
		
		for(LikeListVo vo : list) {
			System.out.println("갑자기 리스트 폭발증가 "+list.size());
			System.out.println(vo.toString());
		}
		
		mv.setViewName("like_list");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping( value = "likeReview.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectReview(HttpServletRequest req, HttpSession session) {
		mv = new ModelAndView();
		String member_id = (String)session.getAttribute("member_id");
		List<ReviewVo> list = dao.selectReview(member_id);
		
		for(ReviewVo vo : list) {
			System.out.println(vo.toString());
		}
		
		mv.setViewName("review_list");
		mv.addObject("list", list);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping( value = "editProfile.mp", method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public String editProfile(HttpServletRequest request, membershipVo vo){
		
		String msg = "";
		MultipartFile imgFile = vo.getImgFile();
		
		if (!imgFile.isEmpty()) { // 파일이 있으면
			System.out.println("이미지 있다");

		String originalFilename = imgFile.getOriginalFilename(); // 오리지널 파일명
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	     
	    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
//	    String fullpath = request.getContextPath()+"/images/myPage/profile/"+rename;
	    String fullpath  = request.getSession().getServletContext().getRealPath("images/myPage/profile/")+rename;
//	    String fullpath  = request.getSession().getServletContext().getContext("/").getRealPath("");
	    //String testpath = request.getSession().getServletContext().getContext("/images").getRealPath("");
	    
	    System.out.println(fullpath);
	    //System.out.println(testpath);
	    // 실제로 들어갈 파일경로 + 파일명 
	    	vo.setMember_photo(fullpath);
	    } 
	     
	    // 파라미터로 전달받은 vo 프로퍼티 setting
		System.out.println(vo.toString());
		msg = dao.modifyProfile(vo,imgFile);
	    
	    return msg;
	}
	
	@ResponseBody
	@RequestMapping( value = "follow.mp", method = RequestMethod.GET, produces = "text/html;charset=utf8")
	public String addFollow(@RequestParam String target_id, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		FollowListVo vo = new FollowListVo();
		vo.setTarget_id(target_id);
		vo.setMember_id(member_id);
		// 멤버아이디 세션 scope에서 가져오기
		String msg = dao.addFollow(vo);
		return msg;
	}
	
	@ResponseBody
	@RequestMapping( value = "follow_delete.mp", method = RequestMethod.GET, produces = "text/html;charset=utf8")
	public String deleteFollow(@RequestParam String target_id, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		FollowListVo vo = new FollowListVo();
		vo.setTarget_id(target_id);
		vo.setMember_id(member_id);
		// 멤버아이디 세션 scope에서 가져오기
		String msg = dao.deleteFollow(vo);
		return msg;
	}
	
	@ResponseBody
	@RequestMapping( value = "follow_cnt.mp", method = RequestMethod.GET, produces = "text/html;charset=utf8")
	public String selectFollowCnt(@RequestParam String target_id, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		FollowListVo vo = new FollowListVo();
		vo.setTarget_id(target_id);
		vo.setMember_id(member_id);
		// 멤버아이디 세션 scope에서 가져오기
		String msg = dao.deleteFollow(vo);
		return msg;
	}
	
	@RequestMapping( value = "selectPosts.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectPosts(HttpServletRequest req, HttpSession session) {
		mv = new ModelAndView();
		String member_id = (String)session.getAttribute("member_id");
		List<ReviewVo> list = dao.selectFollowReview(member_id);
		
		for(ReviewVo vo : list) {
			System.out.println(vo.toString());
		}
		
		mv.setViewName("my_social_posts");
		mv.addObject("list", list);
		return mv;
	}

	// 여행 커스터마이징 
	@RequestMapping( value = "editTrip.mp", method = {RequestMethod.GET})
	public ModelAndView editTrip(HttpServletRequest req, HttpSession session) {
		mv = new ModelAndView();
		
		// serial을 get타입으로 넘겨받음
		int serial = Integer.parseInt(req.getParameter("se"));
		String member_id = (String)session.getAttribute("member_id");
		
		TripListVo vo = dao.viewTrip(serial,member_id);
		System.out.println("뭐징");
		System.out.println(vo.toString());
		mv.addObject("vo", vo);
		mv.setViewName("edit_trip");
		return mv;
	}
	
	
	// 파일명 만들어줄때 필요한 날짜변환 함수
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
}
