package bean;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PlaceVo {
	int place_serial;
	int partner_serial;
	int place_code;
	String place_type;
	String place_name;
	String place_location;
	int latitude;
	int longitude;
	int grade;
	int state;
	int breakfast;
	int wifi;
	int parking;
	
	int local_code;
	String local_name;
	
	int reputation;
	int review_cnt;
	
	
	int photo_serial;
	String photo_name;
	
	String place_tel;
	int room_serial;
	int room_cnt; // 보유객실 수 
	
	
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
		switch(place_code) {
		case 1:
			this.place_type = "happy";
			break;
		case 2:
			this.place_type = "food";
			break;
		case 3:
			this.place_type = "festival";
			break;
		}
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
		try {
			String fileName = URLEncoder.encode(photo_name, "UTF-8");
			fileName = fileName.replaceAll("\\+", "%20");
			this.photo_name = fileName;
					
		} catch (UnsupportedEncodingException e) {
			System.out.println("파일명 인코딩 중 오류 발생");
			e.printStackTrace();
		}
	}
	public int getReputation() {
		return reputation;
	}
	public void setReputation(int reputation) {
		this.reputation = reputation;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}
	public int getLocal_code() {
		return local_code;
	}
	public void setLocal_code(int local_code) {
		this.local_code = local_code;
		switch(local_code) {
		case 1:
			this.local_name = "seoul";
			break;
		case 2:
			this.local_name = "jeju";
			break;
		case 3:
			this.local_name = "busan";
			break;
		case 4:
			this.local_name = "daegu";
			break;
		case 5:
			this.local_name = "gyeonggi";
			break;
		case 6:
			this.local_name = "incheon";
			break;
		}
	}
	public String getLocal_name() {
		return local_name;
	}
	public String getPlace_type() {
		return place_type;
	}
	
	
	public String getPlace_tel() {
		return place_tel;
	}
	public void setPlace_tel(String place_tel) {
		this.place_tel = place_tel;
	}
	public int getRoom_serial() {
		return room_serial;
	}
	public void setRoom_serial(int room_serial) {
		this.room_serial = room_serial;
	}
	public int getRoom_cnt() {
		return room_cnt;
	}
	public void setRoom_cnt(int room_cnt) {
		this.room_cnt = room_cnt;
	}
	@Override
	public String toString() {
		return "PlaceVo [place_serial=" + place_serial + ", partner_serial=" + partner_serial + ", place_code="
				+ place_code + ", place_type=" + place_type + ", place_name=" + place_name + ", place_location="
				+ place_location + ", latitude=" + latitude + ", longitude=" + longitude + ", grade=" + grade
				+ ", state=" + state + ", breakfast=" + breakfast + ", wifi=" + wifi + ", parking=" + parking
				+ ", local_code=" + local_code + ", local_name=" + local_name + ", reputation=" + reputation
				+ ", review_cnt=" + review_cnt + ", photo_serial=" + photo_serial + ", photo_name=" + photo_name
				+ ", place_tel=" + place_tel + ", room_serial=" + room_serial + ", room_cnt=" + room_cnt + "]";
	}
	
	
	
}
