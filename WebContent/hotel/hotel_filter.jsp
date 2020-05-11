<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="single-destination relative">
	<div class="thumb relative">
		<div class="overlay overlay-bg"></div>
		<img class="img-fluid" src="../images/map.png" alt="">
	</div>
	<div class="desc">
		<a class="genric-btn default radius" data-toggle="modal" href="#mapModal" ><i class="fa fa-map-marker"></i> 지도 보기</a>
		
	</div>
</div> 
<br/>
<div class="single-element-widget">
    <h4 class="mb-20">호텔 등급</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_kor' id='check_grade_five' value='five'/>
	  <label class="custom-control-label" for="check_kor">5성급</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_west' id='check_grade_four' value='four'/>
	  <label class="custom-control-label" for="check_west">4성급</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_jap' id='check_grade_three' value='three'/>
	  <label class="custom-control-label" for="check_jap">3성급</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_chin' id='check_grade_two' value='two'/>
	  <label class="custom-control-label" for="check_chin">2성급</label>
    </div>    
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_w_etc' id='check_grade_one' value='one'/>
	  <label class="custom-control-label" for="check_w_etc">1성급</label>
    </div>
</div>
<div class="single-element-widget">
    <h4 class="mb-20">객실의 종류</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_cafe' id='check_deluxe ' value='deluxe '/>
	  <label class="custom-control-label" for="check_cafe">디럭스</label>	  
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_bar' id='family' value='family'/>
	  <label class="custom-control-label" for="check_bar">패밀리</label>
    </div>
    <div class="custom-control custom-checkbox" >
	  <input type="checkbox" class="custom-control-input" name='check_rest' id='check_sweet' value='sweet'/>
	  <label class="custom-control-label" for="check_rest">스위트</label>
    </div>
     
</div>
<div class="single-element-widget">
    <h4 class="mb-20">부대 시설</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_kor' id='check_wifi' value='wifi'/>
	  <label class="custom-control-label" for="check_kor">와이파이</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_west' id='check_noSmoking' value='noSmoking'/>
	  <label class="custom-control-label" for="check_west">금연</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_jap' id='check_parking' value='parking'/>
	  <label class="custom-control-label" for="check_jap">주차장</label>
    </div>
    
</div>

<div class="single-element-widget">
    <h4 class="mb-20">뷰</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_kor' id='check_view_mt' value='view_mt'/>
	  <label class="custom-control-label" for="check_kor">마운틴뷰</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_west' id='check_view_city' value='city_view'/>
	  <label class="custom-control-label" for="check_west">시티뷰</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_jap' id='check_view_sea' value='view_sea'/>
	  <label class="custom-control-label" for="check_jap">오션뷰</label>
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




	
