package rent;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/rent")
public class RentControllor {
	
	
	RentDao rentDao;
	
	public RentControllor(RentDao rentDao) {
		this.rentDao = rentDao;
	}
	
	@RequestMapping(value="/rentMain.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goMain(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "";
		String mainPage = "rentMain.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/companySearch.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView companySelect(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentSearchSub1.jsp";
		String mainPage = "rentSearch.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carSearch.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carSelect(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentSearchSub2.jsp";
		String mainPage = "rentSearch.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carView.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carView(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentViewSub1.jsp";
		String mainPage = "rentView.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carView2.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carView2(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentViewSub2.jsp";
		String mainPage = "rentView.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carView3.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carView3(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "rentViewSub3.jsp";
		String mainPage = "rentView.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/reserveResult.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reserveResult(HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String contentPage = "";
		String mainPage = "rentReserveResult.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
}
