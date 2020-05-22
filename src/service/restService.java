package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import vo.InfoVo;

public class restService {
    
	private static final String HOST = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
    private static final String SERVICEKEY = "B8%2BZaRoCMImsMJtdm0WOedSaSwRCucNkcnqroJSLiK%2F%2Fg7jsBF27h0GeG9RlWHRLEgkcHYh3PDV2qzL5Vh1WYA%3D%3D";
    private InfoVo infoVo; // 서비스 분류 코드를 받아올 객체
    
    public StringBuilder restLocalSelect() {
    	StringBuilder result = new StringBuilder();
    	
    	try {
    	StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=서비스키"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("인증키 (URL - Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*지역코드, 시군구코드*/
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
    	} catch (Exception ex) {
    		System.out.println("지역 정보 조회시 오류 발생");
    		ex.printStackTrace();
    	}
    	return result;
    }
    
    
    
     public String kakaoPayReady() {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        //headers.add("Authorization", "KakaoAK " + "admin key를 넣어주세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_JSON_UTF8_VALUE + ";charset=UTF-8");
        
        // parameter 세팅
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("ServiceKey", SERVICEKEY);
        params.add("MobileApp", "AppTest");
        params.add("MobileOS", "ETC");
        params.add("pageNo", "1"); // 페이지 번호
        params.add("numOfRows", "20"); // 한 페이지 결과 수
        params.add("listYN", "Y"); // 목록 구분
        params.add("arrange", "A"); // 정렬 구분
        params.add("contentTypeId", ""); // 관광지 타입 ID
        params.add("areaCode", "http://localhost:8080/kakaoPaySuccessFail"); // 지역 코드
        params.add("sigunguCode", "http://localhost:8080/kakaoPayCancel"); // 시군구 코드
        params.add("cat1", ""); // 대분류
        params.add("cat2", ""); // 중분류
        params.add("cat3", ""); // 소분류
        
        // header와 body 붙이는 방법
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         
        System.out.println("body : " + body);
        try {
        	
        	// url에 데이터를 보내는 방법
        	infoVo = restTemplate.getForObject(new URI(HOST), InfoVo.class);
            
        	System.out.println(infoVo.getNext_redirect_pc_url());
        	
            return null;
        	//return infoVo.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
        	System.out.println("RestClient-Exception");
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
        	System.out.println("URISyntax-Exception");
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
}
