package controller;



import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.RentDao;
import rent_parameter.CarViewVo;
import rent_parameter.CompanyPm;
import rent_parameter.DateVo;
import rent_parameter.ReservePm;
import rent_parameter.ReserveSearchVo;
import rent_parameter.ReserveVo;
import rent_parameter.rentReviewPm;
import rent_parameter.rentReviewTotVo;
import rent_parameter.rentReviewVo;

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
		List<rent_parameter.CarVo> car_list = rentDao.carSearch(company_serial,between,kindCheck,airconCheck,gearCheck,doorCheck,maxPeopleCheck,priceCheck);
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
		
		int car_serial = Integer.parseInt(req.getParameter("car_serial"));
		String rentDate = req.getParameter("rentDate");
		String returnDate = req.getParameter("returnDate");
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		CarViewVo vo= rentDao.carView(car_serial,rentDate,returnDate,between);
		
		Timestamp rentD = rentDao.TimeMaker(rentDate);
		mv.addObject("car_serial", car_serial);
		mv.addObject("vo", vo);
		
		mv.addObject("rentD",rentD);
		
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);
		
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
		
		int car_serial = Integer.parseInt(req.getParameter("car_serial"));
		String rentDate = req.getParameter("rentDate");
		String returnDate = req.getParameter("returnDate");
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		
		String scale_kind = req.getParameter("scale_kind");
		
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		
		Timestamp rentD = rentDao.TimeMaker(rentDate);
		
		
		List<rent_parameter.rentReviewVo> review_list = rentDao.rentReview(car_serial,scale_kind);
		rentReviewTotVo review_tot = rentDao.rentReviewTot(car_serial);
		mv.addObject("review_tot", review_tot);
		mv.addObject("review_list",review_list);
		
		mv.addObject("car_serial", car_serial);
		mv.addObject("scale_kind", scale_kind);
		
		mv.addObject("rentD",rentD);
		
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);
		
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
		
		int car_serial = Integer.parseInt(req.getParameter("car_serial"));
		String rentDate = req.getParameter("rentDate");
		String returnDate = req.getParameter("returnDate");
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		
		
		Timestamp rentD = rentDao.TimeMaker(rentDate);
		mv.addObject("car_serial", car_serial);
		
		
		mv.addObject("rentD",rentD);
		
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);
		
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
		
		String placeMain = req.getParameter("placeMain");
		String placeSub = req.getParameter("placeSub");
		
		int car_serial		=Integer.parseInt(req.getParameter("car_serial"));
		String member_id	=req.getParameter("member_id");
		String email 		=req.getParameter("email");
		String phone 		=req.getParameter("phone"); 
		String fullcover 	=req.getParameter("fullcover");
		String rentDate 	=req.getParameter("rentDate");
			String rentD = rentDao.oracleTimeMaker(rentDate);
		String returnDate 	=req.getParameter("returnDate");
			String returnD = rentDao.oracleTimeMaker(returnDate);
		String payment ="카카오페이";
//		if(req.getParameter("payment")==null) {
//			payment		="카카오페이";
//		}else {
//			payment		=req.getParameter("payment");
//		}
		int price			=Integer.parseInt(req.getParameter("price"));
		ReservePm pm = new ReservePm(car_serial, member_id, email, phone, rentD, returnD, fullcover, payment, price ,placeMain , placeSub);
		String msg = rentDao.reserveInsert(pm);
		int reserve_serial =rentDao.reserveSerial();
		int betweenDay = rentDao.DateBettweenDay(rentDate, returnDate);
		long between = rentDao.DateBettween(rentDate, returnDate);
		CarViewVo vo= rentDao.carView(car_serial,rentDate,returnDate,between);
		
		DateVo dateVo1 = rentDao.paramTime(rentDate);
		DateVo dateVo2 = rentDao.paramTime(returnDate);
		
		mv.addObject("car_serial", car_serial);
		mv.addObject("vo", vo);
		mv.addObject("reserve_serial",reserve_serial);
		
		mv.addObject("email", email);
		mv.addObject("phone",phone);
		mv.addObject("fullcover",fullcover);
		mv.addObject("payment",payment);
		mv.addObject("price",price);
		mv.addObject("rentDate",rentDate);
		mv.addObject("returnDate",returnDate);
		mv.addObject("placeMain",placeMain);
		mv.addObject("placeSub",placeSub);
		mv.addObject("betweenDay", betweenDay);
		mv.addObject("dateVo1",dateVo1);
		mv.addObject("dateVo2", dateVo2);
		
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
		
		String member_id = req.getParameter("member_id_t");
		
		//예약내역
		List<ReserveVo> reserve_list1 = rentDao.reserveSearch1(member_id);
		List<ReserveSearchVo> param_list1 = rentDao.paramMaker(reserve_list1);
		
		//지난 내역
		List<ReserveVo> reserve_list2 = rentDao.reserveSearch2(member_id);
		List<ReserveSearchVo> param_list2 = rentDao.paramMaker(reserve_list2);
		
		//취소 내역
		
		List<ReserveVo> reserve_list3 = rentDao.reserveSearch3(member_id);
		List<ReserveSearchVo> param_list3 = rentDao.paramMaker(reserve_list3);
		
		
		mv.addObject("reserve_list1",reserve_list1 );
		mv.addObject("param_list1",param_list1);
		
		mv.addObject("reserve_list2",reserve_list2 );
		mv.addObject("param_list2",param_list2);
		
		mv.addObject("reserve_list3",reserve_list3 );
		mv.addObject("param_list3",param_list3);
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
	
	@RequestMapping(value="/reserveCancle.rent",method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reserveCancle(HttpServletRequest req,HttpServletResponse resp) {
		mv = new ModelAndView();
		contentPage = "";
		mainPage = "rentReserveSearch.jsp";
		
		String member_id = req.getParameter("member_id");
		String reserve_serial = req.getParameter("reserve_serial");
		
		//예약 취소update
		String msg = rentDao.reserveCancle(reserve_serial);
		
		//예약내역
		List<ReserveVo> reserve_list1 = rentDao.reserveSearch1(member_id);
		List<ReserveSearchVo> param_list1 = rentDao.paramMaker(reserve_list1);
		
		//지난 내역
		List<ReserveVo> reserve_list2 = rentDao.reserveSearch2(member_id);
		List<ReserveSearchVo> param_list2 = rentDao.paramMaker(reserve_list2);
		
		//취소 내역
		List<ReserveVo> reserve_list3 = rentDao.reserveSearch3(member_id);
		List<ReserveSearchVo> param_list3 = rentDao.paramMaker(reserve_list3);
		
		mv.addObject("msg",msg);
		
		mv.addObject("reserve_list1",reserve_list1 );
		mv.addObject("param_list1",param_list1);
		
		mv.addObject("reserve_list2",reserve_list2 );
		mv.addObject("param_list2",param_list2);
		
		mv.addObject("reserve_list3",reserve_list3 );
		mv.addObject("param_list3",param_list3);
		
		mv.addObject("contentPage",contentPage);
		mv.addObject("mainPage",mainPage);
		mv.setViewName("rent_index");
		return mv;
	}
}



























