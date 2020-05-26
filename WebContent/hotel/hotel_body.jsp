<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<body>

<section class="banner-area relative" id="hotel_top">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 400px">
			<div class="menu-content col-lg-12">
				<div class="title text-center">
					<h1 class="text-white mb-10">호텔 메인</h1>
					<form  method="post" name="frm_ht" id="frm_ht" class="row">
	                               <div class="col-lg-4  ">
									<input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">									
									</div>
									<div class="col-lg-4  " >
									<input type="text" id="datePickInput" class="form-control  datepicker-here" data-range="true" data-position="left top" data-language="kr" data-multiple-dates-separator=" - " name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
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
<%-- 여기까지 서치바 --%>


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

