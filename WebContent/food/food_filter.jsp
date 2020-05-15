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
	    <h4 class="mb-20">음식점 타입</h4>
	    <div class="col-md-12 row nopadding">	    
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='check_cafe' id='check_cafe' value='카페'/>
		  <label class="custom-control-label" for="check_cafe">카페</label>	  
	    </div>	    
		<div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_bar' id='check_bar' value='바 & 펍'/>
		  <label class="custom-control-label" for="check_bar">바 & 펍</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-5" >
		  <input type="checkbox" class="custom-control-input" name='check_rest' id='check_rest' value='일반음식점'/>
		  <label class="custom-control-label" for="check_rest">일반음식점</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_dining' id='check_dining' value='레스토랑'/>
		  <label class="custom-control-label" for="check_dining">레스토랑</label>	    
	    </div>	    
	    </div>
	</div>
	<div class="single-element-widget">
	    <h4 class="mb-20">세계요리</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='check_kor' id='check_kor' value='한식'/>
		  <label class="custom-control-label" for="check_kor">한식</label>
	    </div>
		<div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='check_west' id='check_west' value='양식'/>
		  <label class="custom-control-label" for="check_west">양식</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='check_jap' id='check_jap' value='일식'/>
		  <label class="custom-control-label" for="check_jap">일식</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-3">
		  <input type="checkbox" class="custom-control-input" name='check_chin' id='check_chin' value='중식'/>
		  <label class="custom-control-label" for="check_chin">중식</label>
	    </div>    
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_w_etc' id='check_w_etc' value='그외요리'/>
		  <label class="custom-control-label" for="check_w_etc">그외요리</label>
	    </div>
	    </div>
	</div>
	<div class="single-element-widget">
	    <h4 class="mb-20">메뉴</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_pork' id='check_pork' value='돼지고기'/>
		  <label class="custom-control-label" for="check_pork">돼지고기</label>
	    </div>
		<div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_beef' id='check_beef' value='소고기'/>
		  <label class="custom-control-label" for="check_beef">소고기</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_salad' id='check_salad' value='샐러드'/>
		  <label class="custom-control-label" for="check_salad">샐러드</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_sea' id='check_sea' value='해산물'/>
		  <label class="custom-control-label" for="check_sea">해산물</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_noodles' id='check_noodles' value='면요리'/>
		  <label class="custom-control-label" for="check_noodles">면요리</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_m_etc' id='check_m_etc' value='그외메뉴'/>
		  <label class="custom-control-label" for="check_m_etc">그외메뉴</label>
	    </div>
	    </div>
	</div>
	<div class="single-element-widget">
	    <h4 class="mb-20">가격</h4>
	    <div class="row col-md-12 nopadding">
	    <div class="custom-control custom-checkbox col-md-12 col-5">
		  <input type="checkbox" class="custom-control-input" name='check_cheap' id='check_cheap' value='저렴한 음식'/>
		  <label class="custom-control-label" for="check_cheap">저렴한 음식</label>
	    </div>
		<div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_middle' id='check_middle' value='중간급'/>
		  <label class="custom-control-label" for="check_middle">중간급</label>
	    </div>
	    <div class="custom-control custom-checkbox col-md-12 col-4">
		  <input type="checkbox" class="custom-control-input" name='check_dinner' id='check_dinner' value='고급 정찬'/>
		  <label class="custom-control-label" for="check_dinner">고급 정찬</label>
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




	
