package rent;

public class CompanyVo {
	private int companySerial;	//회사번호
	private int partnerSerial;	//파트너 번호
	private String companyName;	//회사이름
	private String address;		//회사 도로명 주소
	private String latitude;	//위도
	private String longitude;	//경도
	private String phone;		//회사 전화번호
	private char state;			//판매상태
	
	public CompanyVo() {
		
	}

	public int getCompanySerial() {
		return companySerial;
	}

	public void setCompanySerial(int companySerial) {
		this.companySerial = companySerial;
	}

	public int getPartnerSerial() {
		return partnerSerial;
	}

	public void setPartnerSerial(int partnerSerial) {
		this.partnerSerial = partnerSerial;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getState() {
		return state;
	}

	public void setState(char state) {
		this.state = state;
	}
	
	
}
