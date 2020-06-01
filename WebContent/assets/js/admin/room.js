/**
 * travelista 파트너 페이지 - 객실관리 관련 js
 * 작성자 : lje
 * 작성일자 : 2020.05
 */
let room = {};
room.func = function(){
	
	// 객실 등록 시, place_Serial 값 세팅
	$("#htCompNm").change(function(){
		var value = $("#htCompNm option:selected").val();
		$("#place_serial").val(value);
		console.log("place_serial chg : " + $("#place_serial").val());
	});
	
	
	$("#btnPtRmRegister").click(function(){
		// select, checkbox 값 세팅
		room.chk();
		
		var value = $("#htCompNm option:selected").val();
		$("#place_serial").val(value);
		
		console.log("place_serial : " + $("#place_serial").val());
		
		let fd = new FormData($("#frmAdmHtRoomAdd")[0]);	// object형태로 데이터 만들어짐.
		
		$.ajax({
			url : "hotel_room_insertR.ph",// data를 던질 곳  
			type : "post",
			data : fd,	// data가 json타입으로 넘어감.
			contentType : false,
			processData : false,
			error : function(xhr, status, error){
				console.log(error);
				Swal.fire({
	            	icon: 'error',
	            	//title: status + "--" + error + "--" + xhr.responseText,
	            	title: "오류가 발생했습니다.",
	            	showConfirmButton: true
	            });
			},
			success : function(data, status, xhr){
				if(status == "success"){
					Swal.fire({
		            	icon: 'success',
		            	title: '호텔 정보가 등록되었습니다.',
		            	showConfirmButton: false,
		            	timer: 1500
		            });
					location.href="?inc=hotel_room_list.ph"
				}else{
					Swal.fire({
		            	icon: 'error',
		            	title: '등록중 오류가 발생했습니다.',
		            	showConfirmButton: false,
		            	timer: 1500
		            });
				}
				
			} // end of success
		}); // end of ajax
			
	});
}


// 객실 옵션 체크 
room.chk = function(){
	if($("#no_smoking").is(":checked") == true){
		$("#no_smoking").val("1");
	}else{
		$("#no_smoking").val(0);
	}
	
	if($("#ocean_view").is(":checked") == true){
		$("#ocean_view").val("1");
	}else{
		$("#ocean_view").val(0);
	}
	if($("#city_view").is(":checked") == true){
		$("#city_view").val("1");
	}else{
		$("#city_view").val(0);
	}
	
	if($("#mt_view").is(":checked") == true){
		$("#mt_view").val("1");
	}else{
		$("#mt_view").val(0);
	}
	
	console.log("val" + $("#no_smoking").val());
	
}