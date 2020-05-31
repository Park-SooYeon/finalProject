<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-3 col-md-4 mt-sm-30 element-wrap posts-list">
  <div class="col-lg-12" style="background-color:white;">

<br/>
	<div class="single-element-widget">
	    <h4 class="mb-20">지역</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='local_type' id='check_seoul' onclick="filter.check(this)" value='1'/>
		  <label class="custom-control-label" for="check_seoul">서울</label>
	    </div>
		<div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='local_type' id='check_jeju' onclick="filter.check(this)" value='39'/>
		  <label class="custom-control-label" for="check_jeju">제주도</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='local_type' id='check_busan' onclick="filter.check(this)" value='6'/>
		  <label class="custom-control-label" for="check_busan">부산</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='local_type' id='check_daegu' onclick="filter.check(this)" value='4'/>
		  <label class="custom-control-label" for="check_daegu">대구</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='local_type' id='check_gyeonggi' onclick="filter.check(this)" value='31'/>
		  <label class="custom-control-label" for="check_gyeonggi">경기도</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='local_type' id='check_incheon' onclick="filter.check(this)" value='2'/>
		  <label class="custom-control-label" for="check_incheon">인천</label>
	    </div>
	    </div>
	</div>
	
<div class="single-element-widget">
    <h4 class="mb-20">부대 시설</h4>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_wifi' value='1'/>
     <label class="custom-control-label" for='chk_wifi'>와이파이</label>
    </div>
   <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_noSmoking' value='1'/>
     <label class="custom-control-label" for='chk_noSmoking' >금연</label>
    </div>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_parking' value='1'/>
     <label class="custom-control-label" for='chk_parking'>주차장</label>
    </div>
       <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='filter_type' id='chk_meal' value='1'/>
     <label class="custom-control-label" for='chk_meal'>조식</label>
    </div>
    
</div>



</div>
</div>


   