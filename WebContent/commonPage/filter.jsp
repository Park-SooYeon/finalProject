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
	    <h4 class="mb-20">검색 종류</h4>
	    <div class="col-md-12 row nopadding">	    
		    <div class="custom-control custom-radio col-md-12 col-3">
			  <input type="radio" class="custom-control-input" name='trip_type' id='check_happy' value='12'/>
			  <label class="custom-control-label" for="check_happy">관광지</label>	  
		    </div>
		    <div class="custom-control custom-radio col-md-12 col-3">
			  <input type="radio" class="custom-control-input" name='trip_type' id='check_culture' value='14'/>
			  <label class="custom-control-label" for="check_culture">문화시설</label>
		    </div>    
			<div class="custom-control custom-radio col-md-12 col-4">
			  <input type="radio" class="custom-control-input" name='trip_type' id='check_food' value='39'/>
			  <label class="custom-control-label" for="check_food">음식점</label>
		    </div>
		    <div class="custom-control custom-radio col-md-12 col-5" >
			  <input type="radio" class="custom-control-input" name='trip_type' id='check_festival' value='15'/>
			  <label class="custom-control-label" for="check_festival">축제</label>
		    </div>
	    </div>
    </div>
	<hr/>
	<div class="single-element-widget" id="happy" style="display:none">
	    <h4 class="mb-20">관광지 종류</h4>
	    <div class="col-md-12 row nopadding">	    
		    <div class="custom-control custom-checkbox col-md-12 col-3">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_nat' onclick="filter.check(this)" value='A0101'/>
			  <label class="custom-control-label" for="check_nat">자연관광지</label>	  
		    </div>	    
			<div class="custom-control custom-checkbox col-md-12 col-4">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_his' onclick="filter.check(this)" value='A0201'/>
			  <label class="custom-control-label" for="check_his">역사관광지</label>
		    </div>
		    <div class="custom-control custom-checkbox col-md-12 col-5" >
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_rec' onclick="filter.check(this)" value='A0202'/>
			  <label class="custom-control-label" for="check_rec">휴양관광지</label>
		    </div>
		    <div class="custom-control custom-checkbox col-md-12 col-4">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_exp' onclick="filter.check(this)" value='A0203'/>
			  <label class="custom-control-label" for="check_exp">체험관광지</label>	    
		    </div>
		    <div class="custom-control custom-checkbox col-md-12 col-4">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_suc' onclick="filter.check(this)" value='A0205'/>
			  <label class="custom-control-label" for="check_suc">건축/조형물</label>	    
		    </div>
	    </div>
	</div>
	<div class="single-element-widget" id="food" style="display:none">
	    <h4 class="mb-20">식당 종류</h4>
	    <div class="col-md-12 row nopadding">	    
		    <div class="custom-control custom-checkbox col-md-12 col-3">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_rest' onclick="filter.check(this)" value='A05020600'/>
			  <label class="custom-control-label" for="check_rest">패밀리레스토랑</label>	  
		    </div>	    
			<div class="custom-control custom-checkbox col-md-12 col-4">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_exo' onclick="filter.check(this)" value='A05020700'/>
			  <label class="custom-control-label" for="check_exo">이색음식점</label>
		    </div>
		    <div class="custom-control custom-checkbox col-md-12 col-5" >
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_veg' onclick="filter.check(this)" value='A05020800'/>
			  <label class="custom-control-label" for="check_veg">채식전문점</label>
		    </div>
		    <div class="custom-control custom-checkbox col-md-12 col-4">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_cafe' onclick="filter.check(this)" value='A05020900'/>
			  <label class="custom-control-label" for="check_cafe">바 & 카페</label>	    
		    </div>
		    <div class="custom-control custom-checkbox col-md-12 col-4">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_club' onclick="filter.check(this)" value='A05021000'/>
			  <label class="custom-control-label" for="check_club">클럽</label>	    
		    </div>	
	    </div>
	    <br/>
	    <h4 class="mb-20">음식 종류</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_kor' onclick="filter.check(this)" value='A05020100'/>
		  <label class="custom-control-label" for="check_kor">한식</label>
	    </div>
		<div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_west' onclick="filter.check(this)" value='A05020200'/>
		  <label class="custom-control-label" for="check_west">서양식</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_jap' onclick="filter.check(this)" value='A05020300'/>
		  <label class="custom-control-label" for="check_jap">일식</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_chin' onclick="filter.check(this)" value='A05020400'/>
		  <label class="custom-control-label" for="check_chin">중식</label>
	    </div>    
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_asia' onclick="filter.check(this)" value='A05020500'/>
		  <label class="custom-control-label" for="check_asia">아시아식</label>
	    </div>
	    </div>
	</div>
	
	<div class="single-element-widget" id="festival" style="display:none">
	    <h4 class="mb-20">축제 종류</h4>
	    <div class="row col-md-12 nopadding">
		    <div class="custom-control custom-checkbox col-md-12 col-3">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_fes' onclick="filter.check(this)" value='A02070100'/>
			  <label class="custom-control-label" for="check_fes">축제</label>
		    </div>
			<div class="custom-control custom-checkbox col-md-12 col-3">
			  <input type="checkbox" class="custom-control-input" name='filter_type' id='check_event' onclick="filter.check(this)" value='A02070200'/>
			  <label class="custom-control-label" for="check_event">공연/행사</label>
		    </div>
	    </div>
	</div>
	<hr/>
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




	
