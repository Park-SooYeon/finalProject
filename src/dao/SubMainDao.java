package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.PlaceVo;
import mypage_mybatis.TripListVo;
import vo.MainVo;

public class SubMainDao { 
	
	SqlSession sqlSession;
	
	public SubMainDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<PlaceVo> happyMenuSelect(int local) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_place_happy", local);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> foodMenuSelect(int local) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_place_food", local);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> festivalMenuSelect(int local) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_place_festival", local);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> highStarsSelect(int menu) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_high_stars", menu);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> manyReviewSelect(int menu) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_many_review", menu);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	// 여행 목록 불러오기
	public List<TripListVo> callTripList() {
		List<TripListVo> list = null;
		try {
			list = sqlSession.selectList("mypage.select_trip");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	// 여행 폴더 새로 생성하기
	public int tripInsert(TripListVo vo) {
		int result = 0;
		try {
			int cnt = sqlSession.insert("mypage.insert_trip", vo);
			if(cnt<1) {
				throw new Exception("본문 저장 중 오류발생");
			}
			
			result = vo.getTrip_list_serial();
			sqlSession.commit();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			
			sqlSession.rollback();
		}finally {
			return result;
		}
	}
}
