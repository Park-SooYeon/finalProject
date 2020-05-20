package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bean.PlaceVo;
import dao.SubMainDao;
import vo.MainVo;

@Controller
public class SubMainController {
	
	// 지역 메인으로 이동
	@GetMapping("placeMain.sb")
	public String placeMain(@RequestParam int local, Model model) {
		
		List<PlaceVo> happyList = null;
		List<PlaceVo> foodList = null;
		List<PlaceVo> festivalList = null;
		SubMainDao dao = new SubMainDao();
		
		happyList = dao.happyMenuSelect(local);
		foodList = dao.foodMenuSelect(local);
		festivalList = dao.festivalMenuSelect(local);
		
		System.out.println(happyList.get(1).getPhoto_name());
		model.addAttribute("happyList", happyList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("festivalList", festivalList);
		return "placeMain";
	}
	
	// 지역 상관 없는 메인으로 이동
	@GetMapping("menuMain.sb")
	public String menuMain(@RequestParam int menu, Model model) {
		
		List<PlaceVo> starList = null;
		List<PlaceVo> reviewList = null;
		SubMainDao dao = new SubMainDao();
		
		starList = dao.highStarsSelect(menu);
		reviewList = dao.manyReviewSelect(menu);

		model.addAttribute("starList", starList);
		model.addAttribute("reviewList", reviewList);
		return "menuMain";
	}
	
	// 더보기로 관광지 검색 페이지로 이동
	@GetMapping("mainMore.sb")
	public String ViewMore(@RequestParam(required = false) int local, @RequestParam int menu, Model model) {
		
		List<PlaceVo> list = null;
		SubMainDao dao = new SubMainDao();
		
		switch(menu) {
		case 1:
			list = dao.happyMenuSelect(local);
			break;
		case 2:
			list = dao.foodMenuSelect(local);
			break;
		case 3:
			list = dao.festivalMenuSelect(local);
			break;
		}
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "food_index";
	}
	
	// 관광지 상세보기로 이동
	@GetMapping("detailView.sb")
	public String detailView(@RequestParam("code") int place_code) {
		
		return "detailView";
	}
}
