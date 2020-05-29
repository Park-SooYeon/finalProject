/**
 * http://usejsdoc.org/
 */

let hotel = {}

let ReservMove = function(){
	location.href = './?inc=hotel/reservation.jsp';
}

hotel.placeMove = function(local) {
	location.href = './?inc=hotelMain.ht&local='+ local;
}
