<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
	<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'> 
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
				<div id='mid_left_info' class='col-lg-12 col-md-12 col-sm-12 col-xs-12' onclick='rent.importantInfo()'>렌탈에 대한 주요 정보</div> 
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
			<div class='carPriceView_info1'>${betweenDay}일 대여비:</div>
					<div class='carPriceView_info2'><fmt:formatNumber value="${vo.price }" pattern="#,###"></fmt:formatNumber> 원</div>
			<div class='carPriceView_info3'>무료취소</div>
		</div> 
