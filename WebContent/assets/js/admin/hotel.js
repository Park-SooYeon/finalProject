/**
 * travelista 파트너 페이지 - 호텔관리 관련 js
 * 작성자 : lje
 * 작성일자 : 2020.05
 */
let ptn = {};
ptn.init = function(){ 
	$("#main").load("dashboard.ph");
}

ptn.func = function(){
	
	// 호텔 수정버튼 클릭 시, 페이지 이동
	$("#btnPtHtModify").click(function(){
		var serial = Number($('#pserial').val());
		$('#frmAdmHtCompView').attr('action', "./?inc=hotel_comp_modify.ph").submit(); 
	});
	
	// 호텔 수정버튼 클릭 시 
	$("#btnPtHtSave").click(function(){
		// select, checkbox 값 세팅
		ptn.chk();
		
		let fd = new FormData($("#frmAdmHtCompModi")[0]);	// object형태로 데이터 만들어짐.
		
		$.ajax({
			url : "modifyR.ph",// data를 던질 곳  
			type : "post",
			data : fd,	// data가 json타입으로 넘어감.
			contentType : false,
			processData : false,
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
					Swal.fire({
		            	icon: 'success',
		            	title: '호텔 정보가 수정되었습니다.',
		            	showConfirmButton: false,
		            	timer: 1500
		            });
					location.href="?inc=hotel_comp_list.ph"
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
	
	// 호텔 삭제버튼 클릭 시 
	$("#btnPtHtDelete").click(function(){
		
		Swal.fire({
	        title: '호텔을 삭제하시겠습니까?',
	        text: "확인 버튼을 누르시면 호텔정보가 삭제됩니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	    	if (result.value) {
	    		let param = $("#frmAdmHtCompView").serialize();
	    		console.log("param : " + param);
	    		$.ajax({
	    			url : "deleteR.ph",
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
	    		            	title: '호텔 정보가 삭제되었습니다.',
	    		            	showConfirmButton: false,
	    		            	timer: 1500
	    					});
	                        
	    					location.href="?inc=hotel_comp_list.ph"; 
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
	
	// 호텔 등록 버튼 클릭 시, 데이터 입력
	$("#btnPtHtRegister").click(function(){
		// select, checkbox 값 세팅
		ptn.chk();
		
		let fd = new FormData($("#frmAdmHtCompAdd")[0]);	// object형태로 데이터 만들어짐.
		
		$.ajax({
			url : "insertR.ph",// data를 던질 곳  
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
					location.href="?inc=hotel_comp_list.ph"
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
	
	
	
}

 
ptn.go = function(i){
	var serial = Number($('#pserial').val(i));
	$('#frmAdmHtCompList').attr('action', "./?inc=hotel_comp_view.ph").submit(); 
}


// 호텔 옵션 체크
ptn.chk = function(){
	var value = $("#htPlaceNm option:selected").val();
	$("#htPlaceCode").val(value);
	
	var value = $("#PtnhtState option:selected").val();
	$("#PtnHtStatus").val(value);
	
	// 호텔옵션 선택여부 체크 
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
	
}


// 예약정보 상세 조회 
orderDtView = function(serial){	// 예약번호(booking_serial) 매개변수로 받아옴
	$("#bserial").val(serial);
	
	// modal id값 세팅
	$("#ModalHtOrderInfo").attr("id", "ModalHtOrderInfo_"+serial);
	$('#ModalHtOrderInfo_'+serial).modal();
	
	console.log("bserial : " +  $("#bserial").val());
	$('#ModalHtOrderInfo').modal({
		 // keyboard: false
	})
	//let fd = new FormData($("#frmAdmHtOrder")[0]);	// object형태로 데이터 만들어짐.
	let param = $("#frmAdmHtOrder").serialize();
	$.ajax({
		url : "hotel_order_view.ph",// data를 던질 곳  
		type : "post",
		data : param,	// data가 json타입으로 넘어감.
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
				// modal 값 세팅
				$("#ModalHtOrderInfo").attr("id", "ModalHtOrderInfo_"+serial);
				let state = $("#state_"+serial).html();
				let path = "../../images/myPage/";
				let img = $("#memberPhoto_"+serial).val();
				$("#profileImg").attr("src", path+img );
				$("#memberId").html($("#memberId_"+serial).html());
				$("#reserveDt").html($("#reserveDt_"+serial).html());
				$("#userNm").html($("#memberNm_"+serial).val());
				$("#serial").html($("#bserial_"+serial).html());
				$("#placeNm").html($("#placeNm_"+serial).html());
				$("#roomNm").html($("#roomNm_"+serial).html());
				
				$("#chkInDt").html($("#chkIn_"+serial).html());
				$("#chkOutDt").html($("#chkOut_"+serial).html());
				$("#state").html(state);
				
				// 예약 취소 상태인 경우 modal에서 예약 취소버튼 가리기
				if(state == "예약취소"){
					$("#ModalHtOrderInfo_"+serial+" #btnPtHtOrderCancle").addClass("d-none");
					$("#state").removeClass("badge-inverse-primary").addClass("badge-inverse-secondary text-muted");
				}
				
				// id에서 serial 삭제 
				$('#ModalHtOrderInfo_'+serial).on('hidden.bs.modal', function (e) {
					$('#ModalHtOrderInfo_'+serial).attr("id", "ModalHtOrderInfo");
				})
				
			}else{
				
			}
			
		} // end of success
	}); // end of ajax
	
}

// 예약 취소 버튼 클릭 이벤트
bookingCancle = function(){
	// booking serial 값 가져오기 
	let serial = $("#serial").html();
	
	Swal.fire({
        title: '예약을 취소하시겠습니까?',
        text: "확인 버튼을 누르시면 예약정보가 취소됩니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
    	if (result.value) {
    		let param = $("#frmAdmHtOrder").serialize();
    		
    		$.ajax({
    			url : "hotel_order_cancle.ph",
    			type : "get",
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
    		            	title: '예약이 취소되었습니다.',
    		            	showConfirmButton: false,
    		            	timer: 1500
    					});
    					//$('#ModalHtOrderInfo').modal('hide');
    					
    					$("#state").html("예약취소").toogleClass("badge badge-inverse-secondary text-muted font-weight-bold");
    					$(this).css("display", "none");
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
}
