package rent;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import rent_parameter.CompanyPm;
import rent_parameter.DateVo;

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
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		List<rent_parameter.CompanyVo> list = rentDao.companySearch(placeMain, placeSub, rentDate, returnDate ,between);
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);
		mv.addObject("list", list);
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/fillter.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView companyFillter(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "rentSearchSub1.jsp";
		mainPage = "rentSearch.jsp";
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		String rentDate = req.getParameter("rentDate");
		String returnDate = req.getParameter("returnDate");
		String companyCheck =req.getParameter("companyCheck");
		String airconCheck = req.getParameter("airconCheck");
		String gearCheck = req.getParameter("gearCheck");
		String doorCheck =  req.getParameter("doorCheck");
		String maxPeopleCheck = req.getParameter("maxPeopleCheck");
		String priceCheck = req.getParameter("priceCheck");
		String kindCheck = req.getParameter("kindCheck");
		
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		List<rent_parameter.CompanyVo> list = rentDao.companyFillter(placeMain, placeSub, rentDate, returnDate ,between ,companyCheck,airconCheck,gearCheck,doorCheck,maxPeopleCheck,priceCheck,kindCheck);
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		
		
		mv.addObject("companyCheck",companyCheck);
		mv.addObject("airconCheck", airconCheck);
		mv.addObject("gearCheck",gearCheck);
		mv.addObject("doorCheck",doorCheck);
		mv.addObject("maxPeopleCheck",maxPeopleCheck);
		mv.addObject("priceCheck",priceCheck);
		mv.addObject("kindCheck",kindCheck);
		
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);		
		mv.addObject("list", list);	
		
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
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		String rentDate = req.getParameter("rentDate");
		String returnDate = req.getParameter("returnDate");
		String companyCheck =req.getParameter("companyCheck");
		String airconCheck = req.getParameter("airconCheck");
		String gearCheck = req.getParameter("gearCheck");
		String doorCheck =  req.getParameter("doorCheck");
		String maxPeopleCheck = req.getParameter("maxPeopleCheck");
		String priceCheck = req.getParameter("priceCheck");
		String kindCheck = req.getParameter("kindCheck");
		
		
		
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		List<rent_parameter.CompanyVo> list = rentDao.companyFillter(placeMain, placeSub, rentDate, returnDate ,between ,companyCheck,airconCheck,gearCheck,doorCheck,maxPeopleCheck,priceCheck,kindCheck);
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		
		
		int company_serial = Integer.parseInt(req.getParameter("company_serial"));
		List<rent_parameter.CarVo> car_list = rentDao.carSearch(company_serial,between);
		mv.addObject("car_list", car_list);
		
		
		mv.addObject("companyCheck",companyCheck);
		mv.addObject("airconCheck", airconCheck);
		mv.addObject("gearCheck",gearCheck);
		mv.addObject("doorCheck",doorCheck);
		mv.addObject("maxPeopleCheck",maxPeopleCheck);
		mv.addObject("priceCheck",priceCheck);
		mv.addObject("kindCheck",kindCheck);
		
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);		
		mv.addObject("list", list);	
		
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
