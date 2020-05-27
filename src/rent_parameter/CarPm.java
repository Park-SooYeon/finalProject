package rent_parameter;

public class CarPm {
	int car_serial;
	long between;
	
	public CarPm(int car_serial , long between){
		this.car_serial = car_serial;
		this.between = between;
	}

	public int getCar_serial() {
		return car_serial;
	}

	public void setCar_serial(int car_serial) {
		this.car_serial = car_serial;
	}

	public long getBetween() {
		return between;
	}

	public void setBetween(long between) {
		this.between = between;
	}
	
}
