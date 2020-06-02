<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<form name='rent_frm' id='rent_frm' method='post'>
	<div class='row' style="padding-top: 70px;">
	<div class='col-lg-3 col-md-3 col-sm-3'></div>
	<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
	
	
	<div id='reserveResultHead'class='row'>
		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<h4>결제 및 예약이 완료되었습니다</h4>
		</div>
	</div>
	
	
	
			<div id='reserveResultTop' class='row'>
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량인수 ></div>
							<span>${placeMain } ${placeSub }</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${dateVo1.day }일 <b>${dateVo1.month }월</b> ${dateVo1.hour }<b>:${dateVo1.min }</b></span>
						</div>
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량반납 ></div>
							<span>${placeMain } ${placeSub }</span>
						</div>
						<div id='arrive_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${dateVo2.day }일 <b>${dateVo2.month }월</b> ${dateVo2.hour }<b>:${dateVo2.min }</b></span>
						</div>
					</div>
				</div>
			</div>






			<div class='row'>			
			<div id='mid_left' class='col-lg-4 col-md-4 col-sm-4 col-xs-12'>
				<h4>${vo.car_name} <span>${vo.car_kind }</span></h4>
				<img src="../images/rent/car/${vo.photo }"/>
				<div>
					<b>평가 : </b>
					<span>
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
					</span>
				</div> 
				<p><i>${vo.review }</i> <b>/ 10 </b><span> (리뷰  ${vo.review_count} 건)</span></p> 
			</div>
			<div id='mid_right' class='col-lg-8 col-md-8 col-sm-8 col-xs-12'>
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
					<h4>" 가득 채워 받고 가득 채워 반납 "</h4>
					<hr/>
					<div id='mid_left_free' class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${vo.reservation eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>예약 변경</div> 
							</c:if>
							<c:if test="${vo.my_car eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>자차보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>추가 운전자 1명포함</div> 
						</div> 
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${vo.theft eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>도난보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>렌탈에는 무제한 무료 킬로미터가 포함 됩니다</div> 
						</div> 
					</div>
			</div>
			</div>
			
			
			
			
			<div id='reserveResultBot' class='row'>
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							<div>고객님 이메일 ></div>
							<span>${email }</span>
						</div>
						
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							<div>고객님 예약번호 ></div>
							<span>${reserve_serial }</span>
						</div>
					</div>
				</div>
			</div>
			
			<h4 class='canselInfo'>※<span>예약 취소</span>는 상단의 예약 관리 페이지에서 가능합니다</h4>
			
			<div id='reserveResultPrice' class='row'>
				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<span>가격 : <b><fmt:formatNumber value="${price }" pattern="#,###"></fmt:formatNumber> 원</b></span><br/>
					<c:if test="${fullcover eq 'y' }">
					<div>풀패키지 포함</div>
					</c:if>
					<i>결제방법 : <b>${payment}</b></i>
				</div>
			</div>
			
			
		</div>
		<div class='col-lg-3 col-md-3 col-sm-3'></div>
		</div>
</form>
		