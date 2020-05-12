<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header id="header">
	<div class="container main-menu">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="index.jsp"><img src="template/img/logo.png" alt="" title="" /></a>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search" style="width: 80%;"
								placeholder="지역, 관광지 검색" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '지역, 관광지 검색'" aria-label="Search">
							<button class="btn btn-primary my-2 my-sm-0" style="width: 15%;"
								type="submit"><i class="fa fa-search"></i></button>
						</form>

					</li>
					<li><a href="./?inc=membership/login.jsp">로그인</a></li>
					<li><a href="./?inc=membership/memberJoin.jsp">회원가입</a></li>
					<li><a href="./?inc=membership/partnerJoin.jsp">파트너 등록하기</a></li>
					<li><a href="./?inc=mypage/my_list.jsp">mypage1</a></li>
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
					<li><a href="./?inc=commonPage/menuMain.jsp">즐길거리</a></li>
					<li><a href="#">음식점</a></li>
					<li><a href="#">축제</a></li>
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
</script>