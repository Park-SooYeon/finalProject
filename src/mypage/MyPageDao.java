package mypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import mypage_mybatis.TripListVo;

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
	
}
