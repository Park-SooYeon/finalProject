<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<form name='rent_frm' id='rent_frm' method='post'>
<input type='hidden' name='member_id' value='${sessionScope.member_id}'/>
<input type='hidden' name='reserve_serial' id='reserve_serial'/>
<input type='hidden' name='car_serial' id='car_serial'/>

<div class='row' style="padding-top: 70px;">
	<div class='col-lg-3 col-md-3 col-sm-3'></div>
	<div class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
	
	<c:if test="${msg != null }">
		<h4 style='color:#2b96ed; font-size: 1.7em;text-align: center; font-weight: bold;margin-top: 50px;box-sizing: border-box; box-shadow: 1px 1px 5px 1px #aaa;padding: 10px;border-radius: 5px 5px 5px 5px'> ${msg } </h4>
	</c:if>
	
	<div id='reserveResultHead'class='row' >
		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<h4>현재 예약된 차량</h4>
		</div>
	</div>
	
<c:if test="${fn:length(reserve_list1) > 0}">
<c:set var="list2" value="${param_list1}"></c:set>
<c:forEach var="list1" items="${reserve_list1 }" varStatus="status">
	<div style="border: 1px dashed #aaa;border-radius: 10px 10px 10px 10px;margin-bottom: 20px; padding: 15px;box-sizing: border-box;box-shadow: 1px 1px 5px 1px #ddd;">
			<div id='reserveResultTop' class='row'>
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량인수 ></div>
							<span>${list1.place_main } ${list1.place_sub}</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span>  ${list2[status.index].dateVo1.day } 일<b>${list2[status.index].dateVo1.month } 월</b> ${list2[status.index].dateVo1.hour }<b>:${list2[status.index].dateVo1.min }</b></span>
						</div>
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량반납 ></div>
							<span>${list1.place_main } ${list1.place_sub}</span>
						</div>
						<div id='arrive_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${list2[status.index].dateVo2.day } 일<b>${list2[status.index].dateVo2.month } 월</b> ${list2[status.index].dateVo2.hour }<b>:${list2[status.index].dateVo2.min }</b></span>
						</div>
					</div>
				</div>
			</div>






			<div class='row'>			
			<div id='mid_left' class='col-lg-4 col-md-4 col-sm-4 col-xs-12'>
				<h4>${list2[status.index].vo.car_name} <span>${list2[status.index].vo.car_kind}</span></h4>
				<img src="../images/rent/car/${list2[status.index].vo.photo}"/>
				<div><b>평가 : </b>
					<span>
						<c:choose>
								<c:when test="${list2[status.index].vo.review >= 9.0} "> 
								매우만족 <br/> 
								</c:when>
								<c:when test="${list2[status.index].vo.review >= 8.0 and list2[status.index].vo.review <9.0}"> 
								만족<br/>
								</c:when>
								<c:when test="${list2[status.index].vo.review >= 7.0 and list2[status.index].vo.review <8.0}"> 
								보통<br/>
								</c:when>
								<c:when test="${list2[status.index].vo.review <= 7.0 and list2[status.index].vo.review > 0.0}"> 
								보통이하<br/>
								</c:when>
								<c:when test="${list2[status.index].vo.review == 0.0}"> 
								리뷰없음<br/>
								</c:when>
								
						</c:choose>	
					</span>
				</div>
				<p><i>${list2[status.index].vo.review}</i> <b>/ 10 </b><span> (리뷰 ${list2[status.index].vo.review_count}건)</span></p>
			</div>
			<div id='mid_right' class='col-lg-8 col-md-8 col-sm-8 col-xs-12'>
					<div class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' >
							
							<img src='../images/rent/people.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 좌석수는 5개 입니다">&nbsp;&nbsp; ${list2[status.index].vo.max_people} 인승</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/door.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 도어수는 4개 입니다">&nbsp;&nbsp; ${list2[status.index].vo.door} 도어</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/bigbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 큰 가방 ${list2[status.index].vo.big_bag}</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/smallbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 작은 가방 ${list2[status.index].vo.small_bag}</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<c:if test="${list2[status.index].vo.aircon eq 'y'.charAt(0) }">
							<img src='../images/rent/aircon.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 에어컨이 포함되어 있습니다">&nbsp;&nbsp; 에어컨 장착</span>
							</c:if>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/gear.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 자동기어 입니다">&nbsp;&nbsp; ${list2[status.index].vo.gear} 기어</span>
						</div>
					</div>
					<h4>" 가득 채워 받고 가득 채워 반납 "</h4>
					<hr/>
					<div id='mid_left_free' class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${list2[status.index].vo.reservation eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>예약 변경</div> 
							</c:if>
							<c:if test="${list2[status.index].vo.my_car eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>자차보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>추가 운전자 1명포함</div> 
						</div> 
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${list2[status.index].vo.theft eq 'y'.charAt(0) }">
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
							<span>${list1.email}</span>
						</div>
						
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>고객님 예약번호 ></div>
							<span>${list1.reserve_serial }</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6 '>
							<button type="button" class="btn btn-warning " data-toggle="modal" data-target="#reserveCansel" >예약 취소하기</button>
						</div>
						
						
					</div>
				</div>
			</div>
			
			
			<div id='reserveResultPrice' class='row'>
				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<span>가격 : <b><fmt:formatNumber value="${list1.price }" pattern="#,###"></fmt:formatNumber> 원</b></span><br/>
					<c:if test="${list1.fullcover eq 'y' }">
					<div>풀패키지 포함</div>
					</c:if>
					<i>결제방법 : <b>${list1.payment }</b></i>
					<br/><strong style="font-size:0.7em;color:#777;">결제일 : ${fn:substring(list1.reserved_date,0,16)}</strong>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="reserveCansel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">예약 취소</h4>
			      </div>
			      <div class="modal-body">
			      
			      	<h4>예약을 정말 취소 하겠습니까?</h4>
			        

			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="button" id='btnReserveCancel' class="btn btn-warning" onclick='rent.reserveCancle(${list1.reserve_serial})'>예약 취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			
			</div>
</c:forEach>
</c:if>
<c:if test="${fn:length(reserve_list1) < 1}">
	<div class=''>현재 예약된 차량이 없습니다.</div>
</c:if>		
			
			
			
			<hr/>
			<hr/>
			
			
			
			
			<div id='reserveResultHead'class='row'>
				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<h4>이용 내역</h4>
				</div>
			</div>
			
			
			<!-- --------이용내역----------------------------------------------------------------------- -->


<c:if test="${fn:length(reserve_list2) > 0}">
<c:set var="list2_2" value="${param_list2}"></c:set>
<c:forEach var="list1_2" items="${reserve_list2 }" varStatus="status">

	<div style="border: 1px dashed #aaa;border-radius: 10px 10px 10px 10px;margin-bottom: 20px; padding: 15px;box-sizing: border-box;box-shadow: 1px 1px 5px 1px #ddd;">
			
			<div id='reserveResultTop' class='row' style="margin-bottom:0px">
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량인수 ></div>
							<span>${list1_2.place_main } ${list1_2.place_sub}</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${list2_2[status.index].dateVo1.day } 일<b>${list2_2[status.index].dateVo1.month } 월</b> ${list2_2[status.index].dateVo1.hour }<b>:${list2_2[status.index].dateVo1.min }</b></span>
						</div>
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량반납 ></div>
							<span>${list1_2.place_main } ${list1_2.place_sub}</span>
						</div>
						<div id='arrive_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${list2_2[status.index].dateVo2.day } 일<b>${list2_2[status.index].dateVo2.month } 월</b> ${list2_2[status.index].dateVo2.hour }<b>:${list2_2[status.index].dateVo2.min }</b></span>
						</div>
					</div>
				</div>
			</div>
			<div class='row'>			
			<div id='mid_left' class='col-lg-4 col-md-4 col-sm-4 col-xs-12'>
				<h4>${list2_2[status.index].vo.car_name} <span>${list2_2[status.index].vo.car_kind}</span></h4>
				<img src="../images/rent/car/${list2_2[status.index].vo.photo}"/>
				<div><b>평가 : </b>
					<span>
						<c:choose>
								<c:when test="${list2_2[status.index].vo.review >= 9.0} "> 
								매우만족 <br/> 
								</c:when>
								<c:when test="${list2_2[status.index].vo.review >= 8.0 and list2_2[status.index].vo.review <9.0}"> 
								만족<br/>
								</c:when>
								<c:when test="${list2_2[status.index].vo.review >= 7.0 and list2_2[status.index].vo.review <8.0}"> 
								보통<br/>
								</c:when>
								<c:when test="${list2_2[status.index].vo.review <= 7.0 and list2_2[status.index].vo.review > 0.0}"> 
								보통이하<br/>
								</c:when>
								<c:when test="${list2_2[status.index].vo.review == 0.0}"> 
								리뷰없음<br/>
								</c:when>
								
						</c:choose>	
					</span>
				</div>
				<p><i>${list2_2[status.index].vo.review}</i> <b>/ 10 </b><span> (리뷰 ${list2_2[status.index].vo.review_count}건)</span></p>
			</div>
			<div id='mid_right' class='col-lg-8 col-md-8 col-sm-8 col-xs-12'>
					<div class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' >
							
							<img src='../images/rent/people.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 좌석수는 5개 입니다">&nbsp;&nbsp; ${list2_2[status.index].vo.max_people} 인승</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/door.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 도어수는 4개 입니다">&nbsp;&nbsp; ${list2_2[status.index].vo.door} 도어</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/bigbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 큰 가방 ${list2_2[status.index].vo.big_bag}</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/smallbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 작은 가방 ${list2_2[status.index].vo.small_bag}</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
						<c:if test="${list2_2[status.index].vo.aircon eq 'y'.charAt(0) }">
							<img src='../images/rent/aircon.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 에어컨이 포함되어 있습니다">&nbsp;&nbsp; 에어컨 장착</span>
						</c:if>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/gear.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 자동기어 입니다">&nbsp;&nbsp; ${list2_2[status.index].vo.gear} 기어</span>
						</div>
					</div>
					<h4>" 가득 채워 받고 가득 채워 반납 "</h4>
					<hr/>
					<div id='mid_left_free' class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${list2_2[status.index].vo.reservation eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>예약 변경</div> 
							</c:if>
							<c:if test="${list2_2[status.index].vo.my_car eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>자차보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>추가 운전자 1명포함</div> 
						</div> 
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${list2_2[status.index].vo.theft eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>도난보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>렌탈에는 무제한 무료 킬로미터가 포함 됩니다</div> 
						</div> 
					</div>
			</div>
			</div>
			<div id='reserveResultBot' class='row' style="margin-bottom: 0px;margin-top: 0px;">
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>고객님 이메일 ></div>
							<span>${list1_2.email}</span>
						</div>
						
						
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>고객님 예약번호 ></div>
							<span>${list1_2.reserve_serial }</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6 '>
							<c:if test="${list1_2.review_check eq 'n'.toString() }">
							<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#MRT-001">후기 작성하기</button>
							</c:if>
							<c:if test="${list1_2.review_check eq 'y'.toString() }">
							<button type="button" class="btn btn-primary " data-toggle="modal" data-target="#MRT-001" disabled="disabled">후기 작성 완료</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div id='reserveResultPrice' class='row'>
				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<span>가격 : <b>212,340 원</b></span><br/>
					<div>풀패키지 포함</div>
					<i>결제방법 : <b>카카오페이</b></i>
					<br/><strong style="font-size:0.7em;color:#777;">결제일 : ${fn:substring(list1_2.reserved_date,0,16)}</strong>
				</div>
			</div>
	</div>
			<hr/>
			
			<c:if test="${list1_2.review_check eq 'n'.toString() }">
			
											<!-- ------------------리뷰입력 모달---------------------- -->
			
			<!-- Button trigger modal -->
			<!-- 241행 -->
			
			<!-- Modal -->
			<div class="modal fade" id="MRT-001" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">리뷰 작성</h4>
			      </div>
			      <div class="modal-body">
			      
			      	
			    		
			    			<div>
			    			렌트 비용대비 전반적인 평가 (1~10)
			    			<select id="review_1" name="review_1"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
			    			카운터직원의 친절도 및 전문성 (1~10)
			    			<select id="review_2" name="review_2"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
			    			차량인수 소요시간 (1~10)
			    			<select id="review_3" name="review_3"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
			    			차량반납 소요시간 (1~10)
			    			<select id="review_4" name="review_4"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
			    			차량 청결도 (1~10)
			    			<select id="review_5" name="review_5"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
			    			차량의 전반적인 상태 (1~10)
			    			<select id="review_6" name="review_6"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
			    			재선택 가능성 (1~10)
			    			<select id="review_7" name="review_7"> 
						        <option value="1">1</option> 
						        <option value="2">2</option> 
						        <option value="3">3</option> 
						        <option value="4">4</option> 
						        <option value="5">5</option> 
						        <option value="6">6</option> 
						        <option value="7">7</option> 
						        <option value="8">8</option> 
						        <option value="9">9</option> 
						        <option value="10">10</option>
					        </select>
					        </div>
					        
					        <div>
					        	동행 규모
					        	<select name="scale">
					        		<option value="가족">가족</option> 
							        <option value="그룹">그룹</option> 
							        <option value="커플">커플</option> 
							        <option value="개인">개인</option>
					        	</select>
					        
					        </div>
					        
					        <div>
					        	차량 인수시간
					        	<select name='take_overtime'>
					        		<option value="10분 이하">10분 이하</option> 
							        <option value="10분 ~ 20분">10분 ~ 20분</option> 
							        <option value="20분 ~ 30분">20분 ~ 30분</option> 
							        <option value="30분 ~ 1시간">30분 ~ 1시간</option>
							        <option value="1시간 이상">1시간 이상</option>
					        	</select>
					        </div>
					        
					        <div>
					        	좋았던 사항
					        	<input type="text" name='good_news' class="form-control" placeholder="좋았던 한줄평을써주세요">
					        </div>
					        
					        <div>
					        	좋지 않았던 사항
					        	<input type="text" name='bad_news' class="form-control" placeholder="좋지 않았던 한줄평을 써주세요">
					        </div>
					        
					        
										    		
			      	
			      
			      
			      
			        

			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="button" id='btnReviewInsert' onclick='rent.reviewInsert(${list1_2.reserve_serial},${list1_2.car_serial})' class="btn btn-primary">리뷰 작성</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			</c:if>
			
</c:forEach>
</c:if>
<c:if test="${fn:length(reserve_list2) < 1}">
	<div class=''>사용 내역이 없습니다.</div>
</c:if>				
			
			
			
			
			<hr/>
			
			
			
			
			
			
			
			
			<hr/>
			
			
			
			
			
			
			
			
			<div id='reserveResultCansel'class='row'>
				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<h4>예약 취소 내역</h4>
				</div>
			</div>
			
			
			
			<!-- ------------------------------------예약 취소 내용 ------------------------------------------------------- -->

<c:if test="${fn:length(reserve_list3) > 0}">
<c:set var="list2_3" value="${param_list3}"></c:set>
<c:forEach var="list1_3" items="${reserve_list3 }" varStatus="status">

	<div style="border: 1px dashed #aaa;border-radius: 10px 10px 10px 10px;margin-bottom: 20px; padding: 15px;box-sizing: border-box;box-shadow: 1px 1px 5px 1px #eee;">
			<div class='reserveCansel'>
			<div id='reserveResultTop' class='row' style="margin-bottom:0px">
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량인수 ></div>
							<span>${list1_3.place_main } ${list1_3.place_sub}</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${list2_3[status.index].dateVo1.day } 일<b>${list2_3[status.index].dateVo1.month } 월</b> ${list2_3[status.index].dateVo1.hour }<b>:${list2_3[status.index].dateVo1.min }</b></span>
						</div>
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>차량반납 ></div>
							<span>${list1_3.place_main } ${list1_3.place_sub}</span>
						</div>
						<div id='arrive_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6   '>
							<span> ${list2_3[status.index].dateVo2.day } 일<b>${list2_3[status.index].dateVo2.month } 월</b> ${list2_3[status.index].dateVo2.hour }<b>:${list2_3[status.index].dateVo2.min }</b></span>
						</div>
					</div>
				</div>
			</div>
			<div class='row'>			
			<div id='mid_left' class='col-lg-4 col-md-4 col-sm-4 col-xs-12'>
				<h4>${list2_3[status.index].vo.car_name} <span>${list2_3[status.index].vo.car_kind}</span></h4>
				<img src="../images/rent/car/${list2_3[status.index].vo.photo}"/>
				<div><b>평가 : </b>
					<span>
						<c:choose>
								<c:when test="${list2_3[status.index].vo.review >= 9.0} "> 
								매우만족 <br/> 
								</c:when>
								<c:when test="${list2_3[status.index].vo.review >= 8.0 and list2_3[status.index].vo.review <9.0}"> 
								만족<br/>
								</c:when>
								<c:when test="${list2_3[status.index].vo.review >= 7.0 and list2_3[status.index].vo.review <8.0}"> 
								보통<br/>
								</c:when>
								<c:when test="${list2_3[status.index].vo.review <= 7.0 and list2_3[status.index].vo.review > 0.0}"> 
								보통이하<br/>
								</c:when>
								<c:when test="${list2_3[status.index].vo.review == 0.0}"> 
								리뷰없음<br/>
								</c:when>
								
						</c:choose>	
					</span>
				</div>
				<p><i>${list2_3[status.index].vo.review}</i> <b>/ 10 </b><span> (리뷰 ${list2_3[status.index].vo.review_count}건)</span></p>
			</div>
			<div id='mid_right' class='col-lg-8 col-md-8 col-sm-8 col-xs-12'>
					<div class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' >
							
							<img src='../images/rent/people.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 좌석수는 5개 입니다">&nbsp;&nbsp; ${list2_3[status.index].vo.max_people} 인승</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/door.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량의 도어수는 4개 입니다">&nbsp;&nbsp; ${list2_3[status.index].vo.door} 도어</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/bigbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 큰 가방 ${list2_3[status.index].vo.big_bag}</span>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/smallbag.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이차량은 1개의 큰 수화물과 1개의 작은 수화물을 실을수 있습니다">&nbsp;&nbsp; 작은 가방 ${list2_3[status.index].vo.small_bag}</span>
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<c:if test="${list2_3[status.index].vo.aircon eq 'y'.charAt(0) }">
							<img src='../images/rent/aircon.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 에어컨이 포함되어 있습니다">&nbsp;&nbsp; 에어컨 장착</span>
							</c:if>
						</div>
						<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<img src='../images/rent/gear.png'/><span class='info_f' data-toggle="tooltip" data-placement="top" title="이 차량은 자동기어 입니다">&nbsp;&nbsp; ${list2_3[status.index].vo.gear} 기어</span>
						</div>
					</div>
					<h4>" 가득 채워 받고 가득 채워 반납 "</h4>
					<hr/>
					<div id='mid_left_free' class='row'>
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${list2_3[status.index].vo.reservation eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>예약 변경</div> 
							</c:if>
							<c:if test="${list2_3[status.index].vo.my_car eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>자차보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>추가 운전자 1명포함</div> 
						</div> 
						<div  class='col-lg-6 col-md-6 col-sm-6 col-xs-6' > 
							<c:if test="${list2_3[status.index].vo.theft eq 'y'.charAt(0) }">
							<div><img src='../images/rent/viewCheck.png'/>도난보험</div> 
							</c:if>
							<div><img src='../images/rent/viewCheck.png'/>렌탈에는 무제한 무료 킬로미터가 포함 됩니다</div> 
						</div> 
					</div>
			</div>
			</div>
			<div id='reserveResultBot' class='row' style="margin-bottom: 0px;margin-top: 0px;">
				<div id='depart' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='depart_1' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
							<div>고객님 이메일 ></div>
							<span>${list1_3.email}</span>
						</div>
						
					</div>
				</div>
				<div id='arrive' class='col-lg-6 col-md-6 col-sm-6 col-xs-12'>
					<div class='row'>
						<div id='arrive_1' class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
							<div>고객님 예약 번호 ></div>
							<span>${list1_3.reserve_serial }</span>
						</div>
						<div id='depart_2' class='col-lg-6 col-md-6 col-sm-6 col-xs-6 '>
							<button type="button" class="btn btn-warning" disabled="disabled">예약 취소완료</button>
						</div>
					</div>
				</div>
			</div>
			<div id='reserveResultPrice' class='row'>
				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<span>가격 : <b><fmt:formatNumber value="${list1_3.price }" pattern="#,###"></fmt:formatNumber> 원</b></span><br/>
					<c:if test="${list1_3.fullcover eq 'y' }">
					<div>풀패키지 포함</div>
					</c:if>
					<i>결제방법 : <b>${list1_3.payment }</b></i>
					<br/><strong style="font-size:0.7em;color:#777;">결제일 : ${fn:substring(list1_3.reserved_date,0,16)}</strong>
				</div>
			</div>
			<hr/>
			</div>
			
		</div>
</c:forEach>
</c:if>
<c:if test="${fn:length(reserve_list3) < 1}">
	<div class=''>취소 내역이 없습니다.</div>
</c:if>				
			
			
			
			
			
			
			
		</div>
		<div class='col-lg-3 col-md-3 col-sm-3'></div>
		</div>
</form>		
		
		
		<script type="text/javascript"> 
		
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

	    $('#returnedDate').datepicker({
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
	    })
		
		
		
		$(function() { 
			$('#review_1 , #review_2 ,#review_3 ,#review_4 ,#review_5 ,#review_6 ,#review_7').barrating({
				theme: 'fontawesome-stars'
				, initialRating : 8
				, onSelect: function(value, text, event){ 
					// 별점 클릭 후 처리는 여기서 코드 
					// 선택한 별점 값을 value로 받음
				}
			});
			
			
		});
	    
	    
	    $('#btnReviewInsert').click(function(){
		    swal.fire({
		 		  title: "Success!",
		 		  text: "리뷰 작성 완료",
		 		  icon: "success",
		 		  button: "초기 화면으로",
		 		});
	    	
	    })
	     $('#btnReserveCancel').click(function(){
		    swal.fire({
		 		  title: "Success!",
		 		  text: "예약 취소 완료",
		 		  icon: "success",
		 		  button: "초기 화면으로",
		 		});
	    	
	    })
		</script>