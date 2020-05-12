<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
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

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSSdfada
			============================================= -->
<link rel="stylesheet" href="./template/css/linearicons.css">
<link rel="stylesheet" href="./template/css/font-awesome.min.css">
<link rel="stylesheet" href="./template/css/bootstrap.css">
<link rel="stylesheet" href="./template/css/magnific-popup.css">
<link rel="stylesheet" href="./template/css/jquery-ui.css">
<link rel="stylesheet" href="./template/css/nice-select.css">
<link rel="stylesheet" href="./template/css/animate.min.css">
<link rel="stylesheet" href="./template/css/owl.carousel.css">
<link rel="stylesheet" href="./template/css/main.css">
<link rel="stylesheet" href="./css/css_syj.css">

<script src='./lib/jquery-3.4.1.js'></script>
<script src='./js/hotel_filter.js'></script>

</head>
<body>



<!-- start banner Area -->
<section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-12">
				<div class="title text-center">
					<h1 class="text-white mb-10">호텔 상세보기</h1>
					<form  method="post" name="frm_ms" id="frm_ms" class="row" >
	                        <div class="col-lg-2  col-md-12 ">
									<input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">									
									</div>
									<div class="col-lg-3  " >
									<input type="text" class="form-control date-picker" name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
									</div>
									<div class="col-lg-3">
									<input type="text" class="form-control date-picker" name="return" placeholder="Return " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Return '">
									</div>
									<div class="col-lg-2  ">
									<input type="number" min="1" max="20" class="form-control" name="adults" placeholder="인원 " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Adults '">
									</div>
									
								
										<button class="btn btn-primary" style="width: 15%; height: 40px;"
									type="submit"><i class="fa fa-search"></i></button>
													
								</form>		
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->




<div class="whole-wrap">
  <div class="container">
    <div class="section-top-border">
      <div class="row">
      
      
        <div class="col-lg-3 col-md-4 mt-sm-30 element-wrap posts-list">
          <div class="col-lg-12" style="background-color:white;">
	        <%@include file="./hotel_filter.jsp" %>  
	      </div>     
		</div>	    
          
        <div class="col-lg-9 col-md-9">         
	      <div class="row">	      
	        <div class="col-lg-12">
	        
	          <div class="row">
	            <div class="col-lg-12" style="padding: 0 !important; margin: 0 !important;">
	              <%@include file="./hotel_search.jsp" %>
	            </div>
	          </div>	          
	          <br/>
	          
	          <div class="row" style="background-color:white;">
	            <div class="col-lg-12">
	              <div class="row">
		            <%@include file="./hotel_center.jsp" %>		              
		          </div>
		        </div>
		      </div>
		      
		    </div>	      	          
		  </div>
		</div>
		

      </div>
    </div>
  </div>
</div>

