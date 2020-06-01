package bean;

import java.util.List;

public class roomVo {
   int rooms_serial;
   int place_serial;
   int rooms_name;
   int price;
   int people;
   int no_smoking;
   int mt_view;
   int ocean_view;
   int city_view;
   
   String place_name;
   String room_type;
   int state;
   
   List<roomPhotoVo> photos;
   
public int getRooms_serial() {
	return rooms_serial;
}
public void setRooms_serial(int rooms_serial) {
	this.rooms_serial = rooms_serial;
}
public int getPlace_serial() {
	return place_serial;
}
public void setPlace_serial(int place_serial) {
	this.place_serial = place_serial;
}
public int getRooms_name() {
	return rooms_name;
}
public void setRooms_name(int rooms_name) {
	this.rooms_name = rooms_name;
	switch(rooms_name) {
	case 1:
		this.room_type = "디럭스";
		break;
	case 2:
		this.room_type = "패밀리";
		break;
	case 3:
		this.room_type = "스위트";
		break;
	}
	
	
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getPeople() {
	return people;
}
public void setPeople(int people) {
	this.people = people;
}
public int getNo_smoking() {
	return no_smoking;
}
public void setNo_smoking(int no_smoking) {
	this.no_smoking = no_smoking;
}
public int getMt_view() {
	return mt_view;
}
public void setMt_view(int mt_view) {
	this.mt_view = mt_view;
}
public int getOcean_view() {
	return ocean_view;
}
public void setOcean_view(int ocean_view) {
	this.ocean_view = ocean_view;
}
public int getCity_view() {
	return city_view;
}
public void setCity_view(int city_view) {
	this.city_view = city_view;
}
public String getPlace_name() {
	return place_name;
}
public void setPlace_name(String place_name) {
	this.place_name = place_name;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public List<roomPhotoVo> getPhotos() {
	return photos;
}
public void setPhotos(List<roomPhotoVo> photos) {
	this.photos = photos;
}
public String getRoom_type() {
	return room_type;
}
public void setRoom_type(String room_type) {
	this.room_type = room_type;
}

@Override
public String toString() {
	return "roomVo [place_serial=" + place_serial + ", rooms_serial=" + rooms_serial + ", price="
			+ price + ", people=" + people + ", no_smoking=" + no_smoking + ", rooms_name="
			+ rooms_name + ", ocean_view=" + ocean_view + ", city_view=" + city_view + ", room_type=" + room_type
			+ ", state=" + state + ", mt_view=" + mt_view + ", place_name=" + place_name 
			+ ", photos=" + photos + "]";
}

	
	
	
	
}
