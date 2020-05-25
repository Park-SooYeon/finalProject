package membership;

import bean.Factory;
import bean.membershipVo;


import org.apache.ibatis.session.SqlSession;

public class membershipDao {
	SqlSession sqlSession;
	membershipVo vo;

	public membershipDao() {
		sqlSession = Factory.getFactory().openSession();
	}

	public int login(membershipVo vo) {

		
		
		int r = 0;
		boolean b=true;
		boolean lb = true;
		try {
			b = sqlSession.selectOne("ms.loginCheck", vo);

			if (b == false) { // DB에 아에 member_id가 없는경우

				r = -1;

			} else { // member_id 는 존재 !

				lb = sqlSession.selectOne("ms.login", vo);
				if (lb) {// 로그인 성공!!!!!!
                   
					r = 0;
				
				}else { // pwd 오류.......

					r = 1;
				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

			return r;
		}
	}
	
	
	public String loginNickName(String member_id) {
		
	  System.out.println("닉네임 찾긔 : " + member_id);
		
		String n="";
		try {
	            n = sqlSession.selectOne("ms.loginNickName", member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
		return n;
		}
	}
	
	
	
	public int memberJoin(membershipVo vo) {
		int r=2;
		int result=0;
		try {
			
			
			result=sqlSession.insert("ms.join",vo);
			if (result < 1) {// 회원가입 실패!!!!!!

				throw new Exception("회원 저장 중 오류 발생했다요~~!");
			    
			}
			
			sqlSession.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			r=3;
			sqlSession.rollback();
			
		}finally {

		return r;
		
		}
	}
	
	
	public String defaultNickName() {
		String dn ="";
		int countmId=0;
		       
		countmId =sqlSession.selectOne("ms.defaultNickName");
		
		
		dn="travelista"+"-"+"#"+Integer.toString(countmId);
		System.out.println(dn);
		
		
		return dn;
		
		
	}
	
	
	public int idCheck(String member_id) {
		int r =0;

		try {
			r = sqlSession.selectOne("ms.idCheck", member_id);
			System.out.println("result : " + r);
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			return r;
		}
		
	}
	

}
