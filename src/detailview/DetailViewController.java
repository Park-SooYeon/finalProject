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
	/*@RequestMapping(value = "report.dv", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView report(HttpServletRequest req,
							   @RequestParam(value = "report_code[]") List<String> report_code, 
							   @RequestParam(value="report_content") String report_content) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession();
		String report_id = (String)session.getAttribute("member_id");
		
		
		
		mv.addObject("report_id", report_id);
		mv.addObject("report_code", report_code);
		mv.addObject("report_content", report_content);
		mv.setViewName("report");
		
		return mv;
	}*/

}
