package detailview;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.DetailViewVo;
import bean.PlaceVo;

@Controller
public class DetailViewController {
	DetailViewDao dao;
	
	public DetailViewController(DetailViewDao dao) {
		this.dao = dao;		
	}
	
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

}
