package rent_parameter;

public class rentReviewPm {
	int car_serial;
	String scale_kind;
	
	public rentReviewPm(int c,String b) {
		this.car_serial = c;
		this.scale_kind = b;
	}

	public int getCar_serial() {
		return car_serial;
	}

	public void setCar_serial(int car_serial) {
		this.car_serial = car_serial;
	}

	public String getScale_kind() {
		return scale_kind;
	}

	public void setScale_kind(String scale_kind) {
		this.scale_kind = scale_kind;
	}
	
}
