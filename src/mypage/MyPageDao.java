package mypage;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import bean.Factory;
import bean.FollowListVo;
import bean.LikeListVo;
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
}
