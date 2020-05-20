package adSuper;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;
import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.membershipVo;
import mypage_mybatis.TripListVo;

public class AdSuperDao {
// 서블릿과 BoardMybatis를 연결해주는 역할

	SqlSession sqlSession;
	// 가장 중요한 역할!
	
	public AdSuperDao() {
		sqlSession = Factory.getFactory().openSession();
		//mybatis와 연결되어지는 연결고리
	}
	

	public List<membershipVo> select() {
		List<membershipVo> list = new ArrayList<membershipVo>();
		try {
			list = sqlSession.selectList("admin.select_member");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	//회원관리 상세페이지
	public membershipVo view(String member_id) {
		membershipVo vo = new membershipVo();
		try {
			vo = sqlSession.selectOne("admin.view_member", member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}





}
