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


	frm_ht.start_date=$('#start_date').val();
	frm_ht.end_date=$('#end_date').val();
	
	alert($('#start_date').val());
	let param = $('#frm_ht').serialize();

	
	$.ajax({
			
			url : "hotelReserv.ht",
			type :"post",
			data : param,
		
			contentType: false,
			processData : false,
			error : function(xhr,status,error){
				console.log(error);
			},
			success : function(data,xhr,status){
				
			}
			
		
		});
	
			
	
	
	
	

}

