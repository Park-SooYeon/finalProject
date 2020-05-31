package bean;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//먼저 메일 - 환경설정에서 세팅
// ( 보내는 사람 이메일 기준 )

public class SendEmail {
   public SendEmail() {
   
   }
   
   public void MailSend(membershipVo vo) {
      
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
         //수신자 메일 주소
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail()));
       
         /*
         if(r==1) {
            //제목
            message.setSubject("[Rabbit Market] 개인정보 전송");
            
            //내용
            message.setContent("<h1>[개인정보 안내]</h1><br>"
                  + "<p>아이디는 <b> "+ vo.getmId() + "</b> 입니다.</p><br> <a href='http://localhost:8888/Semi_project_final1/index.jsp'><b>Rabbit Market</b></a> 으로 이동", "text/html; charset=utf-8");
            
            Transport.send(message); // 전송
            System.out.println("message sent successfully...");
         }
         if(r==2) {
            message.setSubject("[Rabbit Market] 개인정보 전송");
                        
            message.setContent("<h1>[개인정보 안내]</h1><br>"
                  + "<p>비밀번호는 <b>"+ vo.getPwd() + "</b> 입니다.</p><br> <a href='http://localhost:8888/Semi_project_final1/index.jsp'><b>Rabbit Market</b></a> 으로 이동", "text/html; charset=utf-8");
            Transport.send(message); // 전송
            System.out.println("message sent successfully...");
         }
         */
      }catch (AddressException e) {
         e.printStackTrace();
      }catch (MessagingException e) {
         e.printStackTrace();
      }
   }
}