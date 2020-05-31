package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.DetailViewDao;

@Controller
public class DetailViewController {
	DetailViewDao dao;
	
	public DetailViewController(DetailViewDao dao) {
		this.dao = dao;		
	}
	//공공DB API 테스트
	@GetMapping("detailView.dv")
	public String detailView(@RequestParam String code, HttpServletRequest req, Model model) {
		
		System.out.println("detailView 컨트롤 들어옴");
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=72UE6YqIhgZCaHahqDmsBTNsa0XOjd5XmbvKs4aN6siytqGn42eemUfJbAvLBeo5IYY%2B4L5PnZB3o2kNJ0GpNQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(code, "UTF-8")); /*콘텐츠ID*/
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
	        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*기본정보 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*원본, 썸네일 대표이미지 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("catcodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*대,중,소분류코드 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*주소, 상세주소 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*좌표 X,Y 조회여부*/
	        urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*콘텐츠 개요 조회여부*/
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
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("공공DB 오류");
		}
		
		
		//공공DB API사진조회
		try {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=72UE6YqIhgZCaHahqDmsBTNsa0XOjd5XmbvKs4aN6siytqGn42eemUfJbAvLBeo5IYY%2B4L5PnZB3o2kNJ0GpNQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(code, "UTF-8")); /*콘텐츠 ID*/
	        urlBuilder.append("&" + URLEncoder.encode("imageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*Y=콘텐츠 이미지 조회, N='음식점'타입의 음식메뉴 이미지*/
	        urlBuilder.append("&" + URLEncoder.encode("subImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*Y=원본,썸네일 이미지 조회 N=Null*/
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
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("공공DB 오류");
		}
		
		
		
		return "detailView";
	}
	
	
	
	
	
	/*
	//상세보기
	@RequestMapping(value = "detailView.dv", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		DetailViewVo vo = null;		
		int place_serial = Integer.parseInt(req.getParameter("code"));		
		//vo = dao.view(place_serial);
		
		List<PlaceVo> list = null;
		//List<PlaceVo> list = dao.photoView(place_serial);
		
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		//System.out.println(list.get(0).getPhoto_name());
		mv.setViewName("detailView");
		
		return mv;
	}
	
	//리뷰 신고하기
	@RequestMapping(value = "report.dv", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView report(HttpServletRequest req,
							   @RequestParam(value = "report_code[]") List<String> report_code, 
							   @RequestParam(value="report_content") String report_content) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		String report_id = (String)session.getAttribute("member_id");
		
		
		
		mv.addObject("report_id", report_id);
		mv.addObject("report_code", report_code);
		mv.addObject("report_content", report_content);
		mv.setViewName("report");
		
		return mv;
	}*/

}
