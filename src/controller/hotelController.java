package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
			tripList = dao.callTripList();
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
