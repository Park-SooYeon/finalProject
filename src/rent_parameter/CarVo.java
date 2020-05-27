package rent_parameter;

public class CarVo {
	int car_serial;
	String car_name;
	int price;
	int door;
	String gear;
	int max_people;
	int big_bag;
	int small_bag;
	char aircon;
	char reservation;
	char theft;
	char my_car;
	String photo;
	double review;
	
	CarVo(){
		
	}

	public int getCar_serial() {
		return car_serial;
	}

	public void setCar_serial(int car_serial) {
		this.car_serial = car_serial;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDoor() {
		return door;
	}

	public void setDoor(int door) {
		this.door = door;
	}

	public String getGear() {
		return gear;
	}

	public void setGear(String gear) {
		this.gear = gear;
	}

	public int getMax_people() {
		return max_people;
	}

	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}

	public int getBig_bag() {
		return big_bag;
	}

	public void setBig_bag(int big_bag) {
		this.big_bag = big_bag;
	}

	public int getSmall_bag() {
		return small_bag;
	}

	public void setSmall_bag(int small_bag) {
		this.small_bag = small_bag;
	}

	public char getAircon() {
		return aircon;
	}

	public void setAircon(char aircon) {
		this.aircon = aircon;
	}

	public char getReservation() {
		return reservation;
	}

	public void setReservation(char reservation) {
		this.reservation = reservation;
	}

	public char getTheft() {
		return theft;
	}

	public void setTheft(char theft) {
		this.theft = theft;
	}

	public char getMy_car() {
		return my_car;
	}

	public void setMy_car(char my_car) {
		this.my_car = my_car;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public double getReview() {
		return review;
	}

	public void setReview(double review) {
		this.review = review;
	}
	
}
