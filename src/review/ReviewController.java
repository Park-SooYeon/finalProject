package review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping(value = "review_select.rv", method= {RequestMethod.GET})
	public ModelAndView select(HttpServletRequest req) {
		System.out.println("실행됨?");
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
	
	
	@RequestMapping(value = "review_insert.rv", method= {RequestMethod.GET})
	public ModelAndView insert() {		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("review_insert");
		
		return mv;
	}
	
	
	@RequestMapping(value = "review_insertR.rv", method= {RequestMethod.GET})
	public ModelAndView insertR(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		
		return mv;
	}

}
