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

	
	@RequestMapping(value = "hotel_index.ht", method = { RequestMethod.GET})
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
	
	@RequestMapping(value = "hotelDetailView.ht", method = { RequestMethod.GET})
	   public ModelAndView hotelDetailView(@RequestParam int place_serial, HttpServletRequest req) {
		
			ModelAndView  mv = new ModelAndView();
			System.out.println("디테일뷰 진입!!!!");
			System.out.println(place_serial); 
			
			List<roomVo> list = null;
	        PlaceVo vo =null;
			hotelDao hdao = new hotelDao();
			
			
	        
	        list = hdao.detailView(place_serial);
	        vo = hdao.detailViewHotel(place_serial);
	        List<roomPhotoVo> photoList = null;
	        photoList  = hdao.getPhotoList(place_serial);
	        
	      
			
			
	        mv.addObject("photoList",photoList);
			
			mv.addObject("list", list);
			mv.addObject("vo", vo);
			mv.setViewName("hotelDetailView");
			return mv;
		
			
		}
		

	
	
	// 검색어 필터 선택 시, 조회되는 관광지 정보들
		@ResponseBody
		@RequestMapping("searchList.ht")
		public ModelAndView searchList(@RequestParam(required = false, value="local[]") List<String> local,
										@RequestParam(required = false, value="filter[]") List<String> filter,
										@RequestParam(required = false, value = "findStr") String findStr
										) {
		
			ModelAndView mv = new ModelAndView();
			
			List<PlaceVo> searchList = null;
			hotelDao hDao = new hotelDao();
			
			
			
			System.out.println("ajax 성공적");
			// local, filter 값이 없을 경우, NullPointException 방지를 위하여 공백 값 설정
			if(local == null) {
				local = new ArrayList<>();
				local.add("");
			
			}
			if(filter == null) {
				filter = new ArrayList<>();
				filter.add("");
				
				
			}
			
			
			// 키워드가 들어왔을때.
			if(findStr == null || findStr.equals("")) {
				System.out.println("list 검색");
		
				
				searchList = hDao.searchList(local,filter);
				
			
				
			} else {
				System.out.println("키워드 검색");
				
			}
				
			
		
			mv.addObject("searchList", searchList);
			mv.setViewName("hotel_index");       
			
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
