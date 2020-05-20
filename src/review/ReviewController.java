package review;

import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.Page;
import bean.ReviewVo;

@Controller
public class ReviewController {
	ReviewDao dao;
	
	public ReviewController(ReviewDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/select.rv", method= {RequestMethod.GET})
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Page p = new Page();
		p.setFindStr(req.getParameter("findStr"));
		if(req.getParameter("nowPage") == null) {
			p.setNowPage(1);
		}else {
			p.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		}
		List<ReviewVo> list = dao.select(p);
		
		
		return mv;
	}

}
