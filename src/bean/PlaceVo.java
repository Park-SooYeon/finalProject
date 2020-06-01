package bean;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import partner.UploadVo;

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
	
	
	MultipartFile fileName1;
	MultipartFile fileName2;
	MultipartFile fileName3;
	
	List<UploadVo> photos;
	
	String oriFile;
	
	
	
	
	public String getOriFile() {
		return oriFile;
	}
	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}
	public List<UploadVo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<UploadVo> photos) {
		this.photos = photos;
	}
	public MultipartFile getFileName1() {
		return fileName1;
	}
	public void setFileName1(MultipartFile fileName1) {
		this.fileName1 = fileName1;
	}
	public MultipartFile getFileName2() {
		return fileName2;
	}
	public void setFileName2(MultipartFile fileName2) {
		this.fileName2 = fileName2;
	}
	public MultipartFile getFileName3() {
		return fileName3;
	}
	public void setFileName3(MultipartFile fileName3) {
		this.fileName3 = fileName3;
	}
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
			this.place_type = "api";
			break;
		case 2:
			this.place_type = "hotel";
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
		this.photo_name = photo_name;
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
			this.local_name = "서울";
			break;
		case 2:
			this.local_name = "인천";
			break;
		case 3:
			this.local_name = "제주";
			break;
		case 4:
			this.local_name = "대구";
			break;
		case 6:
			this.local_name = "부산";
			break;
		case 31:
			this.local_name = "경기도";
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
				+ ", place_tel=" + place_tel + ", room_serial=" + room_serial + ", room_cnt=" + room_cnt 
				+ ", fileName1=" + fileName1 + ", fileName2=" + fileName2 + ", fileName3=" + fileName3 + ", photos=" + photos + ", oriFile=" + oriFile + "]";
	}
	
	
	
	
	
}
