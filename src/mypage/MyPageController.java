package mypage;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.LikeListVo;
import bean.ProfileVo;
import bean.ReviewVo;
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
		mv = new ModelAndView();
		String member_id = "세왕";
		// 추후 session으로 값 받아와서 id에 넣어주기
		List<LikeListVo> list = dao.selectLike(member_id);
		
		for(LikeListVo vo : list) {
			System.out.println(vo.toString());
		}
		
		mv.setViewName("like_list");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping( value = "likeReview.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectReview(HttpServletRequest req, HttpServletResponse resp) {
		mv = new ModelAndView();
		String member_id = "test";
		List<ReviewVo> list = dao.selectReview(member_id);
		
		for(ReviewVo vo : list) {
			System.out.println(vo.toString());
		}
		
		mv.setViewName("review_list");
		mv.addObject("list", list);
		return mv;
	}
	
	/*
	@RequestMapping( value = "editProfile.mp", method = {RequestMethod.GET, RequestMethod.POST})
	public String editProfile(HttpServletRequest req, HttpServletResponse resp) {
		String member_id = "test";
		List<ReviewVo> list = dao.selectReview(member_id);
		
		for(ReviewVo vo : list) {
			System.out.println(vo.toString());
		}
		
		mv.setViewName("review_list");
		mv.addObject("list", list);
		return "";
	}
	*/
	
	
	@ResponseBody
	@RequestMapping( value = "editProfile.mp", method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public String editProfile(HttpServletRequest request, 
			@RequestParam("nickname") String nickname, 
			@RequestParam("member_photo") MultipartFile imgFile,
			@RequestParam("member_web") String member_web,
			@RequestParam("member_city") String member_city,
			@RequestParam("member_info") String member_info){
		
		System.out.println("nickname : "+nickname);
		System.out.println("여기가 들어와야지..");
		String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	     
	    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
	    String msg = "";
	    String fullpath  = request.getServletContext().getRealPath("/")+"images\\myPage\\profile\\"+rename;
	    System.out.println(fullpath);
	    
	    if (!imgFile.isEmpty()) {
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
	            stream.write(bytes);
	            stream.close();
	            msg = "파일 업로드 성공!";
	        } catch (Exception e) {
	            msg = "파일을 업로드하는 데에 실패했습니다.";
	        }
	    } else {
	        msg = "업로드할 파일을 선택해주시기 바랍니다.";
	    }
	     
	    ProfileVo vo = new ProfileVo();
	    vo.setMember_city(member_city);
	    vo.setMember_info(member_info);
	    vo.setMember_web(member_web);
	    vo.setNickname(nickname);
	    
	    System.out.println(vo.toString());
	    
	    return msg;
	}
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
}
