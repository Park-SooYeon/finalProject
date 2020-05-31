package dao;

import bean.Factory;
import bean.membershipVo;
import bean.partnerVo;

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
	
	
	public int partnerHotelJoin(partnerVo vo) {
		int r=2;
		int result=0;
		try {
			
			
			result=sqlSession.insert("ms.hotelJoin",vo);
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
	
	public int partnerRentJoin(partnerVo vo) {
		int r=2;
		int result=0;
		try {
			
			
			result=sqlSession.insert("ms.rentJoin",vo);
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
	

	public static String randomN() { //문자열과 특수문자, 숫자 섞인 랜덤한 값을 만들어주는 함수 
		char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
				'v', 'w', 'x', 'y', 'z'};
		String ranN = "";

		for (int i = 0; i < 4; i++) {
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));
																				
			ranN += pwCollection[selectRandomPw];
		}
		return ranN;
	}

	
	
	
	public String defaultNickName() {
		String dn ="";
		
		String ranN = randomN();       

		
		
		dn="travelista"+"-"+"#"+ranN;
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
