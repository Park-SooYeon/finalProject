<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		   id='check_jeju'  value='3'/>
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
	              

<div class="col-md-12" style="padding-top: 10px;">
	
<c:forEach var='i' items='${searchMainList}'>	
	<div class="row">

		<div class="col-md-6">

			<img src="template/img/packages/d4.jpg" alt="">
		</div>
		<div class="col-md-6">
			<h3>
				${i.place_name} &nbsp;&nbsp; <span class="badge badge photel">예약
					가능</span>
			</h3>
			<label>위치</label> <br>

			<div class="tags">
				<div>
					<span class="badge badge-info">와이파이</span> <span
						class="badge badge-info">조식</span>
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





				<label style="font-size: 20px; padding-right: 33px;">최저가
					nnnnnn원 </label> <br> <input type="button"
					class="genric-btn info min-width-180 pull-right  " value="예약하러 가기"
					id="btnReserv" onclick="hotelDetailMove()">
			</div>
		</div>


	</div>
</c:forEach>
</div>

<br>

		    </div>	      	          
		  </div>
		</div>
		

      </div>
    </div>
  </div>
</div>