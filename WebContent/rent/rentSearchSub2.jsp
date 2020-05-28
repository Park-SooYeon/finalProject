<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

	<c:if test="${fn:length(car_list) > 0}">
	<c:forEach var="vo" items="${car_list }" varStatus="status">
	
	<div class='row'>
		<div id='car' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="row">
			
				<div id='carMainPhoto' class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					<img src='../images/rent/car/${vo.photo }'/>
				</div>
				<div id='carInfo'      class='col-lg-5 col-md-5 col-sm-5 col-xs-5'>
					<span>${vo.car_name} <b> ${vo.car_kind }</b></span>
					<div class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' >
							
							<img src='../images/rent/people.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 좌석수는 5개 입니다">&nbsp;&nbsp; ${vo.max_people} 인승</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/door.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 도어수는 4개 입니다">&nbsp;&nbsp; ${vo.door} 도어</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/bigbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 큰 가방 ${vo.big_bag}</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/smallbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 작은 가방 ${vo.small_bag}</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<c:if test="${vo.aircon eq 'y'.charAt(0) }">
							<img src='../images/rent/aircon.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 에어컨이 포함되어 있습니다">&nbsp;&nbsp; 에어컨 장착</span>
							</c:if>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/gear.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 자동기어 입니다">&nbsp;&nbsp; ${vo.gear} 기어</span>
						</div>
					</div>
				</div>
				
				<div id='carPrice'     class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>
					<c:if test="${not empty vo.product}">
					<div id='whatProduct' class='col-xs-5 col-xs-offset-7'>${vo.product}</div>
					</c:if>
					
					<div class='carPrice_info1'>${betweenDay}일 대여비:</div>
					<div class='carPrice_info2'><fmt:formatNumber value="${vo.price }" pattern="#,###"></fmt:formatNumber> 원</div>
					<div class='carPrice_info3'>무료취소</div>
				</div>
				
			</div>
			
		</div>
		<div id='underInfo' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class="row">
				<div id='carSubInfo1' class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					<div class="row">
						<div id='carSubInfo1_1' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							${vo.company_name} <br/>
							<a href="#">${vo.company_name} 렌탈 약관</a>
						</div>
						<div id='carSubInfo1_2' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							<span> ${vo.review} <b>/ 10</b></span> 
							<c:choose>
								<c:when test="${vo.review >= 9.0}"> 
								매우만족 <br/> 
								</c:when>
								<c:when test="${vo.review >= 8.0}"> 
								만족<br/>
								</c:when>
								<c:when test="${vo.review >= 7.0}"> 
								보통<br/>
								</c:when>
								<c:when test="${vo.review <= 7.0 and vo.review > 0.0}"> 
								보통이하<br/>
								</c:when>
								<c:when test="${vo.review == 0.0}"> 
								리뷰없음<br/>
								</c:when>
								
							</c:choose>
							
							
							
							
							<p>(리뷰 ${vo.review_count} 건)</p>
						</div>
					</div>
				</div>
				<div id='carSubInfo2' class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					<div class="row">
						<div id='carSubInfo2_1' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							<span class='info_f2' data-toggle="tooltip" data-placement="top" title="차량을 대여받을 때 연료가 가득찬 상태로 받습니다. 차량을 반납할 때는 반드시 가득찬 상태로 반납하셔야 합니다. 그렇지 않을 경우 , 추가수수료가 발생합니다">연료 정책 <br/>
							<b>가득 채워받고 가득채워 반납</b></span>
						</div>
						<div id='carSubInfo2_2' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							${vo.address}
						</div>
					</div>
				</div>
				<div id='carSubInfo3' class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					무료 혜택: <br/>
					<c:if test="${vo.reservation eq 'y'.charAt(0) }">
					&nbsp;&nbsp;&nbsp;<span class='carSubInfo_info3 info_f2' data-toggle="tooltip" data-placement="top" title="*이용약관 확인">예약취소</span>	<br/>
					</c:if>
					<c:if test="${vo.theft eq 'y'.charAt(0) }">
					&nbsp;&nbsp;&nbsp;<span class='carSubInfo_info3 info_f2' data-toggle="tooltip" data-placement="top" title="차량을 도난당했을 경우 도난 보험 부담금만 부담하시면 됩니다">도난보험</span>	<br/>
					</c:if>
					<c:if test="${vo.my_car eq 'y'.charAt(0) }">
					&nbsp;&nbsp;&nbsp;<span class='carSubInfo_info3 info_f2' data-toggle="tooltip" data-placement="top" title="차체에 손상을 입혀 수릭 필요한 경우에도, 자차 보험(CDW:Collision Damage Waiver)을 적용 받아 본인이 지불해야 하는 손상 부담금만을 지불하시면 됩니다. 본보상 정책은 차량 렌탈 이용약관을 준수한 경우에만 유효합니다. 차량의 다은부분(ex:창문,휠,내부 인테리어, 루프 혹은 하부 구조),각종 비용 및 벌금(ex:견인비, 차량 수리로 렌터카 대여가 불가능 하는 데에 따른 손해 배상금) 또는 차량 내부 액세서리(ex:유아동반 카시트,GPS,개인 소지품)에 대해서는 보장해드리지 않습니다.">자차보험</span>	<br/>
					</c:if>
				</div>
				<div id='carSubInfo4' class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					<button type="button" id='btnView' onclick="rent.carView(${vo.car_serial})" class="btn btn-primary">지금 예약</button>
				</div>
			</div>
		</div>
			
	</div>
	
	</c:forEach>
	</c:if>
	
	<c:if test="${empty car_list}">
			<div class='row'>
				<div id='company' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					현재 예약 가능한 차량이 없습니다.
				</div>	
			</div>
	</c:if>
	
	
	
	<script>
	rent.func();
	$('.info_f').tooltip()
	$('.info_f2').tooltip()
	</script>
	
