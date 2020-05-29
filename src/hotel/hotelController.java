package hotel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import bean.PlaceVo;

@Controller
public class hotelController {

    hotelDao dao;
	public hotelController(hotelDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping(value = "hotelMain.ht", method = { RequestMethod.GET })
	public ModelAndView select(HttpServletRequest req) { //HttpServletRequest req  autowire 로 DI 그래서  스프링이 req 타입으로 반환시켜준다
		ModelAndView mv = new ModelAndView();
		
		System.out.println("메인 진입");
		

		List<PlaceVo> list =dao.select();
	     
		       
	
 		
		return mv;
	}

	
	
	
}
