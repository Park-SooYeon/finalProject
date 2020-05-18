<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





</head>
<body>
<div id="rentSearch" style="padding-top: 70px;">
	<div class="row">
		<div id='left' class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		<div id='map' class="col-lg-12 col-md-12 col-sm-12 hidden-xs"></div>
			<div class="row">
				<div id='fillter' class="col-lg-4 col-md-5 col-sm-6 col-xs-4 col-lg-offset-8 col-md-offset-7 col-sm-offset-6 col-xs-offset-8">
					<button type="button" id='btnFillter' class="btn btn-primary">필터 & 검색</button>
				</div>
				<div id='hiddenFillterBack' class="col-lg-8 col-md-9 col-sm-10 hidden-xs col-lg-offset-4 col-md-offset-3 col-sm-offset-2"></div>
				<div id='hiddenFillter' class="col-lg-8 col-md-9 col-sm-10  col-xs-10 col-lg-offset-4 col-md-offset-3 col-sm-offset-2 col-xs-offset-1">
					
					<button type="button" id='btnHiddenFillter' class="btn btn-primary">X 필터 & 검색 닫기 </button>
					
					<div id='placeFillter' class="col-lg-12 col-md-12 col-sm-12">
						<h5>차량 검색</h5>
						<hr/>
						<label>> 차량 인수</label>
						<div class="form-group">
							<label>안양시</label>
							<input type="text" id='search_rent' class="form-control datepicker-here" data-timepicker="true" data-time-format='hh:ii aa' placeholder="2014/3/20 10:00">
						</div>
						<hr/>
						<label>> 차량 반납</label>
						<div class="form-group">
							<label>안양시</label>
							<input type="text" id='search_return' class="form-control datepicker-here" data-timepicker="true" data-time-format='hh:ii aa' placeholder="2014/3/20 10:00">
						</div>
						<button type="button" id='btnSearch' class="btn btn-primary">검색</button>
					</div>
					
					<div id='helpFillter' class="col-lg-12 col-md-12 col-sm-12">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="heading1">
						      <h4 class="panel-title">
						        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
						         	 도움말 콜센터
						        </a>
						      </h4>
						    </div>
						    <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1">
						      <div class="list-group">
						       		02 2023 6423
						      </div>
						    </div>
						  </div>
					 	</div>
					 </div>
					 
					 <div id='companyFillter' class="col-lg-12 col-md-12 col-sm-12">
					 	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="heading2">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true" aria-controls="collapse2">
					          	현지 렌터카 업체
					        </a>
					      </h4>
					    </div>
					    <div id="collapse2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading2">
					      <div class="list-group">
					          	<label><input type="checkbox">&nbsp;&nbsp;주식회사IC</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;주식회사AC</label><br/>
					      </div>
					    </div>
					  </div>
					 </div>
					 </div>
					 
					 <div id='reviewFillter' class="col-lg-12 col-md-12 col-sm-12">
					 	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="heading3">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="true" aria-controls="collapse3">
					          	공급업체 평점
					        </a>
					      </h4>
					    </div>
					    <div id="collapse3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading3">
					      <div class="list-group">
					          	<label><input type="checkbox">&nbsp;&nbsp;훌륭함:8+</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;만족함:7+</label><br/>
					      </div>
					    </div>
					  </div>
					 </div>
					 </div>
					 
					 <div id='fuelFillter' class="col-lg-12 col-md-12 col-sm-12">
					 	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="heading4">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
					          	연료정책
					        </a>
					      </h4>
					    </div>
					    <div id="collapse4" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading4">
					      <div class="list-group">
					          	<label><input type="checkbox">&nbsp;&nbsp;가득 채워 받고 가득 채워 반납</label><br/>
					      </div>
					    </div>
					  </div>
					 </div>
					 </div>
					 
					 <div id='specFillter' class="col-lg-12 col-md-12 col-sm-12">
					 	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="heading5">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
					          	차량 제원
					        </a>
					      </h4>
					    </div>
					    <div id="collapse5" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading5">
					      <div class="list-group">
					          	<label><input type="checkbox">&nbsp;&nbsp;에어컨장착</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;자동기어</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;4도어 이상</label><br/>
					      </div>
					    </div>
					  </div>
					 </div>
					 </div>
					 
					 <div id='peopleFillter' class="col-lg-12 col-md-12 col-sm-12">
					 	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="heading6">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="true" aria-controls="collapse6">
					          	탑승 인원수
					        </a>
					      </h4>
					    </div>
					    <div id="collapse6" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading6">
					      <div class="list-group">
					          	<label><input type="checkbox">&nbsp;&nbsp;1명 혹은 2명</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;작은그룹</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;큰 그룹</label><br/>
					      </div>
					    </div>
					  </div>
					 </div>
					 </div>
					 
					 <div id='priceFillter' class="col-lg-12 col-md-12 col-sm-12">
					 	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="heading7">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapse7" aria-expanded="true" aria-controls="collapse7">
					          	본인 부담금
					        </a>
					      </h4>
					    </div>
					    <div id="collapse7" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading7">
					      <div class="list-group">
					          	<label><input type="checkbox">&nbsp;&nbsp;50만원 또는 이하</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;30만원 또는 이하</label><br/>
					          	<label><input type="checkbox">&nbsp;&nbsp;10만원 또는 이하</label><br/>
					      </div>
					    </div>
					  </div>
					 </div>
					 </div>
					 
					  
					
					
				</div>
			</div>
			
			
		
		</div>
		<div id='right' class='col-lg-8 col-md-8 col-sm-8 col-xs-12'>
		
			<div class='row'>
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량인수 ></div>
							<span>경기도 전지역</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> 14 <b>목</b> 10<b>:00</b></span>
						</div>
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량반납 ></div>
							<span>경기도 전지역</span>
						</div>
						<div id='arrive_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> 15 <b>금</b> 15<b>:00</b></span>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class ='row'>
				<div id='carPhoto' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<div class ='row'>
						<div id='carPhoto_1' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>소형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car1.png"/>
								</div>
								
						</div>
						<div id='carPhoto_2' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>중형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car2.png"/>
								</div>
								
						</div>
						<div id='carPhoto_3' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>대형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car3.png"/>
								</div>
								
						</div>
						<div id='carPhoto_4' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>프리미엄 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car4.png"/>
								</div>
								
						</div>
						<div id='carPhoto_5' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>미니벤</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car5.png"/>
								</div>
								
						</div>
						<div id='carPhoto_6' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>SUV</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car6.png"/>
								</div>
								
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			<div id='SerachResult'>
				<%@include file="rentSearchSub1.jsp" %>
			</div>
			
			
			
			
		</div>
	</div>
