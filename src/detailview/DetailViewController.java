package detailview;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.DetailViewVo;
import bean.PlaceVo;

@Controller
public class DetailViewController {
	DetailViewDao dao;
	
	public DetailViewController(DetailViewDao dao) {
		this.dao = dao;		
	}
	
	//상세보기
	@RequestMapping(value = "detailView.dv", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		DetailViewVo vo = null;		
		int place_serial = Integer.parseInt(req.getParameter("code"));		
		vo = dao.view(place_serial);
		
		List<PlaceVo> list = dao.photoView(place_serial);
		
		mv.addObject("vo", vo);
		mv.addObject("list", list);
		System.out.println(list.get(0).getPhoto_name());
		mv.setViewName("detailView");
		
		return mv;
	}
	
	//리뷰 신고하기
	@RequestMapping(value = "detailView.dv", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView report(@RequestParam(value = "radioValues[]") List<String> arrayParams, @RequestParam(value="userId") String userId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("arrayParams", arrayParams);
		mv.addObject("userId", userId);
		
		return mv;
	}

}
