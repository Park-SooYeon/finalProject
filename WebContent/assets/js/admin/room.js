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
	});
	
	// 객실 등록 시, rooms_name 값 세팅
	$("#htRommType").change(function(){
		var value2 = $("#htRommType option:selected").val();
		$("#rooms_name").val(value2);
	});
	
	
	// 객실 등록버튼 클릭 시, 
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
			
	}); // end of click event
	
	
	// 객실 수정 저장버튼 클릭 시 
	$("#btnPtRmSave").click(function(){
		// select, checkbox 값 세팅
		room.chk();
		
		var value = $("#htCompNm option:selected").val();
		$("#place_serial").val(value);
		
		var value2 = $("#htRommType option:selected").val();
		$("#rooms_name").val(value2);
		
		let fd = new FormData($("#frmAdmHtRoomModi")[0]);	// object형태로 데이터 만들어짐.
		
		$.ajax({
			url : "hotel_room_modifyR.ph",// data를 던질 곳  
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
		            	title: '호텔 정보가 수정되었습니다.',
		            	showConfirmButton: false,
		            	timer: 1500
		            });
					location.href="?inc=hotel_room_list.ph"
				}else{
					Swal.fire({
		            	icon: 'error',
		            	title: '수정중 오류가 발생했습니다.',
		            	showConfirmButton: false,
		            	timer: 1500
		            });
				}
				
			} // end of success
		}); // end of ajax
	});
	
	
	// 객실정보 삭제 버튼 클릭 시,
	$("#btnPtRmDelete").click(function(){
		Swal.fire({
	        title: '객실을 삭제하시겠습니까?',
	        text: "확인 버튼을 누르시면 객실정보가 삭제됩니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	    	if (result.value) {
	    		let param = $("#frmAdmHtRoomModi").serialize();
	    		console.log("param : " + param);
	    		$.ajax({
	    			url : "hotel_room_delete.ph",
	    			type : "post",
	    			data : param , 
	    			error : function(xhr, status, error){
	    				console.log(error);
	    				Swal.fire({
	    	            	icon: 'error',
	    	            	title: status + "--" + error + "--" + xhr.responseText,
	    	            	title: "오류가 발생했습니다.",
	    	            	showConfirmButton: true
	    	            });
	    			},
	    			success : function(result, xhr, data){
	    				console.log("result" + result);
	    				console.log("xhr" + xhr);
	    				console.log("data" + data);
	    				
	    				if(xhr == "success"){
	    					Swal.fire({
	    						icon: 'success',
	    		            	title: '객실 정보가 삭제되었습니다.',
	    		            	showConfirmButton: false,
	    		            	timer: 1500
	    					});
	                        
	    					location.href="?inc=hotel_room_list.ph"; 
	    				}else{
	    					Swal.fire({
	    		   				icon: 'error',
	    		   				text: '오류가 발생했습니다.' 
	    		   			});
	    				}
	    			}	// end of success 
	    		}).fail(function() {
	            	Swal.fire({
	       				icon: 'error',
	       				text: '오류가 발생했습니다.' 
	       			});
	            })
	        }else{	// 취소버튼 클릭 시 
	        	
	        }
	    });
		
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
  
	//$('#ModalHotelInfo').modal('show');
	
    $("#rooms_serial").val(serial);
    $('#frmAdmHtRmList').attr('action', "./?inc=hotel_room_view.ph").submit();
    
    /*
    let param = $("#frmAdmHtRmList").serialize();
    //AJAX Call
    $.ajax({
		url : "roomInfo.ph",// data를 던질 곳  
		type : "post",
		data : param,	// data가 json타입으로 넘어감.
		error : function(xhr, status, error){
			console.log(error);
		},
		success : function(data, status, xhr){
			console.log(data);
			console.log(xhr);

			
		} // end of success
	}); // end of ajax 
   
	console.log($("#rooms_serial").val());
	
	//$('#ModalHotelInfo').modal('show');
	*/
}