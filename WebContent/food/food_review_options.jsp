<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/food.js"></script>
<hr/>
<div class="col-md-12">
<div class="row">
<div class="col-md-4">
<div class="review_star p-2" id="service_review_star">
	<span class="fa fa-star fa-2x" onclick="foodServiceStar(1)"></span>
	<span class="fa fa-star fa-2x" onclick="foodServiceStar(3)"></span>
	<span class="fa fa-star fa-2x" onclick="foodServiceStar(5)"></span>
	<span class="fa fa-star fa-2x" onclick="foodServiceStar(7)"></span>
	<span class="fa fa-star fa-2x" onclick="foodServiceStar(9)"></span>
&nbsp&nbsp&nbsp<strong class="fa-2x">서비스</strong>
</div>
<br/>
<div class="review_star p-2" id="gusto_review_star">
	<span class="fa fa-star fa-2x" onclick="gustoStar(1)"></span>
	<span class="fa fa-star fa-2x" onclick="gustoStar(3)"></span>
	<span class="fa fa-star fa-2x" onclick="gustoStar(5)"></span>
	<span class="fa fa-star fa-2x" onclick="gustoStar(7)"></span>
	<span class="fa fa-star fa-2x" onclick="gustoStar(9)"></span>
&nbsp&nbsp&nbsp<strong class="fa-2x">음&nbsp&nbsp&nbsp&nbsp식</strong>
</div>
<br/>
<div class="review_star p-2" id="price_review_star">
	<span class="fa fa-star fa-2x" onclick="priceStar(1)"></span>
	<span class="fa fa-star fa-2x" onclick="priceStar(3)"></span>
	<span class="fa fa-star fa-2x" onclick="priceStar(5)"></span>
	<span class="fa fa-star fa-2x" onclick="priceStar(7)"></span>
	<span class="fa fa-star fa-2x" onclick="priceStar(9)"></span>
&nbsp&nbsp&nbsp<strong class="fa-2x">가&nbsp&nbsp&nbsp&nbsp격</strong>
</div>
</div>
<div class="col-md-4">
<div style="line-height:45px;">서비스는 만족하셨나요?</div>
<div style="line-height:45px;">음식은 입에 맞으셨나요?</div>
<div style="line-height:45px;">가성비는 어떠셨나요?</div>
</div>
</div>
</div>
