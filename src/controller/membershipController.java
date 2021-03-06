package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import bean.membershipVo;
import bean.partnerVo;
import dao.membershipDao;

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
		session.removeAttribute("auth");
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

			membershipVo rVo = dao.loginUserInfo(member_id);

			System.out.println("닉네임 : " + rVo.getNickName());

			session.setAttribute("nickName", rVo.getNickName());
			
			System.out.println("auth : " + rVo.getState());
			
			session.setAttribute("auth", rVo.getState());
			
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
	
	// 비밀번호 체크
	@PostMapping("pwdCheck.ms")
	public String pwdCheck(String mId, String pwd, Model model) {
		System.out.println("mId : " + mId);
		System.out.println("pwd : " + pwd);
		
		membershipVo vo = new membershipVo();
		vo.setMember_id(mId);
		vo.setPwd(pwd);
		
		boolean result = dao.pwdCheck(vo);
		if(result) { // 비밀번호가 일치하면 회원 정보 수정 페이지로 이동
			
			// 회원 정보 가져오기
			vo = dao.getUserInfo(mId);
			
			model.addAttribute("UserInfo", vo);
			
			return "my_account";			
		} else { // 안 일치하면 현재페이지 유지
			return "pwd_check";
		}
	}
	
	// 회원정보 수정
	@PostMapping("changeUserInfo.ms")
	public String changeUserInfo(String mId, String pwd_check, String mName, String email) {
		System.out.println("mId : " + mId);
		System.out.println("pwd_check : " + pwd_check);
		System.out.println("mName : " + mName);
		System.out.println("email : " + email);
		
		membershipVo vo = new membershipVo();
		vo.setMember_id(mId);
		vo.setPwd(pwd_check);
		vo.setMember_name(mName);
		vo.setEmail(email);
		
		dao.changeUserInfo(vo);
		
		return "pwd_check";
	}
	
	// 회원탈퇴 요청
	@PostMapping("deleteUser.ms")
	public String deleteUser(HttpServletRequest req, String mId, String delete_reason) {
		System.out.println("mId : " + mId);
		System.out.println("content : " + delete_reason);
		
		membershipVo vo = new membershipVo();
		vo.setMember_id(mId);
		vo.setDelete_reason(delete_reason);
		
		dao.deleteUser(vo);
		
		// session에서 로그인 정보 지우기
		HttpSession session = req.getSession();
		session.setAttribute("member_id", null);
		
		return "redirect:index.jsp";
	}
	
	// 인증 메일 보내기
	@PostMapping("sendMail.ms")
	@ResponseBody
	public String sendMail(String email, HttpServletRequest req) {
		System.out.println("email : " + email);
		
		// 이메일 중복 확인
		
		// 인증번호 만들고 session에 저장하기
		String ran = dao.randomN() + new Random().nextInt(900000);
		HttpSession session = req.getSession();
		session.setAttribute("ran", ran);
		
		// 메일 보내기
		String result = dao.MailSend(email, ran);
		System.out.println(result);
		
		return result;
	}

	// 이메일 인증 번호 확인하기
	@PostMapping("chkMail.ms")
	@ResponseBody
	public String chkMail(String number, HttpServletRequest req) {
		System.out.println("number : " + number);
		String result = "";
		
		// 인증번호 가져오기
		HttpSession session = req.getSession();
		String ran = (String) session.getAttribute("ran");
		System.out.println("ran : " + ran);
		
		if(ran.equals(number)) {
			result = "yes";
			// session에서 값 제거
			session.removeAttribute("ran");
		} else {
			result = "no";
		}
		
		return result;
	}
}
