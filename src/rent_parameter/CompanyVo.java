package rent_parameter;

public class CompanyVo {
	private int company_serial;
	private String company_name;
	private String address;
	private String latitude;
	private String longitude;
	private int price;
	private int cars_count;
	
	String state;
	
	public CompanyVo() {
		
	}

	public int getCompany_serial() {
		return company_serial;
	}

	public void setCompany_serial(int company_serial) {
		this.company_serial = company_serial;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCars_count() {
		return cars_count;
	}

	public void setCars_count(int cars_count) {
		this.cars_count = cars_count;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
}
