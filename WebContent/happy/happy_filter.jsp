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
    <h4 class="mb-20">관광지 타입</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_cafe' id='check_cafe' value='Cafe'/>
	  <label class="custom-control-label" for="check_cafe">랜드마크</label>	  
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_bar' id='check_bar' value='bar'/>
	  <label class="custom-control-label" for="check_bar">박물관&미술관</label>
    </div>
    <div class="custom-control custom-checkbox" >
	  <input type="checkbox" class="custom-control-input" name='check_rest' id='check_rest' value='rest'/>
	  <label class="custom-control-label" for="check_rest">자연공원&수목원&산</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_dining' id='check_dining' value='dining'/>
	  <label class="custom-control-label" for="check_dining">테마파크</label>
    </div>    
</div>
<div class="single-element-widget">
    <h4 class="mb-20">지역</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_kor' id='check_kor' value='kor'/>
	  <label class="custom-control-label" for="check_kor">중구</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_west' id='check_west' value='west'/>
	  <label class="custom-control-label" for="check_west">종로구</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_jap' id='check_jap' value='jap'/>
	  <label class="custom-control-label" for="check_jap">동대문구</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_chin' id='check_chin' value='chin'/>
	  <label class="custom-control-label" for="check_chin">용산구</label>
    </div>    
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_w_etc' id='check_w_etc' value='w_etc'/>
	  <label class="custom-control-label" for="check_w_etc">그외</label>
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




	
