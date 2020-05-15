<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<br>
<div class="single-element-widget">
    <h4 class="mb-20">호텔 등급</h4>
    
  
    
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_grade_five' id='check_grade_five' value='five'/>
     <label class="custom-control-label" for="check_grade_five">5성급</label>
    </div>
   <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_grade_four' id='check_grade_four' value='four'/>
     <label class="custom-control-label" for="check_grade_four">4성급</label>
    </div>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_grade_three' id='check_grade_three' value='three'/>
     <label class="custom-control-label" for="check_grade_three">3성급</label>
    </div>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_grade_two' id='check_grade_two' value='two'/>
     <label class="custom-control-label" for="check_grade_two">2성급</label>
    </div>    
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_grade_one' id='check_grade_one' value='one'/>
     <label class="custom-control-label" for="check_grade_one">1성급</label>
    </div>
</div>
<div class="single-element-widget">
    <h4 class="mb-20">객실의 종류</h4>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_deluxe' id='check_deluxe' value='deluxe '/>
     <label class="custom-control-label" for="check_deluxe">디럭스</label>     
    </div>
   <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_family' id='check_family' value='family'/>
     <label class="custom-control-label" for="check_family">패밀리</label>
    </div>
    <div class="custom-control custom-checkbox" >
     <input type="checkbox" class="custom-control-input" name='check_sweet' id='check_sweet' value='sweet'/>
     <label class="custom-control-label" for="check_sweet">스위트</label>
    </div>
     
</div>
<div class="single-element-widget">
    <h4 class="mb-20">부대 시설</h4>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_wifi' id='check_wifi' value='wifi'/>
     <label class="custom-control-label" for="check_wifi">와이파이</label>
    </div>
   <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_noSmoking' id='check_noSmoking' value='noSmoking'/>
     <label class="custom-control-label" for="check_noSmoking">금연</label>
    </div>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_parking' id='check_parking' value='parking'/>
     <label class="custom-control-label" for="check_parking">주차장</label>
    </div>
       <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_meal' id='check_meal' value='meal'/>
     <label class="custom-control-label" for="check_meal">조식</label>
    </div>
    
</div>

<div class="single-element-widget">
    <h4 class="mb-20">뷰</h4>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_view_mt' id='check_view_mt' value='view_mt'/>
     <label class="custom-control-label" for="check_view_mt">마운틴뷰</label>
    </div>
   <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_view_city' id='check_view_city' value='city_view'/>
     <label class="custom-control-label" for="check_view_city">시티뷰</label>
    </div>
    <div class="custom-control custom-checkbox">
     <input type="checkbox" class="custom-control-input" name='check_view_sea' id='check_view_sea' value='view_sea'/>
     <label class="custom-control-label" for="check_view_sea">오션뷰</label>
    </div>
    <br>
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




   