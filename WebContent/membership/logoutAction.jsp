<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();// 이페이지에 접속한 회원이 세션을 뺏김
	
	Cookie[] cookies = request.getCookies();
	   if(cookies!=null){
	       for(Cookie tempCookie : cookies){
	           if(tempCookie.getName().equals("nickName")){
	               tempCookie.setMaxAge(0);
	               tempCookie.setPath("/");
	               response.addCookie(tempCookie);
	            }
	        }
	    }
%>
<script>
	location.href='/Semi_project_final0331_3/index.jsp';
</script>
</body>
</html>