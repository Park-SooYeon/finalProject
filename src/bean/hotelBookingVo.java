package bean;

import java.util.Date;

public class hotelBookingVo {
     int booking_serial;
     int rooms_serial;
     String member_id;
     int place_serial;
     String member_name; // 투숙인 이름. member_id에 해당하는 이름과 다를 수 있음.
     int state;
     Date checkin_date;
     Date checkout_date;
     Date cancle_date;
	 String cancle_reason;
	 
	 String place_name; // 호텔명 
	 String rooms_name; // 객실타입
	 
	 
	 
	 
	 int price; // 가격 
	 Date reserve_date;	// 예약일자
	 String member_photo;
	 
	 String place_location;// 호텔 주소

	 
	 
	 String totalPrice; // 총 결제 금액입니당
	 String email;
	 
	 
	 String betweenday; // 숙박일

	 
	 
	 
 
	public String getBetweenday() {
		return betweenday;
	}
	public void setBetweenday(String betweenday) {
		this.betweenday = betweenday;
	}
	
	public String getPlace_location() {
		return place_location;
	}
	public void setPlace_location(String place_location) {
		this.place_location = place_location;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getBooking_serial() {
		return booking_serial;
	}
	public void setBooking_serial(int booking_serial) {
		this.booking_serial = booking_serial;
	}
	public int getRooms_serial() {
		return rooms_serial;
	}
	public void setRooms_serial(int rooms_serial) {
		this.rooms_serial = rooms_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPlace_serial() {
		return place_serial;
	}
	public void setPlace_serial(int place_serial) {
		this.place_serial = place_serial;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(Date checkin_date) {
		this.checkin_date = checkin_date;
	}
	public Date getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(Date checkout_date) {
		this.checkout_date = checkout_date;
	}
	public Date getCancle_date() {
		return cancle_date;
	}
	public void setCancle_date(Date cancle_date) {
		this.cancle_date = cancle_date;
	}
	public String getCancle_reason() {
		return cancle_reason;
	}
	public void setCancle_reason(String cancle_reason) {
		this.cancle_reason = cancle_reason;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getRooms_name() {
		return rooms_name;
		
	}
	public void setRooms_name(String rooms_name) {
		this.rooms_name = rooms_name;

		
		
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	
	
	 
	 
	 
	 
}
