package rent;

public class CarVo {
	private int carSerial; 		//차량번호
	private int companySerial; 	//회사번호
	private String carName; 	//차이름
	private String kind;		//차량종류
	private int price;			//시간당 가격
	private int door;			//도어 수
	private String gear;		//기어 타입 수동or자동
	private int maxPeople;		//최대 인원
	private int bogBag;			//큰가방
	private int smallBag;		//작은가방
	private char aircon;		//에어컨 유무 'y' or 'n'
	private char reservation; 	//예약변경가능 불가능 'y' or 'n'
	private char theft;			//도난보험 유무 'y' or 'n'
	private char myCar;			//자차보험 유무 'y' or 'n'
	private String photo;		//차량사진
	
	public CarVo() {
		
	}

	public int getCarSerial() {
		return carSerial;
	}

	public void setCarSerial(int carSerial) {
		this.carSerial = carSerial;
	}

	public int getCompanySerial() {
		return companySerial;
	}

	public void setCompanySerial(int companySerial) {
		this.companySerial = companySerial;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
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

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public int getBogBag() {
		return bogBag;
	}

	public void setBogBag(int bogBag) {
		this.bogBag = bogBag;
	}

	public int getSmallBag() {
		return smallBag;
	}

	public void setSmallBag(int smallBag) {
		this.smallBag = smallBag;
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

	public char getMyCar() {
		return myCar;
	}

	public void setMyCar(char myCar) {
		this.myCar = myCar;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
}
