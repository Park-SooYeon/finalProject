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
	
	// 객실 등록 시, rooms_name 값 세팅
	$("#htRommType").change(function(){
		var value2 = $("#htRommType option:selected").val();
		$("#rooms_name").val(value2);
	});
	
	
	$("#btnPtRmRegister").click(function(){
		// select, checkbox 값 세팅
		room.chk();
		
		var value = $("#htCompNm option:selected").val();
		$("#place_serial").val(value);
		
		var value2 = $("#htRommType option:selected").val();
		$("#rooms_name").val(value2);
		
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

// 객실 상세정보 조회 (rooms_serial 매개변수로 받아옴.)
roomDetialView = function(serial){
	$("#rooms_serial").val(serial);
	
	let param = $("#frmAdmHtRmList").serialize();
	console.log($("#rooms_serial").val());
	
	$.ajax({
		url : "roomInfo.ph",// data를 던질 곳  
		type : "post",
		data : param,	// data가 json타입으로 넘어감.
		error : function(xhr, status, error){
			console.log(error);
			Swal.fire({
            	icon: 'error',
            	title: "오류가 발생했습니다.",
            	showConfirmButton: true
            });
		},
		success : function(data, status, xhr){
			if(status == "success"){
				$('#ModalHotelInfo').modal('show');
			}else{
				
			}
			
		} // end of success
	}); // end of ajax 
	$('#ModalHotelInfo').modal('show');
}