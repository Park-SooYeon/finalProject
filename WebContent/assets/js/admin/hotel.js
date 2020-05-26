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
	
	
	// 호텥 등록 시, 지역코드 값 세팅
	$("#htPlaceNm").change(function(){
		var value = $("#htPlaceNm option:selected").val();
		$("#htPlaceCode").val(value);
	});
	// 호텥 등록 시, 판매상태 값 세팅
	$("#PtnhtState").change(function(){
		var value = $("#PtnhtState option:selected").val();
		$("#PtnHtStatus").val(value);
	});
	
	$("#btnPtHtRegister").click(function(){
		
		var value = $("#htPlaceNm option:selected").val();
		$("#htPlaceCode").val(value);
		
		var value = $("#PtnhtState option:selected").val();
		$("#PtnHtStatus").val(value);
		
		// 객실옵션 선택여부 체크 
		if($("#wifi").is(":checked") == true){
			$("#wifi").val("1");
		}else{
			$("#wifi").val(0);
		}
		
		if($("#breakfast").is(":checked") == true){
			$("#breakfast").val("1");
		}else{
			$("#breakfast").val(0);
		}
		if($("#parking").is(":checked") == true){
			$("#parking").val("1");
		}else{
			$("#parking").val(0);
		}
		
		console.log("지역코드 : " + $("#htPlaceCode").val());
		console.log("판매상태 : " + $("#PtnHtStatus").val());
		
		$("#htPlaceCode").val(3);
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
