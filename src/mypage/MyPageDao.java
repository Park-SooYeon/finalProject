package mypage;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import bean.Factory;
import bean.LikeListVo;
import bean.ProfileVo;
import bean.ReviewVo;
import bean.TripListVo;

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
		List<LikeListVo> list = new ArrayList<LikeListVo>();
		try {
			list = sqlSession.selectList("mypage.select_like", member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list; 
	}
	
	public List<ReviewVo> selectReview(String member_id) {
		List<ReviewVo> list = new ArrayList<ReviewVo>();
		try {
			list = sqlSession.selectList("mypage.select_review", member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list; 
	}
	
	public ProfileVo selectProfile(String member_id) {
		ProfileVo vo = new ProfileVo();
		try {
			vo = sqlSession.selectOne("mypage.select_profile", member_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public String modifyProfile(ProfileVo vo, MultipartFile imgFile) {
		String msg  = "";
		try {
		    
			int cnt = sqlSession.selectOne("mypage.modify_profile", vo.getProfile_serial());
			
			if(cnt > 0 ) {
				// 업데이트 성공
				try {
					byte[] bytes = imgFile.getBytes();
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(vo.getMember_photo())));
					stream.write(bytes);
					stream.close();
				}catch (Exception e) {
					sqlSession.rollback();
					msg = "파일을 업로드하는 데에 실패했습니다.";
				}
				sqlSession.commit();
				msg = "수정이 완료되었습니다.";
			}else {
				// 업데이트 실패
				sqlSession.rollback();
			}
	        
		}catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
}
