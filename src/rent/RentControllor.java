package rent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RentControllor {

	RentDao dao;
	
	@RequestMapping(value="/rentMain.rent",method=RequestMethod.POST)
	public ModelAndView companySelect() {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentMain.jsp";
		mv.addObject("contentPage",contentPage);
		mv.setViewName("rent_index");
		return mv;
	}
}
