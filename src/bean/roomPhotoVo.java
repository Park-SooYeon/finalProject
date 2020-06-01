package bean;

public class roomPhotoVo {
  int photo_serial;
  int rooms_serial;
  String photo; // 객실 사진명
  
  String oriFile;
  String sysFile;
  
  public roomPhotoVo() {}
  
  public roomPhotoVo(String oriFile, String sysFile) {
	  this.oriFile = oriFile;
	  this.sysFile = sysFile;
  }
  public int getPhoto_serial() {
	return photo_serial;
}
public void setPhoto_serial(int photo_serial) {
	this.photo_serial = photo_serial;
}
public int getRooms_serial() {
	return rooms_serial;
}
public void setRooms_serial(int rooms_serial) {
	this.rooms_serial = rooms_serial;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public String getOriFile() {
	return oriFile;
}
public void setOriFile(String oriFile) {
	this.oriFile = oriFile;
}
public String getSysFile() {
	return sysFile;
}
public void setSysFile(String sysFile) {
	this.sysFile = sysFile;
}
  
  
  
  
  
}
