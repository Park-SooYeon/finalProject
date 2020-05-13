<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- change -->
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="./template/img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Travel</title>

			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="./css/custom.css">
			
<title>Insert title here</title>
</head>

		<body>	
			  <%
	String list = "trip_list.jsp";
	if(request.getParameter("list")!=null){
		list = request.getParameter("list");
	}	
%>
			  <section class="about-banner relative">
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								My Trip				
							</h1>	
							<p class="text-white link-nav text-center"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href="hotels.html"> My Trips</a></p>
						</div>	
					</div>
				</div>
			</section>
			<div class="container">
		            <div class="row d-flex justify-content-center">
		                <div class="button-container p-40 col-lg-8 text-center">
		                    <button class="btn dropdown-toggle" data-toggle="dropdown">여행 리스트</button>
		                    
		                    <div class="dropdown-menu">
		                    	<button class="dropdown-item" onclick="location.href='./?inc=mypage/my_list.jsp&list=trip_list.jsp'">모든 여행</button>
        						<button class="dropdown-item">여행 (비공개)</button>
        						<button class="dropdown-item">여행 (공개)</button>
      						</div>
		                    
		                    <button class="btn" onclick="location.href='./?inc=mypage/my_list.jsp?list=like_list.jsp'"><i class="fa fa-heart"></i> 관심 리스트</button>
		                    <button class="btn add-new-trip" data-toggle="modal" data-target="#newTripModal" style="display:none;" id="addTripBtn">여행 추가</button>
		                </div>
		            </div>
			  <jsp:include page='<%=list %>'/>
			</div>

</body>
</html>