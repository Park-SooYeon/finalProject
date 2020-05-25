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
		//frm_brd.enctype = '';
		let param = $("#frmAdmHtCompList").serialize();	// 	직렬화 
		$.post("hotel_comp_add.ph", param, function(data, state){
			$("#main").html(data);
		});
	});
	
	$("#btnPtHtRegister").click(function(){
		
		// 객실옵션 선택여부 체크 
		if($("#wifi").is(":checked") == true){
			$("#wifi").val(1);
		}
		if($("#breakfast").is(":checked") == true){
			$("#breakfast").val(1);
		}
		if($("#parking").is(":checked") == true){
			$("#parking").val(1);
		}
		console.log($("#place_location").val());
		console.log($("#wifi").val());
		
		let fd = new FormData($("#frmAdmHtCompAdd")[0]);	// object형태로 데이터 만들어짐.
		
		$.ajax({
			url : "insertR.ph",// data를 던질 곳  
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
