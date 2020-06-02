package rent_parameter;

import java.sql.Timestamp;

public class ReservePm {
	int reserve_serial;
	int car_serial;
	String member_id;
	String email;
	String phone;
	String rentDate;
	String returnDate;
	String fullcover;
	String payment;
	int price;
	String place_main;
	String place_sub;
	String reserved_date;
	
	public ReservePm(String member_id,String email) {
		this.member_id = member_id;
		this.email = email;
	}
	
	public ReservePm(int car_serial,String member_id,String email,String phone,String rentDate,String returnDate,String fullcover,String payment,int price,String m , String s) {
		this.car_serial = car_serial;
		this.member_id = member_id;
		this.email = email;
		this.phone = phone;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.fullcover = fullcover;
		this.payment = payment;
		this.price = price;
		this.place_main = m;
		this.place_sub = s;
	}
	public int getReserve_serial() {
		return reserve_serial;
	}

	public void setReserve_serial(int reserve_serial) {
		this.reserve_serial = reserve_serial;
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

	public String getReserved_date() {
		return reserved_date;
	}

	public void setReserved_date(String reserved_date) {
		this.reserved_date = reserved_date;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRentDate() {
		return rentDate;
	}
	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
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


}
