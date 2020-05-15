<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 검색창 -->

  <div class="input-group-icon">
	<div class="icon"><i class="fa fa-search" aria-hidden="true"></i></div>
	<input type="text" name="Search" placeholder="Search" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search'" required="" class="single-input">
  </div>
<br/>
<div class="row">
<div class="col-md-6 mb-10">
  <span style="font-weight:bold">00(el)</span><span>개의 결과가 필터와 일치합니다.</span><span id="check_release" style="font-weight:bold; cursor:pointer;">필터옵션 전체해제</span>
</div>
<div class="col-md-6 col-0">
<div class="text-right" >
  <span>정렬순서 : <input type="text" placeholder="관련도" class="disabledInput" disabled></span>
</div>
</div>
</div>
<div class="button-group-area mt-10 mb-10" id="filter" style="float:left"></div>
<br/>
<div class="icon text-right col-0" style="margin-bottom:10px;">
<button type="button" id="cardsort" class="btn btn-default"><i type="button" class="fa fa-th-large" aria-hidden="true"></i></button>
<button type="button" id="widthsort" class="btn btn-default"><i type="button" class="fa fa-align-justify" aria-hidden="true"></i></button>
</div>
