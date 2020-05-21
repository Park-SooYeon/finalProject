<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-3 col-md-4 mt-sm-30 element-wrap posts-list">
  <div class="col-lg-12" style="background-color:white;">

	<div class="single-destination relative row col-lg-12 col-6 nopadding center-block">
		<div class="thumb relative">
			<div class="overlay overlay-bg"></div>
			<img class="img-fluid" src="images/food/map.png" alt="">
		</div>
		<div class="desc">
			<a class="genric-btn default radius" data-toggle="modal" href="#mapModal" ><i class="fa fa-map-marker"></i> 지도 보기</a>
			
		</div>
	</div> 
	<br/>
	<div class="single-element-widget">
	    <h4 class="mb-20">지역</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_type' id='check_seoul' onclick="filter.check(this)" value='돼지고기'/>
		  <label class="custom-control-label" for="check_seoul">서울</label>
	    </div>
		<div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_type' id='check_jeju' onclick="filter.check(this)" value='소고기'/>
		  <label class="custom-control-label" for="check_jeju">제주도</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_type' id='check_busan' onclick="filter.check(this)" value='샐러드'/>
		  <label class="custom-control-label" for="check_busan">부산</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_type' id='check_daegu' onclick="filter.check(this)" value='해산물'/>
		  <label class="custom-control-label" for="check_daegu">대구</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_type' id='check_gyeonggi' onclick="filter.check(this)" value='면요리'/>
		  <label class="custom-control-label" for="check_gyeonggi">경기도</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_type' id='check_incheon' onclick="filter.check(this)" value='그외메뉴'/>
		  <label class="custom-control-label" for="check_incheon">인천</label>
	    </div>
	    </div>
	</div>
  </div>   
</div>
	
	<!-- Modal -->
	  <div class="modal fade" id="mapModal">
	    <div class="modal-dialog modal-lg">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>          
	        </div>
	        <div class="modal-body">
	          <div class="cal-lg-12" id="food_map" style="height:400px;"></div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>




	
