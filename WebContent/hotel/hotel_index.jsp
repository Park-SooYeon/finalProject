<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/food.css">

<body>
<header>

<!-- top -->

  <section class="banner-area relative">
	<div class="container pt-50 mb-30">
		<div class="row d-flex justify-content-center align-items-center"
			style="height: 250px">
			<div class="menu-content col-lg-8">
				<div class="title text-center">
					<h1 class="text-white mb-10">호텔(변경)</h1>
					
				</div>
			</div>
		</div>
	</div>
</section>


</header>

<div id="hotel_body">
  <div class="whole-wrap">
  <div class="container">
    <div class="section-top-border">
      <div class="row">
      
       
<div class="col-lg-3 col-md-4 mt-sm-30 element-wrap posts-list">
  <div class="col-lg-12" style="background-color:white;">


	
	<div class="single-element-widget">
	    <h4 class="mb-20">지역</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-radio col-md-12 col-4">
		  <input type="radio" class="custom-control-input" name='local_type'
		   id='check_seoul'  value='1'/>
		  <label class="custom-control-label" for="check_seoul">서울</label>
	    </div>
		<div class="custom-control custom-radio col-md-12 col-4">
		  <input type="radio" class="custom-control-input" name='local_type'
		   id="check_jeju" value='3'/>
		  <label class="custom-control-label" for="check_jeju">제주도</label>
	    </div>
	    <div class="custom-control custom-radio col-md-12 col-4">
		  <input type="radio" class="custom-control-input" name='local_type'
		   id='check_busan' value='6'/>
		  <label class="custom-control-label" for="check_busan">부산</label>
	    </div>
	    <div class="custom-control custom-radio col-md-12 col-4">
		  <input type="radio" class="custom-control-input" name='local_type' 
		  id='check_daegu'  value='4'/>
		  <label class="custom-control-label" for="check_daegu">대구</label>
	    </div>
	    <div class="custom-control custom-radio col-md-12 col-4">
		  <input type="radio" class="custom-control-input" name='local_type' 
		  id='check_gyeonggi' value='31'/>
		  <label class="custom-control-label" for="check_gyeonggi">경기도</label>
	    </div>
	    <div class="custom-control custom-radio col-md-12 col-4">
		  <input type="radio" class="custom-control-input" name='local_type' 
		  id='check_incheon'  value='2'/>
		  <label class="custom-control-label" for="check_incheon">인천</label>
	    </div>
	    </div>
	</div>
	 <hr/>
 
 
 
 <div class="single-element-widget">
    <h4 class="mb-20">부대 시설</h4>
   <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-3">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_wifi' value='wi_fi'/>
     <label class="custom-control-label" for='chk_wifi'>와이파이</label>
    </div>

    <div class="custom-control custom-checkbox col-md-12 col-3">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_parking' value='parking'/>
     <label class="custom-control-label" for='chk_parking'>주차장</label>
    </div>
       <div class="custom-control custom-checkbox col-md-12 col-3">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_meal'  value='breakfast'/>
     <label class="custom-control-label" for='chk_meal'>조식</label>
    </div>
    </div>
    </div>
    <hr/>
  
  
 
<br/>

</div>

</div>

	      
        <div class="col-lg-9 col-md-9">         
	      <div class="row">	      
	        <div class="col-lg-12">
	        
	          <div class="row">
	            <div class="col-lg-12" style="padding: 0 !important; margin: 0 !important;">
	              
  <div class="input-group-icon" style="display:flex;">
	<div class="icon"><i class="fa fa-search" aria-hidden="true"></i></div>
	<input type="text" id="filterFindStr" value="${param.findStr }" name="Search" placeholder="Search" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search'"  class="single-input">
  	<button id="filterSearch" onclick="filter.search()" class="btn btn-primary ml-3" style="width: 10%; height: 40px;" type="submit"><i class="fa fa-search"></i></button>
  </div>
<br/>
<div class="row">
<div class="col-md-6 mb-10">
  <span style="font-weight:bold" id="search_cnt"></span><span>개의 결과가 필터와 일치합니다.</span>
  <span onclick="filter.removeAll()" style="font-weight:bold; cursor:pointer;">필터옵션 전체해제</span>
</div>

</div>
<div class="button-group-area mt-10 mb-10" id="filter" style="float:left"></div>
<br/>
              
	            </div>
	          </div>
	              

<div class="col-md-12">
<form method="post" id="frm_ht" name="frm_ht">	
<c:forEach var='i' items='${searchOK}'>	
	<div class="row"  style="padding-top: 10px;margin:10px;">

		<div class="col-md-6">

			<img src="assets/images/upload/${i.sysFile}" style="height: 200px;weight:310px;"  >
		</div>
		<div class="col-md-6">
			<h3>
				${i.place_name} &nbsp;&nbsp; 
				<span class="badge badge photel">예약 가능</span>
			</h3>
			<label>${i.place_location}</label> <br>
           <p> ${i.place_tel}</p>
			<div class="tags">
				<div>
				    <c:if test="${i.wifi == '1'}">
					   <span class="badge badge-info">와이파이</span> 
					</c:if>
					
					<c:if test="${i.breakfast == '1'}">
					   <span class="badge badge-info">조식</span>
					</c:if>
					<c:if test="${i.parking == '1'}">
					   <span class="badge badge-info">주차장</span>
					</c:if>
				</div>

				<div class="clearfix" style='margin-top: 5px'>
					<ul>
						<li>
							<div class='rating' data-rate='1'>
								<!-- data-rate에 별점을입력(5초과금지) -->
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</li>
					</ul>
				</div>

<input type="text" id="place_serial" name="place_serial" value="${i.place_serial}">


   <%-- 
				<label style="font-size: 20px; padding-right: 33px;">최저가
					nnnnnn원 </label> <br> 
	--%>				
					<input type="button"
					class="genric-btn info min-width-180 pull-right " value="예약하러 가기"
					id="btnReserv" onclick="hotel.hotelDetailMove(${i.place_serial})">
			</div>
		</div>


	</div>
</c:forEach>

<c:forEach var='i' items='${searchNo}'>	
	<div class="row" style="padding-top: 10px;margin:10px;">

		<div class="col-md-6">

              
							  <img src="images/hotel/${i.place_name}1.jpg" style="height: 200px;weight:310px;" >
						

		</div>
		<div class="col-md-6">
			<h3>${i.place_name}
			&nbsp;&nbsp;<span class="badge badge-warning"
											style="font-size: 15px; margin: 2px;">제휴준비중</span>
			
			</h3>
				<label>${i.place_location}</label> <br>
           <p> ${i.place_tel}</p>

			<div class="tags">
			

				<div class="clearfix" style='margin-top: 5px'>
					<ul>
						<li>
							<div class='rating' data-rate='1'>
								<!-- data-rate에 별점을입력(5초과금지) -->
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</li>
					</ul>
				</div>





			</div>
		</div>


	</div>
</c:forEach>
</form>

</div>

<br/>

		    </div>	      	          
		  </div>
		</div>
		

      </div>
    </div>
  </div>
</div>
</div>














<!-- script -->
<script src="js/hotel_filter.js"></script>
<script src="js/hotel.js"></script>
<script src="js/food_map.js"></script>

<script>
htfilter.init(${param.local});
</script>

</body>
</html>