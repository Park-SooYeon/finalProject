package membership;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class membershipController {

membershipDao dao;

public membershipController(membershipDao dao){
    this.dao=dao;

}

ModelAndView mv ;

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


    @RequestMapping( value ="login.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView login(HttpServletRequest req) {
        mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }


    @RequestMapping( value ="ChangePwd.ms", method= {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView ChangePwd(HttpServletRequest req) {
        mv = new ModelAndView();
        mv.setViewName("ChangePwd");
        return mv;
    }




}
