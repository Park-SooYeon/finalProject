package membership;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.membershipVo;




@Controller
public class membershipController {

	 @Autowired
	   // private JavaMailSender mailSender;
	

membershipDao dao;
ModelAndView mv;

public membershipController(membershipDao dao){
    this.dao=dao;

}



     /*
     
     // mailForm
     @RequestMapping(value = "/membership/mailForm")
     public String mailForm() {
      
       return "/membership/mailForm";
     }  
     
     // mailSending 코드
     @RequestMapping(value = "findPwd.ms")
     public String mailSending(HttpServletRequest request) {
      
       String setfrom = "아이디@gmail.com";         
       String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
       String title   = request.getParameter("title");      // 제목
       String content = request.getParameter("content");    // 내용
      
       try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper 
                           = new MimeMessageHelper(message, true, "UTF-8");
    
         messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
         messageHelper.setTo(tomail);     // 받는사람 이메일
         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
         messageHelper.setText(content);  // 메일 내용
        
         mailSender.send(message);
       } catch(Exception e){
         System.out.println(e);
       }
      
       return "redirect:/membership/mailForm";
     }
     
*/
    @RequestMapping( value ="memberJoin.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView memberJoin(HttpServletRequest req) {
        mv = new ModelAndView();
        
        String msg ="";
        
        membershipVo vo = new membershipVo();
        
        String member_id = req.getParameter("member_id");
        String pwd = req.getParameter("pwd");
        String member_name=req.getParameter("member_name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String nickName = dao.defaultNickName();
        
        		
        
        
        vo.setMember_id(member_id);
          System.out.println("member_id은 무엇이얌? " +vo.getMember_id());
        vo.setPwd(pwd);
        vo.setMember_name(member_name);
        vo.setPhone(phone);
        vo.setEmail(email);
           System.out.println("email :  "+ vo.getEmail());
        vo.setNickName(nickName);
        
        
       
        
       int result = dao.memberJoin(vo);
        
     
        
        if(result == 2 ) {
        	
        	  HttpSession session = req.getSession();
       	     session.setAttribute("member_id", member_id);
       	  
       	   
       	 
  
       	   System.out.println("닉네임 : "+vo.getNickName());
       	   
       	   session.setAttribute("nickName", vo.getNickName());
    
       	   msg ="회원가입이 완료되었습니다!";
    	
       	   mv.addObject("msg",msg);
       	      mv.setViewName("GoIndex");
        	
        	
        }else {
        	

        	   msg ="회원가입 중 오류가 발생했습니다!";
        	      mv.addObject("msg",msg);
        	
        	
        }
		
 
        
        return mv;
    }


    @RequestMapping( value ="partnerJoin.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView partnerJoin(HttpServletRequest req) {
        mv = new ModelAndView();
        mv.setViewName("partnerJoin");
        return mv;
    }

    
    @ResponseBody 
    @RequestMapping( value ="idCheck.ms", method= { RequestMethod.POST})
    public String idCheck(HttpServletRequest req) {
      
        String member_id = req.getParameter("member_id");
        System.out.println("아이디 췤");
    
        String str="";
        
        int result = dao.idCheck(member_id);
        
        if(result ==1) {
        	str="no";
        }else {
        	str="yes";
        		
        }
        
       return str;
    }

    
    @RequestMapping( value ="logout.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView logout(HttpServletRequest req) {
        mv = new ModelAndView();
        
        HttpSession session = req.getSession();
        session.removeAttribute("member_id");
        session.removeAttribute("nickName");
       
        
        return mv;
    }

    @RequestMapping( value ="login.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView login(HttpServletRequest req)  {
  
    	System.out.println("로그인 액션!");
    	
    	mv = new ModelAndView();
       
  
        
        membershipVo vo = new membershipVo();
        
        String member_id = req.getParameter("mId");
        String pwd = req.getParameter("pwd");
        
        
        vo.setMember_id(member_id);
        vo.setPwd(pwd);
        
        System.out.println(vo.getMember_id());
        System.out.println(vo.getPwd());
        
        int loginResult = dao.login(vo);
        
        System.out.println("로그인 결과  : "+loginResult);
        if(loginResult == -1) {
        	
        	   mv.addObject("msg","noId");
        	
        	
        }else if(loginResult == 0) {
        	
        	   HttpSession session = req.getSession();
        	   session.setAttribute("member_id", member_id);
        	  
        	   System.out.println(member_id);
        	   
        	   
        	   String nickName=dao.loginNickName(member_id);
        	   
        	   vo.setNickName(nickName);
        	   System.out.println("닉네임 : "+vo.getNickName());
        	   
        	   session.setAttribute("nickName", vo.getNickName());
        	   
        	      mv.setViewName("GoIndex");
        	   
        	   
        	   
        }else if(loginResult == 1) {
        	
        	 mv.addObject("msg","noPwd");
        }
       
 
      
        return mv;
    }


    @RequestMapping( value ="findPwd.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView findPwd(HttpServletRequest req) {
        mv = new ModelAndView();
        
        System.out.println("d여기야여기");
        
        mv.setViewName("findPwd");
        return mv;
    }




}
