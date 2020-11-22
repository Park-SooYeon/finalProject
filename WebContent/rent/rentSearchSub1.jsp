<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
			
			<c:if test="${fn:length(list) > 0}">
			<c:forEach var="vo" items="${list }" varStatus="status">
			
			<div class='row'>
				<div id='company_${status.count}' class='col-lg-12 col-md-12 col-sm-12 col-xs-12 company'>
					<div class="row">
						<div id='companyLeft'  class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
							<div class='row'>
								<div id='leftImage' class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
									<img src='../images/rent/company.png'>
								</div>
								<div id='rightInfo' class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
									${vo.address }<br/>
									<span>${vo.company_name }</span>
								</div>
							</div>
						</div>
						<div id='companyMid1'  class="col-lg-3 col-md-3 col-sm-5 col-xs-6">
							<span>대여요금</span>
							<div><fmt:formatNumber value="${vo.price }" pattern="#,###"></fmt:formatNumber>원</div>
							<span>${betweenDay }일</span>
						</div>
						<div id='companyMid2'  class="col-lg-1 col-md-1 col-sm-2 col-xs-6">
							
						</div>
						<div id='companyRight' class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
							<button type="button" id='btnCar' onclick="rent.carSearch(${vo.company_serial})" class="btn btn-primary">${vo.cars_count } 차량 모두 보기</button>
							<span>무료취소 가능</span>
						</div>
					</div>
				</div>
			</div>
			
			</c:forEach>
			</c:if>
			<c:if test="${empty list}">
			<div class='row'>
				<div id='company' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					현재 예약 가능한 차량이 없습니다.
				</div>	
			</div>
			</c:if>
			
			
