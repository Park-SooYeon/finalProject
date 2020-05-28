package rent_parameter;

import java.sql.Timestamp;

public class CarViewPm {
	int car_serial;
	Timestamp rentDate;
	Timestamp returnDate;
	long between;
	
	public CarViewPm(int car_serial,	Timestamp rentDate,	Timestamp returnDate,	long between){
		this.car_serial = car_serial;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.between = between;
	}

	public int getCar_serial() {
		return car_serial;
	}

	public void setCar_serial(int car_serial) {
		this.car_serial = car_serial;
	}

	public Timestamp getRentDate() {
		return rentDate;
	}

	public void setRentDate(Timestamp rentDate) {
		this.rentDate = rentDate;
	}

	public Timestamp getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}

	public long getBetween() {
		return between;
	}

	public void setBetween(long between) {
		this.between = between;
	}
	
}
