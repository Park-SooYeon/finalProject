<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name='rentTop_frm' id='rentTop_frm' method='post'>
<input type='hidden' name='member_id_t' value='${sessionScope.member_id}'/>
<nav class="navbar navbar-default navbar-fixed-top" id='topmain'>
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" id="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="javascript:void(0);" onclick="rent.goMain()" style="width:340px;">
      	<img alt="Brand" src="../images/rent/rc_logo.png" id="brand">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="overflow: visible;">
     
      
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${empty sessionScope.member_id}">
        	<li><a href="../index.jsp?inc=membership/login.jsp">로그인</a></li>
        </c:if>
        <c:if test="${sessionScope.member_id != null}">
        	<li><a href="javascript:void(0);" onclick="rent.goReserveSearch()">예약관리</a></li>
        </c:if>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>







				

</form>
<script>
rent.func()
</script>

</body>
</html>