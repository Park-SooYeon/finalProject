package rent;



import java.util.List;

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
	ModelAndView mv;
	String contentPage;
	String mainPage;
	
	public RentControllor(RentDao rentDao) {
		this.rentDao = rentDao;
	}
	
	@RequestMapping(value="/rentMain.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goMain(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "";
		mainPage = "rentMain.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/companySearch.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView companySelect(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "rentSearchSub1.jsp";
		mainPage = "rentSearch.jsp";
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		String rentDate = req.getParameter("rentDate");
		String returnDate = req.getParameter("returnDate");
		List<CompanyVo> list = rentDao.companySearch(placeMain, placeSub, rentDate, returnDate);
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carSearch.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carSelect(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "rentSearchSub2.jsp";
		mainPage = "rentSearch.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carView.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carView(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "rentViewSub1.jsp";
		mainPage = "rentView.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carView2.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carView2(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "rentViewSub2.jsp";
		mainPage = "rentView.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/carView3.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView carView3(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "rentViewSub3.jsp";
		mainPage = "rentView.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/reserveResult.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reserveResult(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "";
		mainPage = "rentReserveResult.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/reserveSearch.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reserveSearch(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "";
		mainPage = "rentReserveSearch.jsp";
		
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
}
