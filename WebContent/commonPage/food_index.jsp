<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" type="text/css" href="css/food.css">

<body>
<header>

<!-- top -->
<div id="food_top">
  <%@include file="food_top.jsp" %>
</div>

</header>

<div id="food_body">
  <%@include file="food_body.jsp" %>
</div>
<!-- script -->
<script src="js/filter.js"></script>
<script src="js/food_map.js"></script>

<script>
let local = ${param.local} + "";
if(${!(empty param.local)}) {
	let chk_obj = document.getElementsByName("local_type");
	//let chk_size = chk_obj.length;
	
	// 지역 체크 하기
	for(i of chk_obj) {
		if(local == i.value) {
			i.checked = true;
			filter.local.push(i.value);
			let val = $("label[for='" + i.id + "']").text();
			// 필터 요소 추가
			$('#filter').append('<button onclick="filter.remove(this)" id="' + i.id + '" class="genric-btn info-border radius">'+ val +'<i class="fa fa-times pl-2"></i></button>');
			// filter.check(i);
			break;
		}
	}
}

switch(${param.menu}) {
case 12:
	$('#check_happy').click();
	break;
case 14:
	$('#check_culture').click();
	break;
case 39:
	$('#check_food').click();
	break;
case 15:
	$('#check_festival').click();
	break;
}

</script>
</body>
</html>