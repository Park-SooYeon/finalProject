package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;

import javax.mail.Transport;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.Page;
import bean.PlaceVo;
import bean.ReviewVo;
import bean.hotelBookingVo;
import bean.partnerVo;
import bean.roomPhotoVo;
import bean.roomVo;

public class hotelDao {

	SqlSession sqlSession;
	
	
	public hotelDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	

public List<roomPhotoVo> getPhotoList(int place_serial){
	
	List<roomPhotoVo> photoList = null;
	 try {
		 
		 photoList =sqlSession.selectList("ht.photo_list",place_serial);
		 
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }finally {
		// sqlSession.close();
		 return photoList ;
	 }
	 
	 
	
	
}


public List<ReviewVo> reviewList(int place_serial) {
	List<ReviewVo> reviewList = null;
	
	try {
	
		
		reviewList = sqlSession.selectList("ht.reviewList",place_serial);
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return reviewList;
		
	}
	
	
}

public List<roomVo> detailView(int place_serial) {
	List<roomVo> list = null;
	
	try {
	
		
	    list = sqlSession.selectList("ht.detailView",place_serial);
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}
	
public PlaceVo detailViewHotel(int place_serial) {
	PlaceVo vo =null;
	
	try {
	
		
	    vo = sqlSession.selectOne("ht.detailViewHotel",place_serial);
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return vo;
		
	}
	
	
}
	
public List<PlaceVo> MainSelectNoRev() {
	List<PlaceVo> list = null;
	
	try {
	
		
	    list = sqlSession.selectList("ht.mainNo");
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}

public List<PlaceVo> MainSelectYesRev() {
	List<PlaceVo> list = null;
	System.out.println("진입");
	try {
	
		
	    list = sqlSession.selectList("ht.mainYes");

	    
	    
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}
	

public List<PlaceVo> searchMainListOK(int local_code) {

	List<PlaceVo> list = null;
	System.out.println("진입");
	try {
	
		
	    list = sqlSession.selectList("ht.searchMainOK",local_code);

	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}


}

public List<PlaceVo> searchMainListNo(int local_code) {

	List<PlaceVo> list = null;
	System.out.println("진입!!");
	try {
	
		
	    list = sqlSession.selectList("ht.searchMainNo",local_code);


	    
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}


}


public int hotelReserv(hotelBookingVo vo) {
	int r=2;
	int result=0;
	try {
		System.out.println("아이디 가져와"+vo.getMember_id() +vo.getMember_name());
		
		result=sqlSession.insert("ht.hotelReserv",vo);
		if (result < 1) {// 예약 실패

			throw new Exception("예약  중 오류 발생했다요~~!");
		    
		}
	
		String msg = MailSend(vo);
		
		if(msg == "yes") {
		    
		   sqlSession.commit();
	       
		}else {
			
			throw new Exception("예약하고 메일보낼 때  오류 발생했다요~~!");
			
		}
	}catch(Exception ex) {
		ex.printStackTrace();
		r=3;
		sqlSession.rollback();
		
	}finally {

	return r;
	
	}
}



public String MailSend(hotelBookingVo vo) {
    
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
          return new PasswordAuthentication(user,password);
       }
    });
    
    
    try {
       MimeMessage message = new MimeMessage(session);
       message.setFrom(new InternetAddress(user));
       //수신자 메일 주소 ( 예약할 때 넣은 이메일 주소입니다 )
       message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail()));
       
     
     
    
          //제목
          message.setSubject("[Travelista] 예약 안내 메일입니다.");
          
          //내용
          message.setContent(
          		  "<h1>[예약 정보]</h1><br>"
        		+ "<div style=''>예약이 완료되었습니다.</div>"  
                + " <p>예약한 호텔 이름 : <b> "+ vo.getPlace_name() + "</b></p><br>"
                + " <p>위치 : <b> " + vo.getPlace_location() + "</b></p><br>"
                + " <p>투숙인 성함: <b> " + vo.getMember_name()  + "</b></p><br>"
                + " <p>체크인 날짜 : <b> " + vo.getCheckin_date()  + "</b></p><br>"
                + " <p>체크 아웃 : <b> " + vo.getCheckout_date()  + "</b></p><br>"
                //+ " <p>총 숙박일 : <b> " + vo.getBetweenday() + "</b></p><br>"
                
                //+ " <p>총 결제 금액 : <b> " + vo.getTotalPrice()  + "</b></p><br>"
                
                + "<div style=''></div>" 
                , "text/html; charset=utf-8");
          
          Transport.send(message); // 전송
          msg="yes";
          
          
          System.out.println("message sent successfully...");
           return msg;
           
    }catch (MessagingException e) {
       e.printStackTrace();
       msg="no";
       return msg;
    
    }
    
 }
	



/*
public List<PlaceVo> searchList(List<String> local,List<String> filter) {
	List<PlaceVo> list = null;
	System.out.println("진입");
	try {
	
		Map<String,Object> map= new HashMap<String,Object>();
		
	
		
		
		map.put("local", local);
		map.put("filter", filter);
		
		
		
		
		for(int i=0; i<filter.size();i++) {
	 System.out.println("이 필터가 있니?" + filter);
		}
		
		System.out.println("이 필터의 길이가 뭐님? : " + filter.size());
		
	    list = sqlSession.selectList("ht.placeSelect",map);

	    
	    
	    
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}
*/


}