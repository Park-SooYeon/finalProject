package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

import bean.LikeListVo;
import bean.PlaceVo;
import bean.TripListVo;
import dao.MyPageDao;
import dao.SubMainDao;
import vo.ReputationVo;
import vo.RestDataVo;

@Controller
public class SubMainController {
	
	// 지역 메인으로 이동
	@GetMapping("placeMain.sb")
	public String placeMain(@RequestParam String local, HttpServletRequest req, Model model) {
		List<RestDataVo> todayList = new ArrayList<>();
		
		List<RestDataVo> happyList = null;
		List<RestDataVo> foodList = null;
		List<RestDataVo> festivalList = null;
		List<TripListVo> tripList = null;
		List<Integer> likeList = null;
		
		SubMainDao dao = new SubMainDao();
		
		// 쿠기에서 place_serial 값 가져오기
		Cookie[] cookies = req.getCookies();
		//System.out.println(cookies.length);
		
		if(cookies != null) {
			for(int i = 0 ; i < cookies.length ; i++) {
				Cookie c = cookies[i];
				
				// 쿠키 값이 존재할 때만 최근 본 관광지 정보를 가져옴
				if(c.getName().equals("place_serial")) {
					String value = c.getValue();
					String[] cookieList = value.split("\\|");
					
					System.out.println("v : " + value);
					for(int j = 0 ; j < cookieList.length ; j++) {
						StringBuilder sb = new StringBuilder();
						System.out.println(cookieList[j]);
						ReputationVo starVo = dao.selectReputation(cookieList[j]);
						try {
					        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); // contentid 기반 관광정보조회 URL
					        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
					        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
					        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
					        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
					        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //한 페이지 결과수
					        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //기본정보 조회 여부
					        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //주소, 상세주소 조회 여부
					        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //썸네일 대표 이미지 조회 여부
					        
					        // 가변 정보
					        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(cookieList[j] + "", "UTF-8")); //콘텐츠 ID
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
					        //sb = new StringBuilder();
					        String line;
					        String result = "";
					        while ((line = rd.readLine()) != null) {
					        	// 필요한 데이터만 반환받기 위해 적용
					        	System.out.println(line);
					        	int beginIndex = line.indexOf("{\"addr1");
					        	int endIndex = line.indexOf("}},");
					        	System.out.println(beginIndex + "," + endIndex);
					        	
					        	if(beginIndex != -1 || endIndex != -1) {
						        	result = line.substring(beginIndex, endIndex + 1);
						        	System.out.println("result : " + result);
						        	
						        	sb.append(result);
						        	if(starVo != null) { // 리뷰가 존재할 경우에만 추가
						        		sb.insert(sb.length() - 1, ",\"reputation\":" + starVo.getReputation() + ",\"review_cnt\":" + starVo.getReview_cnt());					        		
						        	}
						        	System.out.println("sb : " + sb.toString());
					        	}
					        }
					        
					        ObjectMapper mapper = new ObjectMapper();
					        
					        RestDataVo vo = mapper.readValue(sb.toString(), RestDataVo.class);
					        todayList.add(vo);
					        
					        rd.close();
					        conn.disconnect();
						} catch (Exception ex) {
							System.out.println("rest api 오류");
							ex.printStackTrace();
						}
					}
				}				
			}
		}

		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		System.out.println(id);
		
		if(id != null) {
			tripList = dao.callTripList(id);
			likeList = dao.selectLike(id);
		}		
		
		// 관광지 검색
		try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); //지역기반 관광정보조회 URL
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); //한 페이지 결과수
	        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //목록 구분
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); //정렬 구분 (O = 제목순, P = 조회순)
	        
	        // 가변 정보
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); //관광지 타입 ID
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(local, "UTF-8")); //지역 코드
	        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); //시군구 코드
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
	        //sb = new StringBuilder();
	        String line;
	        String result = "";
	        while ((line = rd.readLine()) != null) {
	        	// 필요한 데이터만 반환받기 위해 적용
	        	int beginIndex = line.indexOf('[');
	        	int endIndex = line.indexOf("]}");
	        	System.out.println(beginIndex + "," + endIndex);
	        	
	        	if(beginIndex != -1 || endIndex != -1) {
		        	result = line.substring(beginIndex, endIndex + 1);
		        	System.out.println("result : " + result);
	        	}
	        }
	        
	        // Jackson 객체 생성
	        ObjectMapper mapper = new ObjectMapper();
	        TypeFactory typeFactory = mapper.getTypeFactory();
	        
	        // JSONString을 객체 리스트로 변환
	        happyList = mapper.readValue(result, typeFactory.constructCollectionType(List.class, RestDataVo.class));
	        System.out.println("listVo : " + happyList.get(0).getContentid());
	        System.out.println("length : " + happyList.size());
	        
	        rd.close();
	        conn.disconnect();
		} catch (Exception ex) {
			System.out.println("rest api 오류");
			ex.printStackTrace();
		}
		
		// 음식점 검색
		try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); //지역기반 관광정보조회 URL
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); //한 페이지 결과수
	        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //목록 구분
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); //정렬 구분 (O = 제목순, P = 조회순)
	        
	        // 가변 정보
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); //관광지 타입 ID
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(local, "UTF-8")); //지역 코드
	        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); //시군구 코드
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
	        //sb = new StringBuilder();
	        String line;
	        String result = "";
	        while ((line = rd.readLine()) != null) {
	        	// 필요한 데이터만 반환받기 위해 적용
	        	int beginIndex = line.indexOf('[');
	        	int endIndex = line.indexOf("]}");
	        	System.out.println(beginIndex + "," + endIndex);
	        	
	        	if(beginIndex != -1 || endIndex != -1) {
		        	result = line.substring(beginIndex, endIndex + 1);
		        	System.out.println("result : " + result);
	        	}
	        }
	        
	        // Jackson 객체 생성
	        ObjectMapper mapper = new ObjectMapper();
	        TypeFactory typeFactory = mapper.getTypeFactory();
	        
	        // JSONString을 객체 리스트로 변환
	        foodList = mapper.readValue(result, typeFactory.constructCollectionType(List.class, RestDataVo.class));
	        System.out.println("listVo : " + foodList.get(0).getContentid());
	        System.out.println("length : " + foodList.size());
	        
	        rd.close();
	        conn.disconnect();
		} catch (Exception ex) {
			System.out.println("rest api 오류");
			ex.printStackTrace();
		}
		
		// 축제 검색
		try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); //지역기반 관광정보조회 URL
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); //한 페이지 결과수
	        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //목록 구분
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); //정렬 구분 (O = 제목순, P = 조회순)
	        
	        // 가변 정보
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); //관광지 타입 ID
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(local, "UTF-8")); //지역 코드
	        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); //시군구 코드
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
	        //sb = new StringBuilder();
	        String line;
	        String result = "";
	        while ((line = rd.readLine()) != null) {
	        	// 필요한 데이터만 반환받기 위해 적용
	        	int beginIndex = line.indexOf('[');
	        	int endIndex = line.indexOf("]}");
	        	System.out.println(beginIndex + "," + endIndex);
	        	
	        	if(beginIndex != -1 || endIndex != -1) {
		        	result = line.substring(beginIndex, endIndex + 1);
		        	System.out.println("result : " + result);
	        	}
	        }
	        
	        // Jackson 객체 생성
	        ObjectMapper mapper = new ObjectMapper();
	        TypeFactory typeFactory = mapper.getTypeFactory();
	        
	        // JSONString을 객체 리스트로 변환
	        festivalList = mapper.readValue(result, typeFactory.constructCollectionType(List.class, RestDataVo.class));
	        System.out.println("listVo : " + festivalList.get(0).getContentid());
	        System.out.println("length : " + festivalList.size());
	        
	        rd.close();
	        conn.disconnect();
		} catch (Exception ex) {
			System.out.println("rest api 오류");
			ex.printStackTrace();
		}
		
		model.addAttribute("todayList", todayList);
		model.addAttribute("happyList", happyList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("tripList", tripList);
		model.addAttribute("likeList", likeList);
		
		return "placeMain";
	}
	
	// 지역 상관 없는 메인으로 이동
	@GetMapping("menuMain.sb")
	public String menuMain(@RequestParam String menu, HttpServletRequest req, Model model) {
		List<RestDataVo> todayList = new ArrayList<>();
		
		List<ReputationVo> starList = null;
		List<ReputationVo> reviewList = null;
		List<TripListVo> tripList = null;
		List<Integer> likeList = null;
		
		SubMainDao dao = new SubMainDao();
		
		// 쿠키에서 place_serial 값 가져오기
		Cookie[] cookies = req.getCookies();
		//System.out.println(cookies.length);
		
		if(cookies != null) {
			for(int i = 0 ; i < cookies.length ; i++) {
				Cookie c = cookies[i];
				
				// 쿠키 값이 존재할 때만 최근 본 관광지 정보를 가져옴
				if(c.getName().equals("place_serial")) {
					String value = c.getValue();
					String[] cookieList = value.split("\\|");
					
					System.out.println("v : " + value);
					for(int j = 0 ; j < cookieList.length ; j++) {
						StringBuilder sb = new StringBuilder();
						System.out.println(cookieList[j]);
						ReputationVo starVo = dao.selectReputation(cookieList[j]);
						try {
					        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); // contentid 기반 관광정보조회 URL
					        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
					        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
					        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
					        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
					        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //한 페이지 결과수
					        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //기본정보 조회 여부
					        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //주소, 상세주소 조회 여부
					        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //썸네일 대표 이미지 조회 여부
					        
					        // 가변 정보
					        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(cookieList[j] + "", "UTF-8")); //콘텐츠 ID
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
					        //sb = new StringBuilder();
					        String line;
					        String result = "";
					        while ((line = rd.readLine()) != null) {
					        	// 필요한 데이터만 반환받기 위해 적용
					        	System.out.println(line);
					        	int beginIndex = line.indexOf("{\"addr1");
					        	int endIndex = line.indexOf("}},");
					        	System.out.println(beginIndex + "," + endIndex);
					        	
					        	if(beginIndex != -1 || endIndex != -1) {
						        	result = line.substring(beginIndex, endIndex + 1);
						        	System.out.println("result : " + result);
						        	
						        	sb.append(result);
						        	if(starVo != null) { // 리뷰가 존재할 경우에만 추가
						        		sb.insert(sb.length() - 1, ",\"reputation\":" + starVo.getReputation() + ",\"review_cnt\":" + starVo.getReview_cnt());					        		
						        	}
						        	System.out.println("sb : " + sb.toString());
					        	}
					        }
					        
					        ObjectMapper mapper = new ObjectMapper();
					        
					        RestDataVo vo = mapper.readValue(sb.toString(), RestDataVo.class);
					        todayList.add(vo);
					        
					        rd.close();
					        conn.disconnect();
						} catch (Exception ex) {
							System.out.println("rest api 오류");
							ex.printStackTrace();
						}
					}
				}				
			}
		}
		
		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		System.out.println(id);
		
		if(id != null) {
			tripList = dao.callTripList(id);
			likeList = dao.selectLike(id);
		}
		
		starList = dao.highStarsSelect(menu);
		reviewList = dao.manyReviewSelect(menu);
		
		// 별점순으로 api로 데이터 가져오기
		List<RestDataVo> starListVo = new ArrayList<>();
		for(int i = 0 ; i < starList.size() ; i++) {
			StringBuilder sb = new StringBuilder();
			try {
		        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); // contentid 기반 관광정보조회 URL
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
		        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
		        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //한 페이지 결과수
		        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //기본정보 조회 여부
		        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //주소, 상세주소 조회 여부
		        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //썸네일 대표 이미지 조회 여부
		        
		        // 가변 정보
		        System.out.println("serial : " + starList.get(i).getPlace_serial());
		        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(menu, "UTF-8")); //관광지 타입 ID
		        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(starList.get(i).getPlace_serial() + "", "UTF-8")); //콘텐츠 ID
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
		        //sb = new StringBuilder();
		        String line;
		        String result = "";
		        while ((line = rd.readLine()) != null) {
		        	// 필요한 데이터만 반환받기 위해 적용
		        	int beginIndex = line.indexOf("{\"addr1");
		        	int endIndex = line.indexOf("}},");
		        	System.out.println(beginIndex + "," + endIndex);
		        	
		        	if(beginIndex != -1 || endIndex != -1) {
			        	result = line.substring(beginIndex, endIndex + 1);
			        	System.out.println("result : " + result);
			        	
			        	sb.append(result);
			        	//sb.append(line);
		        	//sb.append("{\"reputation\":" + starList.get(i).getReputation() + ",\"review_cnt\":" + starList.get(i).getReview_cnt() + "}");
			        	sb.insert(sb.length() - 1, ",\"reputation\":" + starList.get(i).getReputation() + ",\"review_cnt\":" + starList.get(i).getReview_cnt());
			        	System.out.println("sb : " + sb.toString());
		        	}
		        }
		        
		        ObjectMapper mapper = new ObjectMapper();
		        
		        RestDataVo vo = mapper.readValue(sb.toString(), RestDataVo.class);
		        starListVo.add(vo);
		        
		        rd.close();
		        conn.disconnect();
			} catch (Exception ex) {
				System.out.println("rest api 오류");
				ex.printStackTrace();
			}
		}
		
		// 리뷰 많은 순으로 api로 데이터 가져오기
		List<RestDataVo> reviewListVo = new ArrayList<>();
		for(int i = 0 ; i < reviewList.size() ; i++) {
			StringBuilder sb = new StringBuilder();
			try {
		        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); // contentid 기반 관광정보조회 URL
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
		        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
		        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //한 페이지 결과수
		        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //기본정보 조회 여부
		        urlBuilder.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //주소, 상세주소 조회 여부
		        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //썸네일 대표 이미지 조회 여부
		        
		        // 가변 정보
		        System.out.println("serial : " + starList.get(i).getPlace_serial());
		        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(menu, "UTF-8")); //관광지 타입 ID
		        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(reviewList.get(i).getPlace_serial() + "", "UTF-8")); //콘텐츠 ID
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
		        //sb = new StringBuilder();
		        String line;
		        String result = "";
		        while ((line = rd.readLine()) != null) {
		        	// 필요한 데이터만 반환받기 위해 적용
		        	int beginIndex = line.indexOf("{\"addr1");
		        	int endIndex = line.indexOf("}},");
		        	System.out.println(beginIndex + "," + endIndex);
		        	
		        	if(beginIndex != -1 || endIndex != -1) {
			        	result = line.substring(beginIndex, endIndex + 1);
			        	System.out.println("result : " + result);
			        	
			        	sb.append(result);
			        	//sb.append(line);
		        	//sb.append("{\"reputation\":" + starList.get(i).getReputation() + ",\"review_cnt\":" + starList.get(i).getReview_cnt() + "}");
			        	sb.insert(sb.length() - 1, ",\"reputation\":" + reviewList.get(i).getReputation() + ",\"review_cnt\":" + reviewList.get(i).getReview_cnt());
			        	System.out.println("sb : " + sb.toString());
		        	}
		        }
		        
		        ObjectMapper mapper = new ObjectMapper();
		        
		        RestDataVo vo = mapper.readValue(sb.toString(), RestDataVo.class);
		        reviewListVo.add(vo);
		        
		        rd.close();
		        conn.disconnect();
			} catch (Exception ex) {
				System.out.println("rest api 오류");
				ex.printStackTrace();
			}
		}
		
		model.addAttribute("todayList", todayList);
		model.addAttribute("starList", starListVo);
		model.addAttribute("reviewList", reviewListVo);
		model.addAttribute("tripList", tripList);
		model.addAttribute("likeList", likeList);
		
		return "menuMain";
	}
	
	// 더보기로 관광지 검색 페이지로 이동
	@GetMapping("mainMore.sb")
	public String ViewMore() {
		
		return "food_index";
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
	
	// 관심리스트 추가하기
	@ResponseBody
	@PostMapping("insertLikeTrip.sb")
	public String insertLikeTrip(@RequestParam("trip_serial") int trip_serial, @RequestParam("place_serial") int place_serial, HttpServletRequest req) {
		System.out.println(trip_serial);
		System.out.println(place_serial);
		SubMainDao dao = new SubMainDao();
		
		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		System.out.println(id);
		
		// 좋아요한 여행지 정보 setting
		LikeListVo vo = new LikeListVo();
		vo.setMember_id(id);
		vo.setPlace_serial(place_serial);
		vo.setTrip_list_serial(trip_serial);
		
		// like_list table에 추가하기
		dao.likeInsert(vo);
		
		return null;
	}
	
	// 관심리스트 삭제하기
	@ResponseBody
	@PostMapping("deleteLikeTrip.sb")
	public String deleteLikeTrip(@RequestParam("place_serial") int place_serial, HttpServletRequest req) {
		System.out.println(place_serial);
		SubMainDao dao = new SubMainDao();
		
		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		System.out.println(id);
		
		// 좋아요 해제한 여행지 정보 setting
		LikeListVo vo = new LikeListVo();
		vo.setMember_id(id);
		vo.setPlace_serial(place_serial);
		
		// like_list table에 추가하기
		dao.likeDelete(vo);
		
		return null;
	}
	
	// 검색어 필터 선택 시, 조회되는 관광지 정보들
	@ResponseBody
	@PostMapping("searchList.sb")
	public StringBuilder searchList(@RequestParam("menu") String menu, @RequestParam(required = false, value="local[]") List<String> local,
									@RequestParam(required = false, value="filter[]") List<String> filter, @RequestParam(required = false, value = "findStr") String findStr,
									@RequestParam("pageNum") String pageNum) {
		StringBuilder sb = new StringBuilder();
		sb.append('[');
		
		System.out.println("str : " + findStr);
		System.out.println(findStr.length());
		// local, filter 값이 없을 경우, NullPointException 방지를 위하여 공백 값 설정
		if(local == null) {
			local = new ArrayList<>();
			local.add("");
		}
		if(filter == null) {
			filter = new ArrayList<>();
			filter.add("");
		}
		
		String reqURL = null;
		// 키워드가 들어오면 키워드 검색 URL로 요청
		if(findStr == null || findStr.equals("")) {
			System.out.println("list 검색");
			reqURL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		} else {
			System.out.println("키워드 검색");
			reqURL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
		}
			
		// 지역 필터와 검색어 필터가 적용된 관광지 리스트만 가져오기
		for(int i = 0 ; i < local.size() ; i++) {
			for(int j = 0 ; j < filter.size() ; j++) {
				try {
			        StringBuilder urlBuilder = new StringBuilder(reqURL); //요청 URL
			        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D"); //Service Key
			        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
			        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
			        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNum, "UTF-8")); //현재 페이지 번호
			        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); //한 페이지 결과수
			        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //목록 구분
			        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); //정렬 구분 (O = 제목순, P = 조회순)
			        
			        // 가변 정보
			        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(findStr, "UTF-8")); //검색 키워드
			        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(menu, "UTF-8")); //관광지 타입 ID
			        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(local.get(i), "UTF-8")); //지역 코드
			        urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); //시군구 코드
			        if(!filter.get(j).equals("")) {
			        	System.out.println(filter.get(j).substring(0, 3));
			        	System.out.println(filter.get(j).substring(0, 5));
			        	System.out.println(filter.get(j));
			        	urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode(filter.get(j).substring(0, 3), "UTF-8")); //대분류
			        	urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode(filter.get(j).substring(0, 5), "UTF-8")); //중분류
			        	
			        	// 관광지는 cat3이 없음
			        	if(!menu.equals("12")) {
			        		urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode(filter.get(j), "UTF-8")); //소분류			        	
			        	}
			        }
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
			        //sb = new StringBuilder();
			        String line;
			        List<ReputationVo> serial = new ArrayList<>();
			        SubMainDao dao = new SubMainDao();
			        serial = dao.selectReputation();
			        String result = "";
			        while ((line = rd.readLine()) != null) {
/*			        	System.out.println("line:" + line);
			        	// 필요한 데이터만 반환받기 위해 적용
			        	int beginIndex = line.indexOf('[');
			        	int endIndex = line.indexOf("]}");
			        	System.out.println(beginIndex + "," + endIndex);
			        	
			        	if(beginIndex != -1 || endIndex != -1) {
				        	result = line.substring(beginIndex + 1, endIndex);
				        	System.out.println("result : " + result);
				        	
				        	// 리뷰와 별점이 존재하면 리뷰와 별점 정보도 json에 저장
				        	for(int k = 0 ; k < serial.size() ; k++) {
				        		System.out.println(serial.get(k).getPlace_serial() + "," + serial.get(k).getReputation() + "," + serial.get(k).getReview_cnt());
				        		result = result.replace("\"contentid\":" + serial.get(k).getPlace_serial() +",", "\"contentid\":" + serial.get(k).getPlace_serial() + ",\"reputation\":" + serial.get(k).getReputation() + ",\"review_cnt\":" + serial.get(k).getReview_cnt() + ",");
				        		line = line.replace("\"contentid\":" + serial.get(k).getPlace_serial() +",", "\"contentid\":" + serial.get(k).getPlace_serial() + ",\"reputation\":" + serial.get(k).getReputation() + ",\"review_cnt\":" + serial.get(k).getReview_cnt() + ",");
				        	}
				        	
				        	sb.append(result);
				        	sb.append(',');
				        	System.out.println("sb : " + sb.toString());
			        	}*/
			        	
			        	// 요청 결과 가져오기
			        	// 리뷰와 별점이 존재하면 리뷰와 별점 정보도 json에 저장
			        	for(int k = 0 ; k < serial.size() ; k++) {
			        		System.out.println(serial.get(k).getPlace_serial() + "," + serial.get(k).getReputation() + "," + serial.get(k).getReview_cnt());
			        		line = line.replace("\"contentid\":" + serial.get(k).getPlace_serial() +",", "\"contentid\":" + serial.get(k).getPlace_serial() + ",\"reputation\":" + serial.get(k).getReputation() + ",\"review_cnt\":" + serial.get(k).getReview_cnt() + ",");
			        	}
			        	
			        	System.out.println(line);
			        	
			        	sb.append(line);
			        	sb.append(",");
			        }
			        
			        rd.close();
			        conn.disconnect();
			        System.out.println(sb.toString());
				} catch (Exception ex) {
					System.out.println("rest api 오류");
					ex.printStackTrace();
				}
			}
		}
		
		
		// 맨 마지막에 ,를 ]로 변환
		sb.replace(sb.length() - 1, sb.length(), "]");
		
/*		if(sb.length() == 1) { // 데이터가 없을 경우
			sb.append(']');			
		} else { // 데이터가 하나라도 있을 경우
			sb.replace(sb.length() - 1, sb.length(), "]");			
		}*/
		
		System.out.println(sb.toString());
		return sb;
	}
	
	
	@GetMapping(value="searchPlace.sb")
	public String searchPlace() {
		
		
		return "food_index";
	}
	
}
