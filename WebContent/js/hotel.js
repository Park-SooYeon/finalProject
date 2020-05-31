/**
 * http://usejsdoc.org/
 */

let hotel = {}

let ReservMove = function(){
	location.href = './?inc=hotel/reservation.jsp';
}



hotel.searchMove = function(local) {
	location.href = './?inc=hotel_index.ht&local=' + local 
}
