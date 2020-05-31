<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	let hotelDetailMove = function() {
		location.href = './?inc=hotel/hotelDetailView.jsp';
	}
</script>


<div class="col-md-12" id="hotel_list" style="padding-top: 10px;">
	
<c:forEach var='i' items='${list}'>	
	<div class="row">

		<div class="col-md-6">

			<img src="template/img/packages/d4.jpg" alt="">
		</div>
		<div class="col-md-6">
			<h3>
				${i.place_name} &nbsp;&nbsp; <span class="badge badge photel">예약
					가능</span>
			</h3>
			<label>위치</label> <br>

			<div class="tags">
				<div>
					<span class="badge badge-info">와이파이</span> <span
						class="badge badge-info">조식</span>
				</div>

				<div class="clearfix" style='margin-top: 5px'>
					<ul>
						<li>
							<div class='rating' data-rate='1'>
								<!-- data-rate에 별점을입력(5초과금지) -->
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>
						</li>
					</ul>
				</div>





				<label style="font-size: 20px; padding-right: 33px;">최저가
					nnnnnn원 </label> <br> <input type="button"
					class="genric-btn info min-width-180 pull-right  " value="예약하러 가기"
					id="btnReserv" onclick="hotelDetailMove()">
			</div>
		</div>


	</div>
</c:forEach>
</div>

<br>



