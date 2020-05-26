package membership;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import bean.membershipVo;
import bean.partnerVo;

@Controller
public class membershipController {

	membershipDao dao;
	ModelAndView mv;

	public membershipController(membershipDao dao) {
		this.dao = dao;

	}

	@RequestMapping(value = "memberJoin.ms", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberJoin(HttpServletRequest req) {
		mv = new ModelAndView();

		String msg = "";

		membershipVo vo = new membershipVo();

		String member_id = req.getParameter("member_id");
		String pwd = req.getParameter("pwd");
		String member_name = req.getParameter("member_name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String nickName = dao.defaultNickName();

		vo.setMember_id(member_id);
		System.out.println("member_id은 무엇이얌? " + vo.getMember_id());
		vo.setPwd(pwd);
		vo.setMember_name(member_name);
		vo.setPhone(phone);
		vo.setEmail(email);
		System.out.println("email :  " + vo.getEmail());
		vo.setNickName(nickName);

		int result = dao.memberJoin(vo);

		if (result == 2) {

			HttpSession session = req.getSession();
			session.setAttribute("member_id", member_id);

			System.out.println("닉네임 : " + vo.getNickName());

			session.setAttribute("nickName", vo.getNickName());

			msg = "회원가입이 완료되었습니다!";

			mv.addObject("msg", msg);
			mv.setViewName("GoIndex");

		} else {

			msg = "회원가입 중 오류가 발생했습니다!";
			mv.addObject("msg", msg);

		}

		return mv;
	}

	@RequestMapping(value = "partnerHotelJoin.ms", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView partnerHotelJoin(HttpServletRequest req, HttpServletResponse resp) {
		mv = new ModelAndView();
		System.out.println("파트너 호텔 등록 진 입!!!!!");

		String member_id = req.getParameter("mId");
		System.out.println(req.getParameter("mId"));
		System.out.println(req.getParameter("pNumber"));

		int business_number = Integer.parseInt(req.getParameter("pNumber"));

		String partner_name = req.getParameter("pName");
		String partner_phone = req.getParameter("pPhone");
		String partner_location = req.getParameter("add1") + req.getParameter("add2") + req.getParameter("add3")
				+ req.getParameter("add4");

		System.out.println(member_id + business_number + partner_name + partner_phone + partner_location);

		partnerVo vo = new partnerVo();

		vo.setMember_id(member_id);
		vo.setBusiness_number(business_number);
		vo.setPartner_name(partner_name);
		vo.setPartner_phone(partner_phone);
		vo.setPartner_location(partner_location);

		int result = dao.partnerHotelJoin(vo);

		if (result == 2) {
			PrintWriter out;
			try {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");

				out = resp.getWriter();
				out.println("<script>alert('파트너 가입 신청이 완료되었습니다');</script>");
				mv.setViewName("GoIndex");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			String msg = "회원가입 중 오류가 발생했습니다!";
			mv.addObject("msg", msg);
			mv.setViewName("?inc=partnerJoin");

		}

		return mv;

	}

	@RequestMapping(value = "partnerRentJoin.ms", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView partnerRentJoin(HttpServletRequest req, HttpServletResponse resp) {
		mv = new ModelAndView();
		System.out.println("파트너 등록 렌트진 입!!!!!");

		String member_id = req.getParameter("mId");
		System.out.println(req.getParameter("mId"));
		System.out.println(req.getParameter("pNumber"));

		int business_number = Integer.parseInt(req.getParameter("pNumber"));

		String partner_name = req.getParameter("pName");
		String partner_phone = req.getParameter("pPhone");
		String partner_location = req.getParameter("add1") + req.getParameter("add2") + req.getParameter("add3")
				+ req.getParameter("add4");

		System.out.println(member_id + business_number + partner_name + partner_phone + partner_location);

		partnerVo vo = new partnerVo();

		vo.setMember_id(member_id);
		vo.setBusiness_number(business_number);
		vo.setPartner_name(partner_name);
		vo.setPartner_phone(partner_phone);
		vo.setPartner_location(partner_location);

		int result = dao.partnerRentJoin(vo);

		if (result == 2) {

			PrintWriter out;
			try {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");

				out = resp.getWriter();
				out.println("<script>alert('파트너 가입 신청이 완료되었습니다');</script>");
				mv.setViewName("GoIndex");
				out.flush();

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			String msg = "회원가입 중 오류가 발생했습니다!";
			mv.addObject("msg", msg);
			mv.setViewName("?inc=partnerJoin");

		}

		return mv;

	}

	@ResponseBody
	@RequestMapping(value = "idCheck.ms", method = { RequestMethod.POST })
	public String idCheck(HttpServletRequest req) {

		String member_id = req.getParameter("member_id");
		System.out.println("아이디 췤");

		String str = "";

		int result = dao.idCheck(member_id);

		if (result == 1) {
			str = "no";
		} else {
			str = "yes";

		}

		return str;
	}

	@RequestMapping(value = "logout.ms", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(HttpServletRequest req) {
		mv = new ModelAndView();

		HttpSession session = req.getSession();
		session.removeAttribute("member_id");
		session.removeAttribute("nickName");

		return mv;
	}

	@RequestMapping(value = "login.ms", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(HttpServletRequest req) {

		System.out.println("로그인 액션!");

		mv = new ModelAndView();

		membershipVo vo = new membershipVo();

		String member_id = req.getParameter("mId");
		String pwd = req.getParameter("pwd");

		vo.setMember_id(member_id);
		vo.setPwd(pwd);

		System.out.println(vo.getMember_id());
		System.out.println(vo.getPwd());

		int loginResult = dao.login(vo);

		System.out.println("로그인 결과  : " + loginResult);
		if (loginResult == -1) {

			mv.addObject("msg", "noId");

		} else if (loginResult == 0) {

			HttpSession session = req.getSession();
			session.setAttribute("member_id", member_id);

			System.out.println(member_id);

			String nickName = dao.loginNickName(member_id);

			vo.setNickName(nickName);
			System.out.println("닉네임 : " + vo.getNickName());

			session.setAttribute("nickName", vo.getNickName());

			mv.setViewName("GoIndex");

		} else {

			mv.addObject("msg", "noPwd");
		}

		return mv;
	}

	@RequestMapping(value = "findPwd.ms", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPwd(HttpServletRequest req) {
		mv = new ModelAndView();

		System.out.println("d여기야여기");

		mv.setViewName("findPwd");
		return mv;
	}

}
