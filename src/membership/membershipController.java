package membership;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpCookie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.membershipVo;

@Controller
public class membershipController {

membershipDao dao;

public membershipController(membershipDao dao){
    this.dao=dao;

}

     ModelAndView mv;

    @RequestMapping( value ="memberJoin.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView memberJoin(HttpServletRequest req) {
        mv = new ModelAndView();
        mv.setViewName("memberJoin");
        return mv;
    }


    @RequestMapping( value ="partnerJoin.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView partnerJoin(HttpServletRequest req) {
        mv = new ModelAndView();
        mv.setViewName("partnerJoin");
        return mv;
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
        
        String member_id = req.getParameter("member_id");
        String pwd = req.getParameter("pwd");
        
        
        vo.setMember_id(member_id);
        vo.setPwd(pwd);
        
        System.out.println(vo.getMember_id());
        System.out.println(vo.getPwd());
        
        int loginResult = dao.login(vo);
        
        if(loginResult == -1) {
        	
        	   mv.addObject("msg","noId");
        	
        	
        }else if(loginResult == 0) {
        	
        	   HttpSession session = req.getSession();
        	   session.setAttribute("member_id", member_id);
        	  
        	   
        	   String nickName=dao.loginNickName(member_id);
        	   
        	   vo.setNickName(nickName);
        	   System.out.println("닉네임 : "+vo.getNickName());
        	   
        	   session.setAttribute("nickName", vo.getNickName());
        	   
        	   
        	   
        	   
        	   
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
