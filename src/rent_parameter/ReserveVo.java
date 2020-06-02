package rent_parameter;

import java.sql.Timestamp;

public class ReserveVo {
	String reserve_serial;
	int car_serial;
	String member_id;
	String email;
	Timestamp rent_date;
	Timestamp return_date;
	String fullcover;
	String payment;
	int price;
	String place_main;
	String place_sub;
	Timestamp reserved_date;
	String review_check;
	
	public ReserveVo() {
		
	}
	
	


	public String getReview_check() {
		return review_check;
	}

	public void setReview_check(String review_check) {
		this.review_check = review_check;
	}

	public String getReserve_serial() {
		return reserve_serial;
	}
	public void setReserve_serial(String reserve_serial) {
		this.reserve_serial = reserve_serial;
	}
	public int getCar_serial() {
		return car_serial;
	}
	public void setCar_serial(int car_serial) {
		this.car_serial = car_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRentDate() {
		return rent_date;
	}
	public void setRentDate(Timestamp rent_date) {
		this.rent_date = rent_date;
	}
	public Timestamp getReturnDate() {
		return return_date;
	}
	public void setReturnDate(Timestamp return_date) {
		this.return_date = return_date;
	}
	public String getFullcover() {
		return fullcover;
	}
	public void setFullcover(String fullcover) {
		this.fullcover = fullcover;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPlace_main() {
		return place_main;
	}
	public void setPlace_main(String place_main) {
		this.place_main = place_main;
	}
	public String getPlace_sub() {
		return place_sub;
	}
	public void setPlace_sub(String place_sub) {
		this.place_sub = place_sub;
	}
	public Timestamp getReserved_date() {
		return reserved_date;
	}
	public void setReserved_date(Timestamp reserved_date) {
		this.reserved_date = reserved_date;
	}
	
	
}
