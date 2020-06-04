/**
 * http://usejsdoc.org/
 */

let hotel = {}




hotel.searchMove = function(local) {
	location.href = './?inc=hotel_index.ht&local=' + local 
}


hotel.hotelDetailMove = function(place_serial) {

	frm_ht.place_serial.value=place_serial;
	let param = $('#frm_ht').serialize();
	
	location.href = './?inc=hotelDetailView.ht&place_serial='+place_serial
}


hotel.reserveMove = function() {
	location.href = './?inc=hotel/reservation.jsp';
}

let goNextReserv = function(){

	$('#reserv').toggle();
	
	var start_String = $("input[name=start_date]").val();
	var end_String = $("input[name=end_date]").val();
	
	if(start_String !=null && end_String != null){
		
		
		var start_Array = start_String.split("/");
		var end_Array = end_String.split("/");
		
		var start_date = new Date(start_Array[0] , Number(start_Array[1])-1,start_Array[2]);
		var end_date = new Date(end_Array[0] , Number(end_Array[1])-1,end_Array[2]);
		
		var beetween_day = (end_date.getTime() - start_date.getTime())/1000/60/60/24;
		
		
	 
		
		var price = $("#price").val();
		
		var totPrice = Number(price)*Number(beetween_day); 
		
		 $("#total_price").text(totPrice);
		 $("#between_day").text(beetween_day);
		
	}
	
	

}


hotel.goReserve = function(){

    let rooms_serial=$('#rooms_serial').val();
    let place_serial =$('#place_serial').val();
    
	let start_date=$('#start_date').val();
	let end_date=$('#end_date').val();
    let totPrice = $('#total_price').val();
    let member_name = $('#member_name').val();
    let email = $('#email').val();
    let betweenday =$("#between_day").val();
    let place_name=$("#place_name").val();
    let place_location=$("#place_location").val();
    
	console.log(totPrice+member_name+email);
	
	$.ajax({
			
			url : "hotelReserv.ht",
			type :"post",
			data : {
				"rooms_serial":rooms_serial,
				"place_serial":place_serial,
				"start_date":start_date,
				"end_date" :end_date,
				"totPrice" :totPrice,
				"member_name":member_name ,
				"email" : email,
			     "betweenday":betweenday,
			     "place_name":place_name,
			     "place_location":place_location
			},
		
			
			success : function(data){
				if($.trim(data) == "no"){
				     alert("예약 중 오류가 발생했습니다.");
				
					
				}else{
					 alert("예약이 정상적으로 완료되어 이메일로 예약 내역이 발송됐습니다.ㄴ");
			
					
					
				}
				
			}
			
		
		});
	
			
	
	
	
	

}

