/**
 * http://usejsdoc.org/
 */

let hotel = {}

let ReservMove = function(){
	location.href = './?inc=reservation.ht';
}



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