/**
 * travel 관리자 페이지 js
 * 작성자 : lje
 * 작성일자 : 2020.05
 */
let ptn = {};
ptn.init = function(){ 
	$("#main").load("dashboard.ph");
}

ptn.func = function(){
	
	$("#btnPtHtInsert").click(function(){
		let fd = new FormData($("#frmAdmHtCompAdd")[0]);	// object형태로 데이터 만들어짐.
		
		$.ajax({
			url : "insert.ph",// data를 던질 곳  
			type : "post",
			data : fd,	// data가 json타입으로 넘어감.
			contentType : false,
			processData : false,
			error : function(xhr, status, error){
				console.log(error);
			},
			success : function(data, xhr, status){
				$("#main").html(data);
			}
		});
		
	});
	
}

ptn.go = function(nowPage){
	frm_brd.nowPage.value = nowPage;
	let param = $("#frm_adm").serialize();	// 	직렬화 
	
	console.log(param);
	
	$.post("select.adm", param, function(data, state){
		$("#main").html(data);
	});
}
