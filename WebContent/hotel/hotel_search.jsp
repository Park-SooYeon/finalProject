<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 검색창 -->

  <div class="input-group-icon" style="display:flex;">
	<div class="icon"><i class="fa fa-search" aria-hidden="true"></i></div>
	<input type="text" id="filterFindStr" value="${param.findStr }" name="Search" placeholder="Search" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search'" required="" class="single-input">
  	<button id="filterSearch" onclick="filter.search()" class="btn btn-primary ml-3" style="width: 10%; height: 40px;" type="submit"><i class="fa fa-search"></i></button>
  </div>
<br/>
<div class="row">
<div class="col-md-6 mb-10">
  <span style="font-weight:bold" id="search_cnt"></span><span>개의 결과가 필터와 일치합니다.</span><span onclick="filter.removeAll()" style="font-weight:bold; cursor:pointer;">필터옵션 전체해제</span>
</div>
<div class="col-md-6 col-0">
<div class="text-right" >
  <span>정렬순서 : <input type="text" placeholder="관련도" class="disabledInput" disabled></span>
</div>
</div>
</div>
<div class="button-group-area mt-10 mb-10" id="filter" style="float:left"></div>
<br/>
