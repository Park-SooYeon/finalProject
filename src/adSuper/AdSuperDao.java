package adSuper;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;
import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.membershipVo;
import bean.partnerVo;

public class AdSuperDao {
// 서블릿과 BoardMybatis를 연결해주는 역할

	SqlSession sqlSession;
	// 가장 중요한 역할!
	
	public AdSuperDao() {
		sqlSession = Factory.getFactory().openSession();
		//mybatis와 연결되어지는 연결고리
	}
	
	//회원관리조회
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
	//회원관리수정
	public String status_modify(membershipVo vo) {
		String msg="";
		try {
			int count = sqlSession.update("admin.status_save",vo);//mybatis에 vo를 보내고 받아온걸 count에
			System.out.println(count);
			if(count >0) {
				msg="성공하셨습니다.";
				sqlSession.commit();
				
			}else {
				msg="수정실패했어요..";
				sqlSession.rollback();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			
			return msg;
		}
	}
	//파트너승인관리-조회
	public List<partnerVo> partner_select() {
		List<partnerVo> list = new ArrayList<partnerVo>();
		try {
			list = sqlSession.selectList("admin.partner_approval");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	//파트너승인요청수정
		public String partner_modify(partnerVo vo) {
			String msg="";
			try {
				int count = sqlSession.update("admin.p_save",vo);//mybatis에 vo를 보내고 받아온걸 count에
				System.out.println(count);
				if(count >0) {
					msg="성공하셨습니다!!";
					sqlSession.commit();
					
				}else {
					msg="수정실패했어요!!";
					sqlSession.rollback();
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				
				return msg;
			}
		}


}
