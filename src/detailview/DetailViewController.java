package detailview;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.DetailViewVo;

@Controller
public class DetailViewController {
	DetailViewDao dao;
	
	public DetailViewController(DetailViewDao dao) {
		this.dao = dao;
		System.out.println("DetailViewController 생성자");
	}
	
	@RequestMapping(value = "detailView.dv", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		DetailViewVo vo = null;		
		int place_serial = Integer.parseInt(req.getParameter("code"));
		System.out.println("ModelAndView view place_serial : " + place_serial);
		vo = dao.view(place_serial);
		System.out.println("ModelAndView view vo : " + vo);
		
		
		mv.addObject("vo", vo);
		mv.setViewName("detailView");
		
		return mv;
	}

}
