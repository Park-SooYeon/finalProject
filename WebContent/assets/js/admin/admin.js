/**
 * travel 관리자 페이지 js
 * 작성자 : lje
 * 작성일자 : 2020.05
 */
let adm = {};
adm.init = function(){ 
	$("#main").load("select.brd");
}


adm.go = function(nowPage){
	frm_brd.nowPage.value = nowPage;
	let param = $("#frm_adm").serialize();	// 	직렬화 
	
	console.log(param);
	
	$.post("select.adm", param, function(data, state){
		$("#main").html(data);
	});
}