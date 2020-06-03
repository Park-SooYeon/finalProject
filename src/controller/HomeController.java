package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

import bean.PlaceVo;
import bean.TripListVo;
import dao.SubMainDao;
import vo.ReputationVo;
import vo.RestDataVo;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/index.jsp", method = {RequestMethod.GET, RequestMethod.POST} )
	public String home(HttpServletRequest req, Model model) {
		System.out.println("들어와??");
		System.out.println("왜 여러번 ㄷㄹ어오지?");
		
		List<RestDataVo> todayList = new ArrayList<>();
		
		List<RestDataVo> happyList = null;
		List<RestDataVo> foodList = null;
		List<RestDataVo> festivalList = null;
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
		
		// 관광지 검색
		/*try {
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
		}*/
		
		model.addAttribute("todayList", todayList);
		model.addAttribute("happyList", happyList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("tripList", tripList);
		model.addAttribute("likeList", likeList);
		
		return "index1";
	}
}