</div>

<script>

		rent.func()

		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
	  $('input').iCheck({
	    checkboxClass: 'icheckbox_square-blue',
	    radioClass: 'iradio_square-blue',
	    increaseArea: '20%' // optional
	  });
	

	if($('#btnFillter')!=null){
		$('#btnFillter').click(function(){
			$('#fillter').css("display","none");
			$('#hiddenFillter').css("display","inline-block");
			$('#hiddenFillterBack').css("display","inline-block");
			$('#right').css('height',$('#hiddenFillter').height());
			$('#hiddenFillterBack').css('height',$('#hiddenFillter').height());
		});
	}
	if($('#btnHiddenFillter')!=null){
		$('#btnHiddenFillter').click(function(){
			$('#hiddenFillter').css("display","none");
			$('#hiddenFillterBack').css("display","none");
			$('#fillter').css("display","inline-block");
			$('#right').css('height','auto');
		});
	}
	
	/*------Air datepicker-----*/
	// Create start date
    var start = new Date(),
        prevDay,
        startHours = 9;

    // 09:00 AM
    start.setHours(9);
    start.setMinutes(0);

    // If today is Saturday or Sunday set 10:00 AM
    if ([6, 0].indexOf(start.getDay()) != -1) {
        start.setHours(10);
        startHours = 10
    }

    $('#search_rent ,#search_return').datepicker({
        timepicker: true,
        language: 'en',
        startDate: start,
        minHours: startHours,
        maxHours: 18,
        onSelect: function (fd, d, picker) {
            // Do nothing if selection was cleared
            if (!d) return;

            var day = d.getDay();

            // Trigger only if date is changed
            if (prevDay != undefined && prevDay == day) return;
            prevDay = day;

            // If chosen day is Saturday or Sunday when set
            // hour value for weekends, else restore defaults
            if (day == 6 || day == 0) {
                picker.update({
                    minHours: 10,
                    maxHours: 16
                })
            } else {
                picker.update({
                    minHours: 9,
                    maxHours: 18
                })
            }
        }
    });
    
    
	
	
	
	
	
	
	
	
</script>
	
</body>
</html>