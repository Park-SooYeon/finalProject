package rent;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RentControllor {
	
	
	RentDao rentDao;
	
	public RentControllor(RentDao rentDao) {
		this.rentDao = rentDao;
	}
	
	@RequestMapping(value="/rentMain.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goMain() {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentMain.jsp";
		mv.addObject("contentPage",contentPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/companySearch.rent",method= {RequestMethod.POST})
	public ModelAndView companySelect() {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentSearchSub1.jsp";
		mv.addObject("contentPage",contentPage);
		mv.setViewName("rentSearch");
		return mv;
	}
}
