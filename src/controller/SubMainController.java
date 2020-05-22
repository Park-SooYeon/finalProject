package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.PlaceVo;
import dao.SubMainDao;
import mypage.MyPageDao;
import mypage_mybatis.TripListVo;
import vo.MainVo;

@Controller
public class SubMainController {
	
	// 지역 메인으로 이동
	@GetMapping("placeMain.sb")
	public String placeMain(@RequestParam int local, Model model) {
		
		List<PlaceVo> happyList = null;
		List<PlaceVo> foodList = null;
		List<PlaceVo> festivalList = null;
		List<TripListVo> tripList = null;
		// 좋아요한 여행지 번호 가져오기
		SubMainDao dao = new SubMainDao();
		
		happyList = dao.happyMenuSelect(local);
		foodList = dao.foodMenuSelect(local);
		festivalList = dao.festivalMenuSelect(local);
		tripList = dao.callTripList();
		
		model.addAttribute("happyList", happyList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("tripList", tripList);
		
		return "placeMain";
	}
	
	// 지역 상관 없는 메인으로 이동
	@GetMapping("menuMain.sb")
	public String menuMain(@RequestParam int menu, Model model) {
		
		List<PlaceVo> starList = null;
		List<PlaceVo> reviewList = null;
		List<TripListVo> tripList = null;
		SubMainDao dao = new SubMainDao();
		
		starList = dao.highStarsSelect(menu);
		reviewList = dao.manyReviewSelect(menu);
		tripList = dao.callTripList();
		
		model.addAttribute("starList", starList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("tripList", tripList);
		return "menuMain";
	}
	
	// 더보기로 관광지 검색 페이지로 이동
	@GetMapping("mainMore.sb")
	public String ViewMore(@RequestParam(required = false) int local, @RequestParam int menu, Model model) {
		
		List<PlaceVo> list = null;
		SubMainDao dao = new SubMainDao();
		
		switch(menu) {
		case 1:
			list = dao.happyMenuSelect(local);
			break;
		case 2:
			list = dao.foodMenuSelect(local);
			break;
		case 3:
			list = dao.festivalMenuSelect(local);
			break;
		}
		
		model.addAttribute("list", list);
		return "food_index";
	}
	
	// 관광지 상세보기로 이동
	@GetMapping("detailView.sb")
	public String detailView(@RequestParam("code") int place_code) {
		
		return "detailView";
	}
	
	
	// 여행 폴더 추가하기
	@ResponseBody
	@PostMapping("insertTrip.sb")
	public String insertTrip(@RequestParam("trip_name") String trip_name, HttpServletRequest req, Model model) {
		System.out.println(trip_name);
		SubMainDao dao = new SubMainDao();
		
		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		System.out.println(id);
		
		// 새로운 여행 정보 setting
		TripListVo vo = new TripListVo();
		vo.setTrip_name(trip_name);
		vo.setMember_id("test");
		vo.setTrip_auth(1);
		vo.setDays_count(0);
		
		
		String trip_serial = dao.tripInsert(vo) + "";
		System.out.println(trip_serial);
		
		return trip_serial;
	}
	
	// 여행지 추가하기
	@ResponseBody
	@PostMapping("insertLikeTrip.sb")
	public String insertLikeTrip(@RequestParam("trip_serial") String trip_serial, HttpServletRequest req) {
		System.out.println(trip_serial);
		MyPageDao dao = new MyPageDao();
		
		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		System.out.println(id);
		
		// 좋아요한 여행지 정보 setting
		// like_list table에 추가
		
		return null;
	}
	
	@ResponseBody
	@PostMapping("restApiTest.sb")
	public String restApiTest() {
		StringBuilder sb = null;
		
		try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=B8%2BZaRoCMImsMJtdm0WOedSaSwRCucNkcnqroJSLiK%2F%2Fg7jsBF27h0GeG9RlWHRLEgkcHYh3PDV2qzL5Vh1WYA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*지역코드, 시군구코드*/
	        urlBuilder.append("&_type=json"); // json 타입으로 반환
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
		} catch (Exception ex) {
			System.out.println("rest api 오류");
			ex.printStackTrace();
		}
		return sb.toString();
	}
	
}
