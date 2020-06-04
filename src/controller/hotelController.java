package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;


import java.text.DateFormat;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

import bean.LikeListVo;
import bean.Page;
import bean.PlaceVo;
import bean.ReviewVo;
import bean.TripListVo;
import bean.hotelBookingVo;
import bean.roomPhotoVo;
import bean.roomVo;
import dao.SubMainDao;
import dao.hotelDao;

import vo.ReputationVo;
import vo.RestDataVo;

@Controller
public class hotelController {

    hotelDao dao;
	public hotelController(hotelDao dao) {
		this.dao = dao;
	}

	
	
	@RequestMapping(value = "hotelReserv.ht", method = { RequestMethod.GET , RequestMethod.POST})
	   public ModelAndView Reserv(HttpServletRequest req,HttpServletResponse resp) {
		   DateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
           

		
		
			ModelAndView  mv = new ModelAndView();
			System.out.println("예약 페이지 진입!!!!!!!!!");
			 
			
			// session에서 로그인 된 아이디 가져오기
			HttpSession session = req.getSession();
			String member_id = (String) session.getAttribute("member_id");
			
			System.out.println(member_id);
		
			
			
			try {
			
				//Date checkin_date = sdf.parse(req.getParameter("start_date"));
			    //Date checkout_date = sdf.parse(req.getParameter("end_date"));
		     
			    //String member_name  = req.getParameter("member_name"); //투숙인 이름
		        String email= req.getParameter("email"); //예약 내역 메일 보낼 주소
				//String totalPrice =req.getParameter("total_price");
		        
		        //int rooms_serial = Integer.parseInt(req.getParameter("rooms_serial"));
				//int place_serial =	Integer.parseInt(req.getParameter("place_serial"));	
				//String betweenday= req.getParameter("betweenday");
		   
		        hotelBookingVo vo = new hotelBookingVo();
		        
		        //vo.setCheckin_date(checkin_date);
		       // vo.setCheckout_date(checkout_date);
		        vo.setMember_id(member_id);
		        //vo.setTotalPrice(totalPrice);
		       // vo.setPlace_serial(place_serial);
		        //vo.setRooms_serial(rooms_serial);
		     //   vo.setMember_name(member_name);
		        
		        System.out.println(member_id);


		        
		        vo.setEmail(email);
		        //vo.setBetweenday(betweenday);
		        
		        
		        
		        int result = dao.hotelReserv(vo);
		        
		    	if (result == 2) {// 정상 예약 완료 
	
					PrintWriter out;
					try {
						resp.setCharacterEncoding("UTF-8");
						resp.setContentType("text/html; charset=UTF-8");
	
						out = resp.getWriter();
						out.println("<script>alert('예약이 성공적으로 완료되어 예약 내역이 메일로 전송되었습니다.');</script>");
						mv.setViewName("hotel_index");
						out.flush();
	
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	
				} else {
	
					String msg = "예약 중 오류 발생";
					
					mv.addObject("msg", msg);
					mv.setViewName("hotelDetailView");
	
				}

			}catch(Exception ex) {
			   ex.printStackTrace();
			} 
	       
			
	
			
			return mv;
		

		}
		

	
	@RequestMapping(value = "hotel_index.ht", method = { RequestMethod.GET , RequestMethod.POST})
   public ModelAndView searchMenu(@RequestParam String local, HttpServletRequest req) {
	
		
		ModelAndView  mv = new ModelAndView();
		List<PlaceVo> searchMainListOK = null;
		List<PlaceVo> searchMainListNo = null;
		hotelDao hdao = new hotelDao();
		

		int local_code=Integer.parseInt(local);
		
		
		
		searchMainListOK = hdao.searchMainListOK(local_code);
		searchMainListNo = hdao.searchMainListNo(local_code);
		
		
		mv.addObject("searchOK",searchMainListOK);
		mv.addObject("searchNo",searchMainListNo);
		 
		
		return mv;
	
		
	}
	
	@RequestMapping(value = "hotelDetailView.ht", method = { RequestMethod.GET , RequestMethod.POST})
	   public ModelAndView hotelDetailView(@RequestParam int place_serial, HttpServletRequest req) {
		
			ModelAndView  mv = new ModelAndView();
			System.out.println("디테일뷰 진입!!!!");
			System.out.println(place_serial); 
			
			List<roomVo> list = null;
			List<ReviewVo> reviewList = null;
			List<roomPhotoVo> photoList = null;
	        PlaceVo vo =null;
			hotelDao hdao = new hotelDao();
			
			
	        
	        list = hdao.detailView(place_serial);
	        vo = hdao.detailViewHotel(place_serial);
	        photoList  = hdao.getPhotoList(place_serial);
	        reviewList = hdao.reviewList(place_serial);
	        
	      
	        
	        
	       
			
			
	        mv.addObject("reviewList",reviewList);
	        mv.addObject("photoList",photoList);
			mv.addObject("list", list);
			mv.addObject("vo", vo);
			mv.setViewName("hotelDetailView");
			return mv;
		
			
		}
		

	
	
	
	@RequestMapping(value = "hotelMain.ht", method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView hotelMain(HttpServletRequest req) { 
		ModelAndView mv = new ModelAndView();
		
		System.out.println("메인 진입");
		
		List<PlaceVo> hotelnoRevList = null;
        List<PlaceVo> hotelyesRevList = null; 
		
		
		List<TripListVo> tripList = null;
		List<Integer> likeList = null;
		
		SubMainDao dao = new SubMainDao();
        hotelDao hdao = new hotelDao();
		
		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");

		if(id != null) {
			tripList = dao.callTripList(id);
			likeList = dao.selectLike(id);
		}		
		
		hotelnoRevList = hdao.MainSelectNoRev();
		hotelyesRevList = hdao.MainSelectYesRev();
		
		
		
		mv.addObject("hotelList", hotelnoRevList);
		mv.addObject("hotelList2", hotelyesRevList);
		
		
		mv.addObject("tripList",tripList);
		mv.addObject("likeList",likeList);
		mv.setViewName("hotelMain");       
	
 		
		return mv;
	}

	

	
}
