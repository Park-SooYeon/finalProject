<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<header id="header">
	<div class="container main-menu">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="index.jsp"><img src="template/img/logo.png" alt="" title="" /></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu" style="line-height: 43px;">
					<li class="mt-2">
						<form class="form-inline my-2 my-lg-0">
						
						
							<input class="form-control mr-sm-2" type="search" style="width: 80%;"
								placeholder="지역, 관광지 검색" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '지역, 관광지 검색'" aria-label="Search">
							<button class="btn btn-primary my-2 my-sm-0" style="width: 15%;"
								type="submit"><i class="fa fa-search"></i></button>
						</form>

					</li>
					<!-- 로그인했을 떄 보이기  -->
					
					<c:if test="${empty member_id}">
					<li><a href="./?inc=membership/login.jsp">로그인</a></li>
					<li><a href="./?inc=membership/memberJoin.jsp">회원가입</a></li>
					</c:if>
					
					<c:if test="${member_id != null}">
					<li><a href="./?inc=logout.ms">로그아웃</a></li>
					<li><a href="./?inc=membership/partnerJoin.jsp">파트너 등록하기</a></li>
					</c:if>
					
					
						
					
					<c:if test="${member_id != null}">
				
					</c:if>
					
						<c:if test="${member_id != null}">
							<li>
							<div class="d-flex">
							<div class="main-profile">
							<img width="100%" src="https://i.ibb.co/T1FbwJ5/3x4-blue.jpg" alt="3x4-blue" border="0">
							</div>
							<div class="mobile-userId" style="display:none;">안주현 님</div>
							</div>
								<ul class="main-pro-menu">
								<li>${sessionScope.nickName} 님</li>
								<hr/>
						<li><div onclick="location.href='./?inc=profile.mp?id=${sessionScope.member_id}'">프로필 보기</div></li>
								<li><div onclick="location.href='./?inc=mypage/my_account.jsp'">계정관리</div></li>
								<li><div onclick="location.href='./?inc=mybooking.mp'">예약내역 확인</div></li>
								<li><div onclick="location.href='./?inc=mypage/my_list.jsp'">My Trip</div></li>
								<li><div onclick="location.href='./?inc=logout.ms'">로그아웃</div></li>
								</ul>
							</li>
						</c:if>
				</ul>
			</nav>
			<!-- #nav-menu-container -->
		</div>
	</div>
	<div class="container pb-10">
		<div class="row align-items-center justify-content-between d-flex">
			<nav id="top-menu-container">
				<ul class="top-menu">
					<li><a href="./?inc=hotel/hotelMain.jsp">호텔</a></li>
					<li><a href="#" onclick="menuMove(12)">즐길거리</a></li>
					<li><a href="#" onclick="menuMove(39)">음식점</a></li>
					<li><a href="#" onclick="menuMove(15)">축제</a></li>
					<li><a href="#" onclick="openInNewTab('rent/rent_index.jsp')">렌트카</a></li>
					<li><a href="#" onclick="openInNewTab('admin/super')">관리자 페이지</a></li>
					<li><a href="#" onclick="openInNewTab('admin/partner')">파트너 페이지</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<!-- #header -->
<script>
function openInNewTab(url) {
    var win = window.open(url, '_blank');
    win.focus();
}


let menuMove = function(menu) {
	location.href = './?inc=menuMain.sb&menu=' + menu;
}

</script>