package interceptor;

import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.manager.util.SessionUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	/**
	 * 세션에 계정정보(SessionVO)가 있는지 여부로 인증 여부를 체크한다. 계정정보(SessionVO)가 없다면, 로그인 페이지로
	 * 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws ServletException {
		System.out.println("req 전 실행!");
		return true;
		// HttpSession session = request.getSession();

/*		try {
			String member_id = session.getAttribute("member_id");
			
			if (sessionVo != null && sessionVo.getSessUserID() != null) {
				return true;
			} else {
				ModelAndView modelAndView = new ModelAndView("redirect:/forward.do");
				modelAndView.addObject("msgCode", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
				modelAndView.addObject("returnUrl", "/login.jsp");
				throw new ModelAndViewDefiningException(modelAndView);
			}
		} catch (Exception e) {
			ModelAndView modelAndView = new ModelAndView("redirect:/forward.do");
			modelAndView.addObject("msgCode", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
			modelAndView.addObject("returnUrl", "/login.jsp");
			throw new ModelAndViewDefiningException(modelAndView);
		}*/
	}

	/**
	 * 세션에 메뉴권한(SessionVO)이 있는지 여부로 메뉴권한 여부를 체크한다. 계정정보(SessionVO)가 없다면, 로그인 페이지로
	 * 이동한다.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("resp 전 실행!");
		
		/*SessionVO sessionVo = null;
		String requestURI = request.getRequestURI();

		try {
			if (!requestURI.equals("/index.do")) {
				sessionVo = (SessionVO) SessionUtil.getSessionAttribute(request, "sessUser");

				if (sessionVo != null && sessionVo.getSessUserID() != null) { // 세션이 있을 경우만 체크
					HashMap<String, Object> menuAuthMap = (HashMap<String, Object>) modelAndView.getModel().get("menuAuth");
					String sessUserAuth = sessionVo.getSessUserAuth();
					String menuCode = String.valueOf(menuAuthMap.get("menuCode"));
					boolean authCheck = false;
					StringTokenizer st = new StringTokenizer(sessUserAuth, ",");

					while (st.hasMoreTokens()) {
						String authCode = st.nextToken();
						if (menuCode.equals(authCode)) {
							authCheck = true;
						}
					}

					if (!authCheck) {
						ModelAndView mav = new ModelAndView("redirect:/forward.do");
						mav.addObject("msgCode", "권한이 없습니다.");
						mav.addObject("returnUrl", "/index.jsp");
						throw new ModelAndViewDefiningException(mav);
					}
				} else { // 세션이 없으면 로그인 페이지로 이동
					ModelAndView mav = new ModelAndView("redirect:/forward.do");
					mav.addObject("msgCode", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
					mav.addObject("returnUrl", "/login.jsp");
					throw new ModelAndViewDefiningException(mav);
				}
			}
		} catch (Exception e) { // 그 외 예외사항은 index로 이동
			ModelAndView mav = new ModelAndView("redirect:/forward.do");
			mav.addObject("msgCode", "권한이 없습니다.");
			mav.addObject("returnUrl", "/index.do");
			throw new ModelAndViewDefiningException(mav);
		}*/
	}
}
