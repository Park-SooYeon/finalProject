<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String inc = "dashboard.jsp";
	if(request.getParameter("inc")!=null){
		inc = request.getParameter("inc");
	}	
%>
	<%@include file="../partials/header.jsp" %>
	
	<div class="content-wrapper">
	    <jsp:include page="<%=inc %>"></jsp:include>
	</div>
	
	<!-- content-wrapper ends -->
	
	<!-- partial:partials/_footer.html -->
	<%@include file="../partials/footer.jsp" %>

	