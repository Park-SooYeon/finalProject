package dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import rent_parameter.CarPm;
import rent_parameter.CarViewPm;
import rent_parameter.CarViewVo;
import rent_parameter.CompanyPm;
import rent_parameter.DateVo;
import rent_parameter.ReservePm;
import rent_parameter.ReserveSearchVo;
import rent_parameter.ReserveVo;
import rent_parameter.rentReviewPm;
import rent_parameter.rentReviewTotVo;
import rent_parameter.rentReviewVo;



public class RentDao {
	SqlSession sqlSession;
	public RentDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<rent_parameter.CompanyVo> companySearch(String placeMain ,String placeSub ,String rentDate , String returnDate , long between){
		List<rent_parameter.CompanyVo> list = null;
		try {
			Timestamp rDate = TimeMaker(rentDate);
			Timestamp tDate = TimeMaker(returnDate);
			CompanyPm pm = new CompanyPm(placeMain,placeSub,rDate,tDate,between);
			list = sqlSession.selectList("rent.company",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
	public List<rent_parameter.CompanyVo> companyFillter(String placeMain ,String placeSub ,String rentDate , String returnDate , long between,String companyCheck,String airconCheck,String gearCheck,String doorCheck,String maxPeopleCheck,String priceCheck,String kindCheck){
		List<rent_parameter.CompanyVo> list = null;
		try {
			Timestamp rDate = TimeMaker(rentDate);
			Timestamp tDate = TimeMaker(returnDate);
			CompanyPm pm = new CompanyPm(placeMain,placeSub,rDate,tDate,between,companyCheck,airconCheck,gearCheck,doorCheck,maxPeopleCheck,priceCheck,kindCheck);
			list = sqlSession.selectList("rent.companyFillter",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
	
	public List<rent_parameter.CarVo> carSearch(int company_serial,long between,String kindCheck,String airconCheck,String gearCheck,String doorCheck,String maxPeopleCheck,String priceCheck){
		List<rent_parameter.CarVo> list = null;
		try {
			CarPm pm = new CarPm(company_serial,between,kindCheck,airconCheck,gearCheck,doorCheck,maxPeopleCheck,priceCheck);
			list = sqlSession.selectList("rent.carSearch",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
	public CarViewVo carView(int car_serial,String rentDate,String returnDate,long between){
		rent_parameter.CarViewVo vo = new rent_parameter.CarViewVo();
		try {
			Timestamp rDate = TimeMaker(rentDate);
			Timestamp tDate = TimeMaker(returnDate);
			CarViewPm cm = new CarViewPm(car_serial,rDate,tDate,between);
			vo = sqlSession.selectOne("rent.carView",cm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return vo;			
		}
		
	}
	
	public List<rentReviewVo> rentReview(int car_serial,String scale_kind){
		List<rentReviewVo> list = null;
		try {
			rentReviewPm pm = new rentReviewPm(car_serial,scale_kind);
			list = sqlSession.selectList("rent.reviewSearch",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
	public rentReviewTotVo rentReviewTot(int car_serial) {
		rentReviewTotVo vo = null;
		try {
			vo = sqlSession.selectOne("rent.reviewTotSearch",car_serial);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return vo;			
		}
	}
	
	public String reserveInsert(ReservePm pm) {
		String msg = null;
		try {
			int cnt = sqlSession.insert("rent.reserveInsert",pm);
			if(cnt<1) {
				throw new Exception("예약중 오류발생");
			}else {
				msg = "예약이 완료 되었습니다";
			}
			sqlSession.commit();
		}catch(Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
			sqlSession.rollback();
		}finally {
			return msg;
		}
	}
	
	public int reserveSerial() {
		int reserve_serial =0;
		try {
			reserve_serial = sqlSession.selectOne("rent.reserveSerial");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return reserve_serial;
		}
	}
	
	
	public int reserveSerialSearch(ReservePm pm) {
		int reserve_serial =0;
		try {
			
			reserve_serial = sqlSession.selectOne("rent.reserveSerialSearch",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return reserve_serial;
		}
	}
	
	public List<ReserveVo> reserveSearch1(String member_id){
		List<ReserveVo> list = null;
		try {
			list = sqlSession.selectList("rent.reserveSearch1",member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<ReserveVo> reserveSearch2(String member_id){
		List<ReserveVo> list = null;
		try {
			list = sqlSession.selectList("rent.reserveSearch2",member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<ReserveVo> reserveSearch3(String member_id){
		List<ReserveVo> list = null;
		try {
			list = sqlSession.selectList("rent.reserveSearch3",member_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public String reserveCancle(String reserve_serial) {
		String msg = null;
		try {
			int cnt = sqlSession.update("reserveCancle", reserve_serial);
			if(cnt<1) {
				msg = "취소중 오류가 발생했습니다";
				throw new Exception("예약중 오류발생");
			}else {
				msg ="취소가 완료 되었습니다";
			}
			sqlSession.commit();
		}catch(Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			msg = "취소중 오류가 발생했습니다";
		}finally {
			return msg;
		}
	}
	
	
	
	public Timestamp TimeMaker(String date) {
		String year = date.substring(6,10);
		String day = date.substring(3,5);
		String month = date.substring(0,2);
		String hour = date.substring(11,13);
		String min = date.substring(14,16);
		String a = date.substring(17,19);
		
		if(a.equals("pm")) {
			int h = Integer.parseInt(hour)+12;
			hour = String.valueOf(h);
		}
		String now = year+"-"+month+"-"+day+" "+hour+":"+min+":00.0";
		Timestamp t = Timestamp.valueOf(now);
		return t;
	}
	
	public String oracleTimeMaker(String date) {
		String year = date.substring(6,10);
		String day = date.substring(3,5);
		String month = date.substring(0,2);
		String hour = date.substring(11,13);
		String min = date.substring(14,16);
		String a = date.substring(17,19);
		if(a.equals("pm")) {
			int h = Integer.parseInt(hour)+12;
			hour = String.valueOf(h);
		}
		String oracleTime = year+month+day+hour+min+"00";
		
		return oracleTime;
	}
	
	public DateVo paramTime(String date) {
		String year = date.substring(6,10);
		String day = date.substring(3,5);
		String month = date.substring(0,2);
		String hour = date.substring(11,13);
		String min = date.substring(14,16);
		String a = date.substring(17,19);
		
		if(a.equals("pm")) {
			int h = Integer.parseInt(hour)+12;
			hour = String.valueOf(h);
		}
		String now = year+"-"+month+"-"+day+" "+hour+":"+min+":00.0";
		DateVo dv = new DateVo(now,year,day,month,hour,min);
		return dv;
	}
	
	public long DateBettween(String date1,String date2) {
		String year1 = date1.substring(6,10);
		String day1 = date1.substring(3,5);
		String month1 = date1.substring(0,2);
		String hour1 = date1.substring(11,13);
		String min1 = date1.substring(14,16);
		String a1 = date1.substring(17,19);
		
		if(a1.equals("pm")) {
			int h = Integer.parseInt(hour1)+12;
			hour1 = String.valueOf(h);
		}
		String now1 = year1+"-"+month1+"-"+day1+" "+hour1+":"+min1+":00.0";
		
		String year2 = date2.substring(6,10);
		String day2 = date2.substring(3,5);
		String month2 = date2.substring(0,2);
		String hour2 = date2.substring(11,13);
		String min2 = date2.substring(14,16);
		String a2 = date2.substring(17,19);
		
		if(a2.equals("pm")) {
			int h = Integer.parseInt(hour2)+12;
			hour2 = String.valueOf(h);
		}
		String now2 = year2+"-"+month2+"-"+day2+" "+hour2+":"+min2+":00.0";
		
		
		Timestamp t1 = Timestamp.valueOf(now1);
		Timestamp t2 = Timestamp.valueOf(now2);
		long diff = t2.getTime() - t1.getTime();
		long between = diff / (60*60*1000);
		return between;
		
	}
	
	public int DateBettweenDay(String date1,String date2) {
		String year1 = date1.substring(6,10);
		String day1 = date1.substring(3,5);
		String month1 = date1.substring(0,2);
		String hour1 = date1.substring(11,13);
		String min1 = date1.substring(14,16);
		String a1 = date1.substring(17,19);
		
		if(a1.equals("pm")) {
			int h = Integer.parseInt(hour1)+12;
			hour1 = String.valueOf(h);
		}
		String now1 = year1+"-"+month1+"-"+day1+" "+hour1+":"+min1+":00.0";
		
		String year2 = date2.substring(6,10);
		String day2 = date2.substring(3,5);
		String month2 = date2.substring(0,2);
		String hour2 = date2.substring(11,13);
		String min2 = date2.substring(14,16);
		String a2 = date2.substring(17,19);
		
		if(a2.equals("pm")) {
			int h = Integer.parseInt(hour2)+12;
			hour2 = String.valueOf(h);
		}
		String now2 = year2+"-"+month2+"-"+day2+" "+hour2+":"+min2+":00.0";
		
		
		Timestamp t1 = Timestamp.valueOf(now1);
		Timestamp t2 = Timestamp.valueOf(now2);
		long diff = t2.getTime() - t1.getTime();
		int between = (int) (diff / (60*60*1000*24));
		return between;
		
	}
	
	public String undoTimemaker(Timestamp date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		String a =sdf.format(date);
		String year = a.substring(6,10);
		String day = a.substring(3,5);
		String month = a.substring(0,2);
		String hour = a.substring(11,13);
		String min = a.substring(14,16);
		if(Integer.parseInt(hour) >12) {
			hour = Integer.parseInt(hour)-12+"";
			a +=" pm";
		}else {
			a +=" am";
		}
		return a;
	}
	
	public List<ReserveSearchVo> paramMaker(List<ReserveVo> reserve_list1){
		List<ReserveSearchVo> param_list1 = new ArrayList<ReserveSearchVo>();
		int car_serial = 0;
		Timestamp rentDate =null;
		Timestamp returnDate = null;
		CarViewVo vo = null;
		DateVo dateVo1 = null;
		DateVo dateVo2 = null;
		ReserveSearchVo rvo = null;
		long between = 0;
		
		for(int i =0; i< reserve_list1.size();i++) {
			car_serial =  reserve_list1.get(i).getCar_serial();
			rentDate =  reserve_list1.get(i).getRentDate();
			returnDate =  reserve_list1.get(i).getReturnDate();
			String a = undoTimemaker(rentDate);
			String b = undoTimemaker(returnDate);
			
			between = DateBettween(a, b);
			vo= carView(car_serial,a,b,between);
			dateVo1 = paramTime(a);
			dateVo2 = paramTime(b);
			rvo = new ReserveSearchVo(vo,dateVo1,dateVo2);
			param_list1.add(rvo);
		}
		return param_list1;
		
	}
	
	public void MailSend(int reserve_serial,String email) {
	    
	    String host = "smtp.naver.com";
	    String user = "ehrud129";
	    String password = "Qyqwyweye123";
	    
	    
	    // SMTP 서버 정보 설정
	    Properties prop = new Properties();
	    prop.put("mail.smtp.host", host);
	    prop.put("mail.smtp.port", 587);
	    prop.put("mail.smtp.auth", "true");
	    prop.put("mail.smtp.ssl.enable", "true");
	    prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
	    
	    Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	       protected PasswordAuthentication getPasswordAuthentication() {
	          return new PasswordAuthentication(user,password);
	       }
	    });
	    
	    
	    try {
	       MimeMessage message = new MimeMessage(session);
	       message.setFrom(new InternetAddress(user));
	       //수신자 메일 주소 ( 예약할 때 넣은 이메일 주소입니다 )
	       message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	       
	     
	     
	    
	          //제목
	          message.setSubject("[Travelista > rent] 예약번호 조회 결과 안내 메일입니다.");
	          
	          //내용
	          message.setContent(
	                "<h1>회원님의 예약 번호</h1><br>"
	                + " <p>예약번호 : <b> "+ reserve_serial + "</b> 입니다.</p><br>"
	                , "text/html; charset=utf-8");
	          
	          Transport.send(message); // 전송
	        
	          System.out.println("message sent successfully...");
	    
	    }catch (MessagingException e) {
	       e.printStackTrace();
	    }
	 }
	   
}
