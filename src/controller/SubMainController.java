package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SubMainController {
	
	// 지역 메인으로 이동
	@GetMapping("placeMain.sb")
	public String placeMain(@RequestParam int local) {
		
		return "placeMain";
	}
	
	// 지역 상관 없는 메인으로 이동
	@GetMapping("menuMain.sb")
	public String menuMain(@RequestParam int menu) {
		
		return "menuMain";
	}
	
	// 더보기로 관광지 검색 페이지로 이동
	@GetMapping("mainMore.sb")
	public String ViewMore(@RequestParam(required = false) int local, @RequestParam int menu) {
		
		
		return "food_index";
	}
	
	// 관광지 상세보기로 이동
	@GetMapping("detailView.sb")
	public String detailView(@RequestParam("code") int place_code) {
		
		return "detailView";
	}
}
