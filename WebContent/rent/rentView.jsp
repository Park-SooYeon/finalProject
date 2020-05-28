<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name='rent_frm' id='rent_frm' method='post'>
	
	<input type='hidden' value='${dateVo1.year }' id='dt1'/>	
	<input type='hidden' value='${dateVo1.month }'id='dt2'/>
	<input type='hidden' value='${dateVo1.day }'id='dt3'/>
	<input type='hidden' value='${dateVo1.hour }'id='dt4'/>
	<input type='hidden' value='${dateVo1.min }'id='dt5'/>
	
	<input type='hidden' name='placeMain' value='${placeMain}'/>
	<input type='hidden' name='placeSub' value='${placeSub}'/>
	<input type='hidden' name='rentDate' value='${rentDate}'/>
	<input type='hidden' name='returnDate' value='${returnDate}'/>
	<input type='hidden' value='' name='car_serial' id='car_serial'/>
	<input type='hidden' value='${car_serial}' id='pppp1'/>
	
	<div id='rentView' style="padding-top: 110px;">
		<div class='row'>
			<div class='col-lg-2 col-md-2 col-sm-1 hidden-xs'>
			</div>
			<div id='viewMid' class='col-lg-8 col-md-8 col-sm-10 col-xs-12'>
				
				<div id='row'>
				
				
					<div id='viewLeft' class='col-lg-3 col-md-3 col-sm-3 col-xs-12'>
						<div class='tripTime'>
							<div>
								<div class='row'>
									<div id='tripTimeLeft' class='col-lg-3 col-md-3 col-sm-3 col-xs-3' >
										<img src='../images/rent/rentTime.png'/>
									</div>
									<div id='tripTimeRight' class='col-lg-9 col-md-9 col-sm-9 col-xs-9' >
										지금가격, 놓치지 마시고 바로예약하세요
									</div>
								</div>
							</div>
							<div class='tripTime0'>
								<div class='tripTime1'>여행까지 남은 시간 :</div>
								<div id='tripTime2' class='tripTime2'></div>
								<div class='tripTime3'> 일 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;시간  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;초</div>
							</div>
						</div>
						
						<div class='rentInfo' onclick='rent.importantInfo(${car_serial})'>
							<div class='row'>
									<div class='col-lg-3 col-md-3 col-sm-3 col-xs-3' >
										<img src='../images/rent/rentInfo.png'/>
									</div>
									<div class='col-lg-9 col-md-9 col-sm-9 col-xs-9' >
										고객님 렌트카에대한 주요사항
									</div>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
					<div id='viewRight' class='col-lg-9 col-md-9 col-sm-9 col-xs-12'>
					
					
						<div class='row'>
							<div id='viewRightTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
								<nav id='viewNavbar' class="navbar navbar-default">
								  <div id ='viewCon'  class="container-fluid">
								    <!-- Brand and toggle get grouped for better mobile display -->
								    <div class="navbar-header">
								    	<p id='viewNav' class="navbar-text navbar-right">
									    	<a href="javascript:void(0);" onclick="rent.carInfo(${car_serial})" class="navbar-link"><img src="../images/rent/icon_view1.png"/>&nbsp;차량정보</a>
									    	<a href="javascript:void(0);" onclick="rent.review(${car_serial})" class="navbar-link"><img src="../images/rent/icon_view2.png"/>&nbsp;고객평가</a>
									    	<a href="javascript:void(0);" onclick="rent.importantInfo(${car_serial})" class="navbar-link"><img src="../images/rent/icon_view3.png"/>&nbsp;중요안내사항</a>
								    	</p>
								    </div>
								    </div>
								    </nav>
							</div>
						</div>
						
						<div id='viewRightMid' class='row'>
								<c:set var="contentPage" value="${contentPage }"/>
								<c:if test="${contentPage==null }">
									<jsp:include page="rentViewSub1.jsp"></jsp:include>
								</c:if>
								<jsp:include page="${contentPage }"></jsp:include>
						</div>
						
						
						<div id='viewRightBot' class='row'>
							<div id='fullInfo' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
								<h3>풀커버 보호상품 ... <i>여행기간내내 마음의 평화</i></h3>
								렌터카 픽업시 렌터카 업체측에서 고객님의 신용카드로 보증금 청구를 요청할 수도 있습니다. 만약 렌터카 차량이 도난되거나 손상된 경우 해당 보증금을 잃으실 수도 있으나, 저희의 풀커버 보호상품을 구매하시면 해당 금액을 추후 환불 받으실 수 있습니다.
							</div>
							<div id='viewRightfull' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								  <div class="panel panel-default">
								    <div class="panel-heading" role="tab" id="headingOne">
								      <h4 class="panel-title">
								        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								          
								          		차량면책금
								          	
								        </a>
								      </h4>
								    </div>
								    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								      <div class="panel-body">
								       고객님의 차량에는 기본 자차 보험(면책금: ₩609,925)과 도난 보험(면책금: ₩609,925)이 제공됩니다. 차체가 파손되었거나 차량을 도난당할 경우 렌터카 업체에서 면책금 금액만큼 청구할 수 있으나, 풀커버 보호상품을 통해 이를 환불해드립니다.
								       </div>
								    </div>
								  </div>
								  <div class="panel panel-default">
								    <div class="panel-heading" role="tab" id="headingTwo">
								      <h4 class="panel-title">
								        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								        	  차창, 미러, 휠, 타이어
								        </a>
								      </h4>
								    </div>
								    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								      <div class="panel-body">
								        	일반적으로 보험 상품에는 예외 조항이 있으나, 풀커버 보험상품의 경우 휠, 차창부터 엔진과 차대에 이르기까지 차량의 외관과 부품 전반을 커버합니다.
								        	</div>
								    </div>
								  </div>
								  <div class="panel panel-default">
								    <div class="panel-heading" role="tab" id="headingThree">
								      <h4 class="panel-title">
								        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								          	관리/고장 처리 수수료
								        </a>
								      </h4>
								    </div>
								    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
								      <div class="panel-body">
								        	차량 고장이 발생하였을 경우, 혹은 열쇠를 분실하거나 차량이 문이 잠겼을 경우 발생할 수 있는 출동, 견인 수수료, 열쇠 교체 비용 등은 풀커버 보험상품을 통해 환불받으실 수 있습니다.
								        	</div>
								    </div>
								  </div>
								</div>
							</div>
							<div id='fullcheck' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
								<div class='row'>
									<div class='col-lg-4 col-md-4 col-sm-4'></div>
									<div class='col-lg-4 col-md-4 col-sm-4 col-xs-6'>
										구매안함 ▽
									</div>
									<div class='col-lg-4 col-md-4 col-sm-4 col-xs-6'>
										(하루 단돈 30,000)<br/>
										풀커버 보호상품 포함 ▼
									</div>
								</div>
							</div>
						</div>
						
						<div id='fullBtn' class='row'>
						<!-- modal btn-->
							<div class="col-lg-4 col-md-4 col-sm-4"></div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
								<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#reserveModal">
									<div>예약하러가기</div>
									<span>풀커버 보호상품 미포함</span><br/>
									<strong><fmt:formatNumber value="${vo.price }" pattern="#,###"></fmt:formatNumber> 원</strong>
								</button>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
								<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#reserveModal">
									<div>예약하러가기</div>
									<span>풀커버 보호상품 포함</span><br/>
									<strong><fmt:formatNumber value="${vo.price+(30000*betweenDay) }" pattern="#,###"></fmt:formatNumber> 원</strong>
								</button>
							</div>
						</div>
						
					</div>
					
					
				</div>
			
			</div>
			<div class='col-lg-2 col-md-2 col-sm-1 hidden-xs'>
			</div>
		</div>
		
	</div>
	
	
	
	
	<!-- Modal -->
	<div class="modal fade" id="reserveModal" tabindex="-1" role="dialog" aria-labelledby="reserveModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="reserveModalLabel">운전자 상세정보</h4>
	      </div>
	      <div class="modal-body">
	      
	        <div class="form-group">
			    <label for="exampleInputName1">이름</label>
			    <input type="text" class="form-control" id="exampleInputName1" placeholder="이름을 입력하세요">
			</div>
	       	<div class="form-group">
			    <label for="exampleInputEmail1">이메일 주소</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
			</div>
			<div class="form-group">
			    <label for="exampleInputPhone1">전화번호</label>
			    <input type="text" class="form-control" id="exampleInputPhone1" placeholder="전화번호를 - 없이 입력하세요">
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary  btn-lg" data-toggle="modal" data-target="#paymentModal">지금예약</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal2 -->
	<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="paymentModalLabel">결제하기</h4>
	      </div>
	      <div class="modal-body">
	      
	        샬라샬라
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" id='btnReserveResult' class="btn btn-primary" >지금 결제</button>
	      </div>
	    </div>
	  </div>
	</div>
	  </form>

	<script>
	rent.func();
	
	const countDownTimer = function (id, date) { 
		var _vDate = new Date(date); // 전달 받은 일자 
		var _second = 1000; 
		var _minute = _second * 60; 
		var _hour = _minute * 60; 
		var _day = _hour * 24; 
		var timer; 
		
		function showRemaining() { 
			var now = new Date(); 
			var distDt = _vDate - now; 
			
			if (distDt < 0) { 
				clearInterval(timer); 
				document.getElementById(id).textContent = '날짜 잘못선택';
				return; 
			} 
			
			var days = Math.floor(distDt / _day); 
			var hours = Math.floor((distDt % _day) / _hour); 
			var minutes = Math.floor((distDt % _hour) / _minute); 
			var seconds = Math.floor((distDt % _minute) / _second); 
			
			//document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
			document.getElementById(id).innerHTML = days + ' : ' + hours + ' : ' + minutes + ' : ' +seconds; 
		} 
		
		timer = setInterval(showRemaining, 1000);
		
	}
	
	let dt1 = $('#dt1').val();//year
	let dt2 = $('#dt2').val();//month
	let dt3 = $('#dt3').val();//day
	let dt4 = $('#dt4').val();//hour
	let dt5 = $('#dt5').val();//min
	let ampm;
	
	if(Number(dt4)>12){
		dt4 = Number(dt4)-12;
		ampm = 'pm';
	}else{
		ampm = 'am';
	}
	countDownTimer('tripTime2',dt2+'/'+dt3+'/'+dt1+' '+dt4+":"+dt5+' '+ampm); //
	

	
	
	
	
	$('#scale_kind').on('change',function(){
		$('#car_serial').val($('#pppp1').val());
		$('#rent_frm').attr('action','./carView2.rent').submit();
		
	});
	
	</script>

</body>
</html>


























