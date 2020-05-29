package rent_parameter;

import java.sql.Timestamp;

public class ReservePm {
	int car_serial;
	String member_id;
	String email;
	String phone;
	String rentDate;
	String returnDate;
	String fullcover;
	String payment;
	int price;
	
	public ReservePm(int car_serial,String member_id,String email,String phone,String rentDate,String returnDate,String fullcover,String payment,int price) {
		this.car_serial = car_serial;
		this.member_id = member_id;
		this.email = email;
		this.phone = phone;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.fullcover = fullcover;
		this.payment = payment;
		this.price = price;
	}


}
