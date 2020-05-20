package ditailview;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.DitailViewVo;

@Controller
public class DitailViewController {
	DitailViewDao dao;
	
	public DitailViewController(DitailViewDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/view.dv", method= {RequestMethod.GET})
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		DitailViewVo vo = null;
		int place_serial = Integer.parseInt(req.getParameter("code"));
		vo = dao.view(place_serial);
		
		mv.addObject("vo", vo);
		mv.setViewName("ditailview");
		
		return mv;
	}

}
