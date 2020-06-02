package dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bean.Factory;
import bean.PlaceVo;

public class DetailViewDao {
	SqlSession sqlSession;	
	
	public DetailViewDao() {
		sqlSession = Factory.getFactory().openSession();		
	}
	
	public PlaceVo view(String code) {
		PlaceVo vo = new PlaceVo();
		
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
	        System.out.println(url);
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
	        
	        String result = sb.toString();
	        
	        JsonParser jParser = new JsonParser();

	        JsonObject jObject1 = (JsonObject)jParser.parse(result); //json 전체 파싱
	        //jObejct1는 json 전체가 파싱됨
	        System.out.println("오브젝트 전체파싱 : " + jObject1.get("response")); //return "test1"

	        String str = jObject1.get("response").toString();
	        System.out.println("str : " + str);
	        JsonObject jObject2 = (JsonObject)jParser.parse(str);
	        
	        String str2 = jObject2.get("body").toString();
	        System.out.println("str2 : " + str2);
	        JsonObject jObject3 = (JsonObject)jParser.parse(str2);
	        
	        String str3 = jObject3.get("items").toString();
	        JsonObject jObject4 = (JsonObject)jParser.parse(str3);
	        
	        String str4 = jObject4.get("item").toString();
	        JsonObject contentResult = (JsonObject)jParser.parse(str4);
	        
	        System.out.println("str4 : " + str4);
	        //String photo_name = contentResult.get("firstimage").getAsString();
	        //String place_name = contentResult.get("title").getAsString();
	        //String place_location = contentResult.get("addr1").getAsString();
	        //홈페이지는 테스트 후 되면 추가
	        //이미지 테스트 후 되면 추가
	        
	        vo.setPlace_name(contentResult.get("title").getAsString());
	        vo.setPhoto_name(contentResult.get("firstimage").getAsString());
	        vo.setPlace_location(contentResult.get("addr1").getAsString());
	        vo.setHomepage(contentResult.get("homepage").getAsString());
	        
	        vo.getPlace_name();
	        vo.getPhoto_name();
	        vo.getPlace_location();
	        System.out.println("vo에는 무슨값이 있을까?" + vo.getPlace_name() + vo.getPhoto_name() + vo.getPlace_location());
	        
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("공공DB 오류");
		}
		return vo;
		
	}

/*
public PlaceVo view2(String code) {
	PlaceVo vo2 = new PlaceVo();
		
	try {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"); URL
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=72UE6YqIhgZCaHahqDmsBTNsa0XOjd5XmbvKs4aN6siytqGn42eemUfJbAvLBeo5IYY%2B4L5PnZB3o2kNJ0GpNQ%3D%3D"); Service Key
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); 한 페이지 결과수
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 현재 페이지 번호
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); 서비스명=어플명
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(code, "UTF-8")); 콘텐츠 ID
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); 관광타입(관광지, 숙박 등) ID
        urlBuilder.append("&" + URLEncoder.encode("sponsor1tel","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); 관광타입(관광지, 숙박 등) ID
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
        
        String result = sb.toString();
        
        JsonParser jParser2 = new JsonParser();

        JsonObject jObject1 = (JsonObject)jParser2.parse(result); //json 전체 파싱
        //jObejct1는 json 전체가 파싱됨
        System.out.println("오브젝트 전체파싱 : " + jObject1.get("response")); //return "test1"

        String str = jObject1.get("response").toString();
        System.out.println("str : " + str);
        JsonObject jObject2 = (JsonObject)jParser2.parse(str);
        
        String str2 = jObject2.get("body").toString();
        System.out.println("str2 : " + str2);
        JsonObject jObject3 = (JsonObject)jParser2.parse(str2);
        
        String str3 = jObject3.get("items").toString();
        JsonObject jObject4 = (JsonObject)jParser2.parse(str3);
        
        String str4 = jObject4.get("item").toString();
        JsonObject contentResult = (JsonObject)jParser2.parse(str4);
        
        System.out.println("str4 : " + str4);
        //String photo_name = contentResult.get("firstimage").getAsString();
        //String place_name = contentResult.get("title").getAsString();
        //String place_location = contentResult.get("addr1").getAsString();
        //홈페이지는 테스트 후 되면 추가
        //이미지 테스트 후 되면 추가
        
        vo2.setPlace_tel(contentResult.get("sponsor1tel").getAsString());
        
        System.out.println("전화번호 들어옴??" + vo2.getPlace_tel());
        
	}catch(Exception ex) {
		ex.printStackTrace();
		System.out.println("공공DB 오류");
	}
		return vo2;
		
	}
	*/
//공공DB 이미지 
	public PlaceVo photoView(String code) {
		PlaceVo vo2 = new PlaceVo();
		
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
		        
		        String result = sb.toString();
		        
		        JsonParser jParser2 = new JsonParser();

		        JsonObject jObject1 = (JsonObject)jParser2.parse(result); //json 전체 파싱
		        //jObejct1는 json 전체가 파싱됨
		        System.out.println("오브젝트 전체파싱 : " + jObject1.get("response")); //return "test1"

		        String str = jObject1.get("response").toString();
		        System.out.println("str : " + str);
		        JsonObject jObject2 = (JsonObject)jParser2.parse(str);
		        
		        String str2 = jObject2.get("body").toString();
		        System.out.println("str2 : " + str2);
		        JsonObject jObject3 = (JsonObject)jParser2.parse(str2);
		        
		        String str3 = jObject3.get("items").toString();
		        JsonObject jObject4 = (JsonObject)jParser2.parse(str3);
		        
		        String str4 = jObject4.get("item").toString();
		        JsonObject contentResult = (JsonObject)jParser2.parse(str4);
		        
		        System.out.println("str4 : " + str4);
		        String photo_name = contentResult.get("firstimage").getAsString();
		
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo2;
	}


}
