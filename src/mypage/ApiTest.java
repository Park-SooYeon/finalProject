package mypage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bean.LikeListVo;
import bean.PlaceVo;

public class ApiTest {
    public static void main(String[] args) throws IOException {
    	
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=RGRZ7ZbtIrL2U4P0qfnA3puuV5UrzrqEFmf0aLwaZitXLcUQrOTbyRoZHRCpdViHuU1cTZ7jXX4GDbOMb%2Fc1gg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드*/
        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 기본정보조회 */
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode("126508", "UTF-8")); /*지역코드, 시군구코드*/
        urlBuilder.append("&" + URLEncoder.encode("firstImageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*대표이미지 조회*/
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
        
        JsonParser jParser = new JsonParser();

        JsonObject jObject1 = (JsonObject)jParser.parse(result); //json 전체 파싱
        //jObejct1는 json 전체가 파싱됨
        //System.out.println(jObject1.get("response")); //return "test1"

        String str = jObject1.get("response").toString();
        //System.out.println(str);
        JsonObject jObject2 = (JsonObject)jParser.parse(str);
        
        String str2 = jObject2.get("body").toString();
        //System.out.println(str2);
        JsonObject jObject3 = (JsonObject)jParser.parse(str2);
        
        String str3 = jObject3.get("items").toString();
        System.out.println(str3);
        JsonObject jObject4 = (JsonObject)jParser.parse(str3);
        
        String str4 = jObject4.get("item").toString();
        System.out.println(str4);
        JsonObject jObject5 = (JsonObject)jParser.parse(str4);
        System.out.println(jObject5.get("contentid"));
        System.out.println(jObject5.size());
        
        int serial = jObject5.get("contentid").getAsInt();
        String image = jObject5.get("firstimage").getAsString();
        String title = jObject5.get("title").getAsString();
        int areacode = jObject5.get("areacode").getAsInt();
        
        LikeListVo vo = new LikeListVo();
        vo.setPlace_serial(serial);

        PlaceVo pv = new PlaceVo();
        
        pv.setPlace_code(areacode);
        pv.setPhoto_name(image);
        pv.setPlace_name(title);

        vo.setP(pv);
        
        System.out.println("serial : "+vo.getPlace_serial());
        System.out.println("area code : "+vo.getP().getPlace_code());
        System.out.println("photo name : "+vo.getP().getPhoto_name());
        System.out.println("place name : "+vo.getP().getPlace_name());
        
        
        /*
        for (int i = 0; i < jObject5.size(); i++) {
        	 System.out.println("place"+ i +" : " +jObject5.get(i)); 
             JsonObject objectInArray = jObject5.getAsJsonObject();
            System.out.println("contentid : "+objectInArray.get("contentid"));
		}
		*/
        
    }
}
