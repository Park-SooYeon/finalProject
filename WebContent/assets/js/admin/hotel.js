/**
 * travel 관리자 페이지 js
 * 작성자 : lje
 * 작성일자 : 2020.05
 */
let ptn = {};
ptn.init = function(){ 
	$("#main").load("dashboard.ph");
}


ptn.go = function(nowPage){
	frm_brd.nowPage.value = nowPage;
	let param = $("#frm_adm").serialize();	// 	직렬화 
	
	console.log(param);
	
	$.post("select.adm", param, function(data, state){
		$("#main").html(data);
	});
}

let ptn2 = {};

ptn2.init = function(){ 
	$("#main").load("hotel_comp_list.ph");
}