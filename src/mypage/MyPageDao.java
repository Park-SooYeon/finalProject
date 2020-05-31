package mypage;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import bean.Factory;
import bean.FollowListVo;
import bean.LikeListVo;
import bean.PlaceVo;
import bean.ReviewVo;
import bean.TripListVo;
import bean.membershipVo;

public class MyPageDao {
// 서블릿과 BoardMybatis를 연결해주는 역할

	SqlSession sqlSession;
	// 가장 중요한 역할!
	
	public MyPageDao() {
		sqlSession = Factory.getFactory().openSession();
		//mybatis와 연결되어지는 연결고리
	}
	
	public String insert(TripListVo vo) {
		String msg = "정상적으로 저장되었습니다.";
		try {
			int cnt = sqlSession.insert("mypage.insert_trip", vo);
			if(cnt<1) {
				throw new Exception("본문 저장 중 오류발생");
			}
				
			sqlSession.commit();
		}catch(Exception ex){
			msg = ex.getMessage();
			ex.printStackTrace();
			
			sqlSession.rollback();
		}finally {
			return msg;
		}
	}
	
	public List<TripListVo> select() {
		List<TripListVo> list = new ArrayList<TripListVo>();
		try {
			list = sqlSession.selectList("mypage.select_trip");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public String modify(TripListVo vo) {
		String msg = "정상적으로 수정되었습니다.";
		try {
			int cnt = sqlSession.update("mypage.modify_trip", vo);
			if(cnt<1) {
				throw new Exception("여행 수정 중 오류발생");
			}
			sqlSession.commit();
		}catch(Exception ex){
			msg = ex.getMessage();
			ex.printStackTrace();
			
			sqlSession.rollback();
		}finally {
			return msg;
		}
	}
	
	public String delete(int trip_list_serial) {
		String msg = "정상적으로 삭제되었습니다.";
		try {
			int cnt = sqlSession.update("mypage.delete_trip", trip_list_serial);
			if(cnt<1) {
				throw new Exception("여행 삭제 중 오류발생");
			}
			sqlSession.commit();
		}catch(Exception ex){
			msg = ex.getMessage();
			ex.printStackTrace();
			
			sqlSession.rollback();
		}finally {
			return msg;
		}
	}
	
	public List<LikeListVo> selectLike(String member_id) {
		List<LikeListVo> list = null;
		List<LikeListVo> list2 = null;
		
		try {
			// 호텔정보만 반환
			list = sqlSession.selectList("mypage.select_like", member_id);
			
			// api로 가져오는 place
			list2 = sqlSession.selectList("mypage.select_places", member_id);
			
			for(LikeListVo vo : list2) {
				//vo에 api 응답정보를 담아서 재가공
				JsonObject contentResult = getApi(vo.getPlace_serial());
				int place_serial = contentResult.get("contentid").getAsInt();
		        String photo_name = contentResult.get("firstimage").getAsString();
		        String place_name = contentResult.get("title").getAsString();
		        int local_code = contentResult.get("areacode").getAsInt();
		        
		        vo.setPlace_serial(place_serial);
		        vo.getP().setLocal_code(local_code);
		        vo.getP().setPhoto_name(photo_name);
		        vo.getP().setPlace_name(place_name);
				list.add(vo);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list; 
	}
	
	
	// 좋아요 누른 review 조회
	public List<ReviewVo> selectReview(String member_id) {
		List<ReviewVo> list = null;
		List<ReviewVo> list2 = null;
		try {
			// 호텔리뷰만 조회
			list = sqlSession.selectList("mypage.select_review", member_id);
			list2 = sqlSession.selectList("mypage.select_apiReview", member_id);
			
			for(ReviewVo vo : list2) {
				//vo에 api 응답정보를 담아서 재가공
				JsonObject contentResult = getApi(vo.getPlace_serial());
				int place_serial = contentResult.get("contentid").getAsInt();
		        String photo_name = contentResult.get("firstimage").getAsString();
		        String place_name = contentResult.get("title").getAsString();
		        int local_code = contentResult.get("areacode").getAsInt();
		        
		        vo.setPlace_serial(place_serial);
		        vo.getP().setLocal_code(local_code);
		        vo.getP().setPhoto_name(photo_name);
		        vo.getP().setPlace_name(place_name);
		        
		        System.out.println(vo.toString());
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list; 
	}
	
	public membershipVo selectProfile(String member_id) {
		membershipVo vo = new membershipVo();
		try {
			vo = sqlSession.selectOne("mypage.select_profile", member_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public String modifyProfile(membershipVo vo, MultipartFile imgFile) {
		String msg  = "";
		System.out.println("왜 업데이트 안 돼.."+vo.getMember_id());
		try {
			int cnt = sqlSession.update("mypage.modify_profile", vo);
			System.out.println(cnt);
			if(cnt > 0) {
				// 본문 업데이트 성공
				
				if(!imgFile.isEmpty()) {
					// 이미지파일이 있을때만 실행
					try {
						byte[] bytes = imgFile.getBytes();
						BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(vo.getMember_photo())));
						stream.write(bytes);
						stream.close();
					}catch (Exception e) {
						throw new Exception("파일업로드 중 오류 발생");
					}
				}
				sqlSession.commit();
				msg = "수정이 완료되었습니다.";
			}else {
				// 업데이트 실패
				throw new Exception("본문 수정 중 오류 발생");
			}
	        
		}catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
			sqlSession.rollback();
		}
		return msg;
	}
	
	public String addFollow(FollowListVo vo) {
		String msg = "";
		try {
			int cnt = sqlSession.insert("follow", vo);
			
			if(cnt>0) {
				msg = "팔로우했음";
				sqlSession.commit();
			}else {
				throw new Exception("오류발생");
			}
		}catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
			sqlSession.rollback();
		}
		
		return msg;
	}
	
	public String deleteFollow(FollowListVo vo) {
		String msg = "";
		try {
			int cnt = sqlSession.delete("delete_follow", vo);
			
			if(cnt>0) {
				msg = "팔로우취소";
				sqlSession.commit();
			}else {
				throw new Exception("오류발생");
			}
		}catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
			sqlSession.rollback();
		}
		
		return msg;
	}
	
	public int getFollow(FollowListVo vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("select_follow", vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public Map<String, Integer> getFollowCnt(String member_id) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		System.out.println("dao의 "+member_id);
		
		int cnt = 0;
		int cnt2 = 0;
		try {
			cnt = sqlSession.selectOne("count_follow", member_id);
			cnt2 = sqlSession.selectOne("count_follower", member_id);
			
			map.put("follow", cnt); // 내가 팔로우 하는 사람수
			map.put("follower", cnt2); // 나를 팔로우 하는 사람 수
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return map;
	}
	
	public JsonObject getApi(int contentId) throws IOException {
		
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=RGRZ7ZbtIrL2U4P0qfnA3puuV5UrzrqEFmf0aLwaZitXLcUQrOTbyRoZHRCpdViHuU1cTZ7jXX4GDbOMb%2Fc1gg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("areacodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지역코드, 시군구코드*/
        urlBuilder.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 기본정보조회 */
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentId+"", "UTF-8")); /*지역코드, 시군구코드*/
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
        JsonObject jObject4 = (JsonObject)jParser.parse(str3);
        
        String str4 = jObject4.get("item").toString();
        JsonObject contentResult = (JsonObject)jParser.parse(str4);

        return contentResult;
	}
}
