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
    <h4 class="mb-20">축제 타입</h4>
	    <div class="custom-control custom-checkbox">
		  <input type="checkbox" class="custom-control-input" name='spring' id='spring' value='spring'/>
		  <label class="custom-control-label" for="spring">봄</label>	  
	    </div>
	    <div class="custom-control custom-checkbox">
		  <input type="checkbox" class="custom-control-input" name='summer' id='summer' value='summer'/>
		  <label class="custom-control-label" for="summer">여름</label>  
	    </div>
	    <div class="custom-control custom-checkbox">
		  <input type="checkbox" class="custom-control-input" name='autumn' id='autumn' value='autumn'/>
		  <label class="custom-control-label" for="autumn">가을</label>	  
	    </div>
	    <div class="custom-control custom-checkbox">
		  <input type="checkbox" class="custom-control-input" name='winter' id='winter' value='winter'/>
		  <label class="custom-control-label" for="winter">겨울</label>	  
	    </div>
    </div>
     
		<div class="single-element-widget">
		    <h4 class="mb-20">지역</h4>
		    <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" name='seoul' id='seoul' value='seoul'/>
			  <label class="custom-control-label" for="seoul">서울</label>
		    </div>
			<div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" name='busan' id='busan' value='busan'/>
			  <label class="custom-control-label" for="busan">부산</label>
		    </div>
		    <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" name='gyeongju' id='gyeongju' value='gyeongju'/>
			  <label class="custom-control-label" for="gyeongju">경주</label>
		    </div>
		    <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" name='gangleung' id='gangleung' value='gangleung'/>
			  <label class="custom-control-label" for="gangleung">강릉</label>
		    </div>
		    <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" name='jeju' id='jeju' value='jeju'/>
			  <label class="custom-control-label" for="jeju">제주</label>
		    </div>
		    <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" name='yeosu' id='yeosu' value='yeosu'/>
			  <label class="custom-control-label" for="yeosu">여수</label>
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




	
