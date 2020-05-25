package adSuper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.membershipVo;
import bean.partnerVo;

@Controller
public class AdSuperController {
	AdSuperDao dao;
	
	AdSuperController(AdSuperDao dao){
		this.dao = dao;
	}
	
	ModelAndView mv;
	//회원관리조회
	@RequestMapping(value = "/admin/super/user_list.os", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView user_list(HttpServletRequest req) {
		mv = new ModelAndView();
		//System.out.println("user_list컨트롤 들어오나");
		List<membershipVo> list = dao.select();
		mv.setViewName("user_list");
		mv.addObject("list", list);
//		for(membershipVo vo : list) {
//			System.out.println(vo.getMember_id());
//			System.out.println(vo.getState());
//		}
		return mv;
		//admin/super/user_list.jsp
	}
	//회원관리수정
	@ResponseBody //메세지만전달하려면 이거 써라..
	@RequestMapping( value ="/admin/super/status_save.os", method= {RequestMethod.GET, RequestMethod.POST},produces = "text/html;charset=utf8")
	public String status_save(HttpServletRequest req, HttpServletResponse resp ) {
		membershipVo vo = new membershipVo();
		String id = req.getParameter("hidden_id"); //jsp에 있는 폼을 js에서 여기로 보낸다.. 그걸 받아서 브이오에 담아준다..
		int status =Integer.parseInt(req.getParameter("hidden_status"));
		//System.out.println("에이씨"+id+status);		
		vo.setMember_id(id);
		vo.setState(status);
		String msg=dao.status_modify(vo);
		return msg;
	}
	
	//퍄트너관리 조회
	@RequestMapping(value = "/admin/super/partner_list.os", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView partner_list(HttpServletRequest req) {
		mv = new ModelAndView();
		
		System.out.println("partner_list컨트롤 들어오나");
		
		List<partnerVo> list = dao.partner_Mselect();
		mv.setViewName("partner_list");
		mv.addObject("list", list);
//		for(partnerVo vo : list) {
//			System.out.println("파트너관리조회"+vo.getMember_id());
//			System.out.println("파트너관리조회"+vo.getState());
//		}
		return mv;
	}
	
	//승인관리-파트너가입승인 조회
	@RequestMapping(value = "/admin/super/join.os", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView join(HttpServletRequest req) {
		mv = new ModelAndView();
		//System.out.println("join컨트롤 들어오나");
		List<partnerVo> list = dao.partner_select();
		mv.setViewName("join");
		mv.addObject("list", list);
//		for(partnerVo vo : list) {
//			System.out.println(vo.getMember_id());
//			System.out.println(vo.getState());
//		}
		return mv;
	}
	//승인관리-파트너가입승인 수정(저장)
	@ResponseBody 
	@RequestMapping( value ="/admin/super/partner_save.os", method= {RequestMethod.GET, RequestMethod.POST},produces = "text/html;charset=utf8")
	public String partner_save(HttpServletRequest req, HttpServletResponse resp ) {
		partnerVo vo = new partnerVo();
		String id = req.getParameter("p_id"); //jsp에 있는 폼을 js에서 여기로 보낸다.. 그걸 받아서 브이오에 담아준다..
		int status =Integer.parseInt(req.getParameter("p_save"));
		//System.out.println("파트너컨트롤러"+id+status);		
		vo.setMember_id(id);
		vo.setState(status);
		String msg=dao.partner_modify(vo);
		return msg;
	}
	
	//파트너 view
	@RequestMapping(value = "/admin/super/partner_view.os", method= {RequestMethod.GET, RequestMethod.POST},produces = "text/html;charset=utf8")
	public ModelAndView partner_view(HttpServletRequest req) {
		String member_id = req.getParameter("member_id");
		//System.out.println("par_View_controll"+member_id);
		mv = new ModelAndView();
		//System.out.println("partner_view컨트롤 들어오나");
		partnerVo pv = dao.partner_view(member_id);
		mv.setViewName("partner_view");
		mv.addObject("pv", pv);
		return mv;
	}
	//파트너 권한박탈
	@ResponseBody 
	@RequestMapping( value ="/admin/super/partner_deprive.os", method= {RequestMethod.GET, RequestMethod.POST},produces = "text/html;charset=utf8")
	public String partner_deprive(HttpServletRequest req, HttpServletResponse resp ) {
		partnerVo vo = new partnerVo();
		String id = req.getParameter("p_viewId"); //jsp에 있는 폼을 js에서 여기로 보낸다.. 그걸 받아서 브이오에 담아준다..
		int p_status =Integer.parseInt(req.getParameter("p_status"));
		//System.out.println("권한박탈컨트롤러"+id+"~"+p_status);		
		vo.setMember_id(id);
		vo.setState(p_status);
		String msg=dao.partner_deprive(vo);
		return msg;
	}
	
	//승인관리-회원가입승인 조회
		@RequestMapping(value = "/admin/super/out.os", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView out(HttpServletRequest req) {
			mv = new ModelAndView();
//			System.out.println("회원가입승인컨트롤 들어오나");
			List<membershipVo> list = dao.m_select();
			mv.setViewName("out");
			mv.addObject("list", list);
//			for(partnerVo vo : list) {
//				System.out.println(vo.getMember_id());
//				System.out.println(vo.getState());
//			}
			return mv;
		}
		
		//승인관리-회원탈퇴승인 수정(저장)
		@ResponseBody 
		@RequestMapping( value ="/admin/super/out_save.os", method= {RequestMethod.GET, RequestMethod.POST},produces = "text/html;charset=utf8")
		public String out_save(HttpServletRequest req, HttpServletResponse resp ) {
			System.out.println("컨트롤러 아웃세잎");
			membershipVo vo = new membershipVo();
			String id = req.getParameter("out_id"); //jsp에 있는 폼을 js에서 여기로 보낸다.. 그걸 받아서 브이오에 담아준다..
			int status =Integer.parseInt(req.getParameter("out_state"));
			System.out.println("파트너컨트롤러"+id+status);		
			vo.setMember_id(id);
			vo.setState(status);
			String msg=dao.out_modify(vo);
			return msg;
		}
	
}
