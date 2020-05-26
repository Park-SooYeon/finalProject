package hotel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import bean.Page;
import bean.PlaceVo;

@Controller
public class hotelController {

    hotelDao dao;
	public hotelController(hotelDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(value = "hotelMain.ht", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView select(HttpServletRequest req) { //HttpServletRequest req  autowire 로 DI 그래서  스프링이 req 타입으로 반환시켜준다
		ModelAndView mv = new ModelAndView();

		

		   System.out.println("야호");
	
		       
		
		/* 여기에 담긴 데이터는 request 영역에 담긴다! 따라서 jstl 을 {list} 이렇게 다이렉트로 써줘도 돼 */

		//mv.addObject("list", list);

		mv.setViewName("hotelMain");
		return mv;
	}

	
	
	
}
