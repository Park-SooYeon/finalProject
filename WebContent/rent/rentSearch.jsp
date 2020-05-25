<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





</head>
<body>



		



<div id="rentSearch" style="padding-top: 70px;">
	<form name='rent_frm' id='rent_frm' method='post'>
	
	<input type='hidden' name='' value='${dateVo1.now}'/>
	<input type='hidden' name='' value='${dateVo2.now}'/>
	<input type='hidden' name='placeMain' value='${placeMain}'/>
	<input type='hidden' name='placeSub' value='${placeSub}'/>
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
							<label>${placeSub}</label>
							<input type="text" id='search_rent' class="form-control datepicker-here" data-timepicker="true" data-language='en' value="${rentDate}"  name='rentDate'/>
							<input type='hidden' id='search_rent_'value='${rentDate}'/>
						</div>
						<hr/>
						<label>> 차량 반납</label>
						<div class="form-group">
							<label>${placeSub}</label>
							<input type="text" id='search_return' class="form-control datepicker-here" data-timepicker="true" data-language='en' value="${returnDate}"  name='returnDate'/>
						</div>
						<button type="button" id='btnSearch' class="btn btn-primary" onclick='rent.fillter()'>검색</button>
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
					      		<c:forEach var="vo" items="${list }" varStatus="status">
					          		<label><input type="radio" name='companyCheck' value='${vo.company_name}' onclick='rent.fillter()'>&nbsp;&nbsp;${vo.company_name}</label><br/>
					          	</c:forEach>
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
					          	<label><input type="checkbox" onclick='rent.fillter()'>&nbsp;&nbsp;가득 채워 받고 가득 채워 반납</label><br/>
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
					      		<c:choose>
									<c:when test="${airconCheck eq 'on'}"> 
										<label><input type="checkbox" name='airconCheck' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;에어컨장착</label><br/>	
									</c:when>
									<c:otherwise> 
										<label><input type="checkbox" name='airconCheck' onclick='rent.fillter()'>&nbsp;&nbsp;에어컨장착</label><br/>
									 </c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${gearCheck eq 'on'}"> 
										<label><input type="checkbox" name='gearCheck' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;자동기어</label><br/>	
									</c:when>
									<c:otherwise> 
										<label><input type="checkbox" name='gearCheck' onclick='rent.fillter()'>&nbsp;&nbsp;자동기어</label><br/>
									 </c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${doorCheck eq 'on'}"> 
										<label><input type="checkbox" name='doorCheck' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;4도어 이상</label><br/>	
									</c:when>
									<c:otherwise> 
										<label><input type="checkbox" name='doorCheck' onclick='rent.fillter()'>&nbsp;&nbsp;4도어 이상</label><br/>
									 </c:otherwise>
								</c:choose>
					          	
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
					      		<c:choose>
									<c:when test="${maxPeopleCheck eq '1'}"> 
										<label><input type="radio" name='maxPeopleCheck' value='1' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;1명 혹은 2명</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='2' onclick='rent.fillter()'>&nbsp;&nbsp;작은그룹</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='3' onclick='rent.fillter()'>&nbsp;&nbsp;큰 그룹</label><br/>
									 </c:when>
									<c:when test="${maxPeopleCheck eq '2'}"> 
										<label><input type="radio" name='maxPeopleCheck' value='1' onclick='rent.fillter()'>&nbsp;&nbsp;1명 혹은 2명</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='2' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;작은그룹</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='3' onclick='rent.fillter()'>&nbsp;&nbsp;큰 그룹</label><br/>
					          	 	</c:when>
									<c:when test="${maxPeopleCheck eq '3'}"> 
										<label><input type="radio" name='maxPeopleCheck' value='1' onclick='rent.fillter()'>&nbsp;&nbsp;1명 혹은 2명</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='2' onclick='rent.fillter()'>&nbsp;&nbsp;작은그룹</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='3' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;큰 그룹</label><br/>
					          	 	</c:when>
					          	 	<c:otherwise>
					          	 		<label><input type="radio" name='maxPeopleCheck' value='1' onclick='rent.fillter()'>&nbsp;&nbsp;1명 혹은 2명</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='2' onclick='rent.fillter()'>&nbsp;&nbsp;작은그룹</label><br/>
					          			<label><input type="radio" name='maxPeopleCheck' value='3' onclick='rent.fillter()'>&nbsp;&nbsp;큰 그룹</label><br/>					          	 	
					          	 	</c:otherwise>
									
								</c:choose>
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
					      	<c:choose>
					      		<c:when test="${priceCheck eq '1'}"> 
									<label><input type="radio" name='priceCheck' value='1' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;50만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='2' onclick='rent.fillter()'>&nbsp;&nbsp;30만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='3' onclick='rent.fillter()'>&nbsp;&nbsp;10만원 또는 이하</label><br/>
					          	</c:when>
					          	<c:when test="${priceCheck eq '2'}"> 
									<label><input type="radio" name='priceCheck' value='1' onclick='rent.fillter()'>&nbsp;&nbsp;50만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='2' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;30만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='3' onclick='rent.fillter()'>&nbsp;&nbsp;10만원 또는 이하</label><br/>
					          	</c:when>
					          	<c:when test="${priceCheck eq '3'}"> 
									<label><input type="radio" name='priceCheck' value='1' onclick='rent.fillter()'>&nbsp;&nbsp;50만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='2' onclick='rent.fillter()'>&nbsp;&nbsp;30만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='3' onclick='rent.fillter()' checked="checked">&nbsp;&nbsp;10만원 또는 이하</label><br/>
					          	</c:when>
					          	<c:otherwise>
					          		<label><input type="radio" name='priceCheck' value='1' onclick='rent.fillter()'>&nbsp;&nbsp;50만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='2' onclick='rent.fillter()'>&nbsp;&nbsp;30만원 또는 이하</label><br/>
					          		<label><input type="radio" name='priceCheck' value='3' onclick='rent.fillter()'>&nbsp;&nbsp;10만원 또는 이하</label><br/>					          	
					          	</c:otherwise>
					        </c:choose>
					          	
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
			
			
			
			<div class ='row'>
				<div id='carPhoto' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<div class ='row'>
						<input type='hidden' id='kind_s' value="${empty kindCheck?'':kindCheck }" name='kindCheck' />
						
						<c:choose>
							<c:when test="${kindCheck eq '소형 차량'}"> 
								<div id='carPhoto_1' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style="border : 2px solid #2b96fe;">
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>소형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car1.png"/>
								</div>
								</div>	
							</c:when>
							<c:otherwise> 
								<div id='carPhoto_1' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' >
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>소형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car1.png"/>
								</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${kindCheck eq '중형 차량'}"> 
								<div id='carPhoto_2' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style="border : 2px solid #2b96fe;">
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>중형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car2.png"/>
								</div>
								
								</div>
							</c:when>
							<c:otherwise> 
								<div id='carPhoto_2' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' >
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>중형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car2.png"/>
								</div>
								
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${kindCheck eq '대형 차량'}"> 
								<div id='carPhoto_3' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style="border : 2px solid #2b96fe;">
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>대형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car3.png"/>
								</div>
								</div>
							</c:when>
							<c:otherwise> 
								<div id='carPhoto_3' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>대형 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car3.png"/>
								</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${kindCheck eq '프리미엄 차량'}"> 
								<div id='carPhoto_4' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style="border : 2px solid #2b96fe;">
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>프리미엄 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car4.png"/>
								</div>
								</div>
							</c:when>
							<c:otherwise> 
								<div id='carPhoto_4' class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>프리미엄 차량</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car4.png"/>
								</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${kindCheck eq '미니벤'}"> 
								<div id='carPhoto_5' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style="border : 2px solid #2b96fe;">
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>미니벤</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car5.png"/>
								</div>
								</div>
							</c:when>
							<c:otherwise> 
								<div id='carPhoto_5' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' >
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>미니벤</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car5.png"/>
								</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${kindCheck eq 'SUV'}"> 
								<div id='carPhoto_6' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' style="border : 2px solid #2b96fe;">
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>SUV</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car6.png"/>
								</div>
								</div>
							</c:when>
							<c:otherwise> 
								<div id='carPhoto_6' class='col-lg-2 col-md-2 col-sm-2 col-xs-2' >
								<div id='photoTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>SUV</div>
								<div id='photoMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src="../images/rent/car6.png"/>
								</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						
						
						
						
						
						
						
					</div>
				</div>
			</div>
			
			
			
			
			<div id='SerachResult'>
				<c:set var="contentPage" value="${contentPage }"/>
				<c:if test="${contentPage==null }">
					<jsp:include page="rentSearchSub1.jsp"></jsp:include>
				</c:if>
				<jsp:include page="${contentPage }"></jsp:include>
			</div>
			
			
			
			
		</div>
	</div>
	</form>
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
    var start = $('#search_rent_').val(),
        prevDay,
        startHours = 9;

    

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