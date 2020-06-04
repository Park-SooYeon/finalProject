package dao;

import bean.Factory;
import bean.membershipVo;
import bean.partnerVo;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
	
	
	public membershipVo loginUserInfo(String member_id) {
		
	  System.out.println("닉네임 찾긔 : " + member_id);
		
	  membershipVo vo= null;
		try {
			vo = sqlSession.selectOne("ms.loginUserInfo", member_id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
		return vo;
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
	
	// 비밀번호 체크
	public boolean pwdCheck(membershipVo vo) {
		boolean result = false;
		
		try {
			result = sqlSession.selectOne("ms.login", vo);
			
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		
		return result;
	}
	
	// email, name 등 정보 가져오기
	public membershipVo getUserInfo(String member_id) {
		membershipVo vo = null;
		
		try {
			vo = sqlSession.selectOne("ms.getUserInfo", member_id);
			
		} catch(Exception ex) {
			System.out.println("회원 정보 가져올 때 에러 발생");
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	// 회원 정보 수정
	public void changeUserInfo(membershipVo vo) {
		try {
			System.out.println("mId : " + vo.getMember_id());
			System.out.println("pwd_check : " + vo.getPwd());
			System.out.println("mName : " + vo.getMember_name());
			System.out.println("email : " + vo.getEmail());
			int r = sqlSession.update("ms.changeUserInfo", vo);
			System.out.println("여기까지 오는가??");
			if(r < 1) {
				throw new Exception("회원 정보 수정 중 오류 발생");
			}
			
			sqlSession.commit();
		} catch(Exception ex) {
			sqlSession.rollback();
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	// 회원 탈퇴 요청
	public void deleteUser(membershipVo vo) {
		try {
			System.out.println("id : " + vo.getMember_id());
			System.out.println("delete reason : " + vo.getDelete_reason());
			int r = sqlSession.update("ms.deleteUser", vo);
			if(r < 1) {
				throw new Exception("회원 정보 탈퇴 요청 중 오류 발생");
			}
			
			sqlSession.commit();
		} catch(Exception ex) {
			sqlSession.rollback();
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	// 인증 메일 보내기
	public String MailSend(String email, String ran) {
		String msg = "";
		
		String host = "smtp.gmail.com";
		String user = "liliumk0204@gmail.com";
	    String password = "dbwls2002";


		// SMTP 서버 정보 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			// 수신자 메일 주소 ( 예약할 때 넣은 이메일 주소입니다 )
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// 제목
			message.setSubject("[Travelista] 이메일 인증 안내 메일입니다.");

			// 내용
			message.setContent(
					"<h1>[이메일 인증 정보]</h1><br>"
					+ "<div style=''></div>" 
					+ " <p>인증 번호 : <b> " + ran + "</b></p><br>"
					+ "<div style=''></div>", "text/html; charset=utf-8"
					);

			Transport.send(message); // 전송

			System.out.println("message sent successfully...");
			msg = "yes";

		} catch (MessagingException e) {
			e.printStackTrace();
			msg = "no";

		}
		
		return msg;
	}

	// 인증 번호 확인
	public String chkNumber(String number) {
		String result = "";
		
		return result;
	}

}
