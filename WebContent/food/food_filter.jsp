<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="single-destination relative">
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
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_cafe' id='check_cafe' value='Cafe'/>
	  <label class="custom-control-label" for="check_cafe">카페</label>	  
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_bar' id='check_bar' value='bar'/>
	  <label class="custom-control-label" for="check_bar">바 & 펍</label>
    </div>
    <div class="custom-control custom-checkbox" >
	  <input type="checkbox" class="custom-control-input" name='check_rest' id='check_rest' value='rest'/>
	  <label class="custom-control-label" for="check_rest">일반음식점</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_dining' id='check_dining' value='dining'/>
	  <label class="custom-control-label" for="check_dining">레스토랑</label>
    </div>    
</div>
<div class="single-element-widget">
    <h4 class="mb-20">세계요리</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_kor' id='check_kor' value='kor'/>
	  <label class="custom-control-label" for="check_kor">한식</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_west' id='check_west' value='west'/>
	  <label class="custom-control-label" for="check_west">양식</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_jap' id='check_jap' value='jap'/>
	  <label class="custom-control-label" for="check_jap">일식</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_chin' id='check_chin' value='chin'/>
	  <label class="custom-control-label" for="check_chin">중식</label>
    </div>    
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_w_etc' id='check_w_etc' value='w_etc'/>
	  <label class="custom-control-label" for="check_w_etc">그외</label>
    </div>
</div>
<div class="single-element-widget">
    <h4 class="mb-20">메뉴</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_pork' id='check_pork' value='pork'/>
	  <label class="custom-control-label" for="check_pork">돼지고기</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_beef' id='check_beef' value='beef'/>
	  <label class="custom-control-label" for="check_beef">소고기</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_salad' id='check_salad' value='salad'/>
	  <label class="custom-control-label" for="check_salad">샐러드</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_sea' id='check_sea' value='sea'/>
	  <label class="custom-control-label" for="check_sea">해산물</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_noodles' id='check_noodles' value='noodles'/>
	  <label class="custom-control-label" for="check_noodles">면요리</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_m_etc' id='check_m_etc' value='m_etc'/>
	  <label class="custom-control-label" for="check_m_etc">그외</label>
    </div>
</div>
<div class="single-element-widget">
    <h4 class="mb-20">가격</h4>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_cheap' id='check_cheap' value='cheap'/>
	  <label class="custom-control-label" for="check_cheap">저렴한 음식</label>
    </div>
	<div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_middle' id='check_middle' value='middle'/>
	  <label class="custom-control-label" for="check_middle">중간급</label>
    </div>
    <div class="custom-control custom-checkbox">
	  <input type="checkbox" class="custom-control-input" name='check_dinner' id='check_dinner' value='dinner'/>
	  <label class="custom-control-label" for="check_dinner">고급 정찬</label>
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




	
