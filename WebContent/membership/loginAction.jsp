<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%
	String mId = null;
	if(session.getAttribute("member") != null){
		mId = (String)session.getAttribute("member");
	}
	
	if(mId != null){
		out.print("<script>");
		out.print("swal('Good job!', '이미 로그인 되어있습니다!', 'warning');");
		out.print("location.href = './index.jsp'");
		out.print("</script>");
	}
	
	int result =(int)request.getAttribute("result");
	
	if(result == 1){ // 로그인 성공
		session.setAttribute("member", request.getParameter("mId"));
		session.setAttribute("nickName", request.getAttribute("nickName"));
		
		if(request.getParameter("remember") != null ){
			Cookie cookie = new Cookie("nickName", (String)request.getAttribute("nickName"));
            cookie.setMaxAge(60);
            cookie.setPath("/");
            response.addCookie(cookie);
			
		}
		out.print("<script>");
		out.print("location.href = \'index.jsp?loginMessage=" + 1 + "\'" );
		out.print("</script>");

	}else if(result==2){
		session.setAttribute("member", request.getAttribute("mId"));
		session.setAttribute("nickName", request.getAttribute("nickName"));
		//
		System.out.println("// loginAction.jsp");
		System.out.println("mId : "+ request.getAttribute("mId"));
		System.out.println("nickName : " + request.getAttribute("nickName"));
		System.out.println("------------------------");
		//
		if(request.getParameter("remember") != null ){
			Cookie cookie = new Cookie("nickName", (String)request.getAttribute("nickName"));
            cookie.setMaxAge(60);
            cookie.setPath("/");
            response.addCookie(cookie);
			
		}
		out.print("<script>");
		out.print("location.href = \'../index.jsp?loginMessage=" + 1 + "\'" );
		out.print("</script>");
	
	}else if(result == 0){
		out.print("<script>");
		//out.print("swal('Good job!', '비밀번호가 틀립니다!', 'warning');");
		out.print("location.href = './index.jsp?ff=1'" );
		//out.print("history.back()"); // 이전 페이지로 돌림
		out.print("</script>");
	}
	else if(result == -1){
		out.print("<script>");
		//out.print("swal('Good job!', '아이디가 존재하지 않습니다!', 'warning');");
		//out.print("history.back()"); // 이전 페이지로 돌림
		out.print("location.href = './index.jsp?ff=2'" );
		out.print("</script>");
	}else if(result == -2){
		out.print("<script>");
		out.print("swal('Good job!', '데이터베이스 오류!', 'warning');");
		out.print("history.back()"); // 이전 페이지로 돌림
		out.print("</script>");
	}
%>
	
</body>
</html>