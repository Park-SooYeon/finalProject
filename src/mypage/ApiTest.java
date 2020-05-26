package mypage;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.BufferedReader;
import java.io.IOException;

public class ApiTest {
    public static void main(String[] args) throws IOException {
    	
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=RGRZ7ZbtIrL2U4P0qfnA3puuV5UrzrqEFmf0aLwaZitXLcUQrOTbyRoZHRCpdViHuU1cTZ7jXX4GDbOMb%2Fc1gg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*지역코드, 시군구코드*/
        urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드*/
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
        String result = sb.toString();
        System.out.println(result);
        
        /*
        JsonObject jobj = new Gson().fromJson(result, JsonObject.class);
        
        String result2 = jobj.get("response").toString();
        
        jobj = new Gson().fromJson(result2, JsonObject.class);
        String result3 = jobj.get("body").toString();
        		
        System.out.println(result3);
        jobj = new Gson().fromJson(result3, JsonObject.class);
        String result4 = jobj.get("items").toString();
        System.out.println(result4);
        
        jobj = new Gson().fromJson(result4, JsonObject.class);
        String result5 = jobj.get("item").toString();
        System.out.println(result5);
        jobj = new Gson().fromJson(result5, JsonObject.class);
        String result6= jobj.get("contentid").toString();
        System.out.println(result6);
        */
        
    }
}
