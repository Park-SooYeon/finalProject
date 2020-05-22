package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import bean.PlaceVo;
import bean.TripListVo;
import dao.SubMainDao;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String placeMain(HttpServletRequest req, Model model) {
		System.out.println("들어와??");
		List<PlaceVo> happyList = null;
		List<PlaceVo> foodList = null;
		List<PlaceVo> festivalList = null;
		List<TripListVo> tripList = null;
		List<Integer> likeList = null;

		SubMainDao dao = new SubMainDao();

		// session에서 로그인 된 아이디 가져오기
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("member_id");
		
		if(id != null) {
			tripList = dao.callTripList();
			likeList = dao.selectLike(id);
		}		
		
		happyList = dao.happyMenuSelect(0);
		foodList = dao.foodMenuSelect(0);
		festivalList = dao.festivalMenuSelect(0);
		
		model.addAttribute("happyList", happyList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("tripList", tripList);
		model.addAttribute("likeList", likeList);
		
		return "index";
	}
}
