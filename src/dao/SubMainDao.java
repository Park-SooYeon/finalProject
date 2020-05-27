package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.LikeListVo;
import bean.PlaceVo;
import bean.TripListVo;
import vo.MainVo;
import vo.ReputationVo;

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
	
	public List<ReputationVo> highStarsSelect(String menu) {
		List<ReputationVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_high_stars", menu);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<ReputationVo> manyReviewSelect(String menu) {
		List<ReputationVo> list = null;
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
				throw new Exception("여행 폴더 생성 중 오류발생");
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
	
	// 좋아요로 관심리스트에 관광지 저장하기
	public void likeInsert(LikeListVo vo) {
		try {
			int cnt = sqlSession.insert("mypage.insert_like", vo);
			if(cnt<1) {
				throw new Exception("본문 저장 중 오류발생");
			}
			
			sqlSession.commit();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			
			sqlSession.rollback();
		}
	}
	
	// 관심리스트에 저장된 관광지 삭제하기
	public void likeDelete(LikeListVo vo) {
		try {
			int cnt = sqlSession.insert("sub_main.delete_like", vo);
			if(cnt<1) {
				throw new Exception("관심리스트 삭제 중 오류발생");
			}
			
			sqlSession.commit();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			
			sqlSession.rollback();
		}
	}
	
	// 관심리스트에 추가된 내역들 가져오기
	public List<Integer> selectLike(String member_id) {
		List<Integer> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_like", member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list; 
	}

	public List<ReputationVo> reputationSelect() {
		List<ReputationVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_reputation");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list; 
	}
}
