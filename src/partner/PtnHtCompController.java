package partner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.PlaceVo;


@Controller
public class PtnHtCompController {
	
	PtnHtCompDao dao;
	
	public PtnHtCompController(PtnHtCompDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/dashboard.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView dashboard(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("dashboard");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_list.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		List<PlaceVo> list = dao.select();
		
		mv.addObject("list", list);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_add.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		PlaceVo vo = null; 
		
		System.out.println("controller");
		//mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_add");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/insertR.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insertR(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView();
		int result = 1;
		
		
		
		String member_id = req.getParameter("member_id");
		System.out.println("mId : " + member_id);
		
		
		System.out.println("insertR controller");
		FileUpload upload = new FileUpload(req, resp);
		HttpServletRequest newReq = upload.uploading(); //  encType이 없는 req
		
		PlaceVo vo = (PlaceVo) newReq.getAttribute("vo");
		List<AttVo> attList = (List<AttVo>) newReq.getAttribute("attList");
		
		if(req.getParameter("latitude") == null) {
			vo.setLatitude(0);
		}else {
			vo.setLatitude(Integer.parseInt(req.getParameter("latitude")));
		}
		
		if(req.getParameter("longitude") == null) {
			vo.setLongitude(0);
		}else {
			vo.setLongitude(Integer.parseInt(req.getParameter("longitude")));
		}
		
		vo.setGrade(0);
		
		System.out.println("vo getBreakfast : " + vo.getBreakfast());
		System.out.println("vo getLatitude : " + vo.getLatitude());
		System.out.println("vo getPlace_location : " + vo.getPlace_location());
		System.out.println("vo getLocal_code : " + vo.getLocal_code());
		System.out.println("vo getLocal_code : " + vo.getPartner_serial());
		System.out.println("vo getPlace_name : " + vo.getPlace_name());
		System.out.println("vo getPartner_serial : " + vo.getPartner_serial());
		System.out.println("vo getPlace_tel : " + vo.getPlace_tel());
		
		
		
		result = dao.insert(member_id, vo, attList);
		
		System.out.println("result : " + result);
		
		mv.addObject("vo", vo);
		mv.addObject("result", result);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_modify.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_delete.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	
}
