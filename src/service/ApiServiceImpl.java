package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

import vo.RestDataVo;

public class ApiServiceImpl implements ApiService {
	
	ObjectMapper mapper;
	TypeFactory typeFactory;
	
	String serviceKey = "%2FL4mnuLP6k1JiEz28Z86MlqufwpG49Q%2FhOqk53jtJr3H9fz%2FrNt5DoGHgSHGaprmYQOT6VXfCJcydUXrFUo%2FOA%3D%3D";
	
	@Override
	public List<RestDataVo> getAreaBasedList(String menu, String local) {
		
		// 관광지 검색
		try {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); //지역기반 관광정보조회 URL
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); //Service Key
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); //IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); //서비스명=어플명
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //현재 페이지 번호
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); //한 페이지 결과수
	        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); //목록 구분
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("P", "UTF-8")); //정렬 구분 (O = 제목순, P = 조회순)
	        
	        // 가변 정보
	        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(menu, "UTF-8")); //관광지 타입 ID
	        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(local, "UTF-8")); //지역 코드
	        urlBuilder.append("&_type=json"); // json 타입으로 반환
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
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
	        //happyList = mapper.readValue(result, typeFactory.constructCollectionType(List.class, RestDataVo.class));
	        
	        rd.close();
	        conn.disconnect();
		} catch (Exception ex) {
			System.out.println("getAreaBasedList 오류");
			ex.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<RestDataVo> getDetailCommon(String menu) {
		
		return null;
	}

	@Override
	public StringBuilder getFilterList(String menu, List<String> local, List<String> filter, String findStr,
			String pageNum) {
		
		return null;
	}

}
