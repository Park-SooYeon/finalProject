package bean;

public class DetailViewVo {
	int place_serial;
	int partner_serial;
	int place_code; //0 즐길거리(문화시설), 1 즐길거리(관광지), 2 음식점, 3 축제, 4 호텔
	String place_name;
	String place_location;
	int latitude;
	int longitude;
	int grade;
	int state;
	int breakfast;
	int wifi;
	int parking;
	int room_serial;
	
	int avg_repu; //총점 평균
	
	int avg_serv; // 서비스점수 평균
	int avg_acces; // 접근성점수 평균
	int avg_price; // 가격점수 평균
	int avg_scale; // 규모점수 평균
	int avg_food; // 음식점수 평균
	int cnt_review; //총 리뷰갯수
	
	
	int photo_serial;
	String photo_name;
	
	
	public int getPlace_serial() {
		return place_serial;
	}
	public void setPlace_serial(int place_serial) {
		this.place_serial = place_serial;
	}
	public int getPartner_serial() {
		return partner_serial;
	}
	public void setPartner_serial(int partner_serial) {
		this.partner_serial = partner_serial;
	}
	public int getPlace_code() {
		return place_code;
	}
	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_location() {
		return place_location;
	}
	public void setPlace_location(String place_location) {
		this.place_location = place_location;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	
	
	public int getAvg_repu() {
		return avg_repu;
	}
	public void setAvg_repu(int avg_repu) {
		this.avg_repu = avg_repu;
	}
	public int getAvg_serv() {
		return avg_serv;
	}
	public void setAvg_serv(int avg_serv) {
		this.avg_serv = avg_serv;
	}
	public int getAvg_acces() {
		return avg_acces;
	}
	public void setAvg_acces(int avg_acces) {
		this.avg_acces = avg_acces;
	}
	public int getAvg_price() {
		return avg_price;
	}
	public void setAvg_price(int avg_price) {
		this.avg_price = avg_price;
	}
	public int getAvg_scale() {
		return avg_scale;
	}
	public void setAvg_scale(int avg_scale) {
		this.avg_scale = avg_scale;
	}
	public int getAvg_food() {
		return avg_food;
	}
	public void setAvg_food(int avg_food) {
		this.avg_food = avg_food;
	}	
	public int getCnt_review() {
		return cnt_review;
	}
	public void setCnt_review(int cnt_review) {
		this.cnt_review = cnt_review;
	}
	
	
	public int getPhoto_serial() {
		return photo_serial;
	}
	public void setPhoto_serial(int photo_serial) {
		this.photo_serial = photo_serial;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	public int getRoom_serial() {
		return room_serial;
	}
	public void setRoom_serial(int room_serial) {
		this.room_serial = room_serial;
	}
	
	

}
