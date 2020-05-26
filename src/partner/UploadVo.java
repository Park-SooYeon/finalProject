package partner;

import org.springframework.web.multipart.MultipartFile;

public class UploadVo {
	int place_serial;
	int photo_serial;
	
	String oriFile;
	String sysFile;
	
	public UploadVo() {}
	
	public UploadVo(String oriFile, String sysFile) {
		this.oriFile = oriFile;
		this.sysFile = sysFile;
	}
	
	public int getPlace_serial() {
		return place_serial;
	}
	public void setPlace_serial(int place_serial) {
		this.place_serial = place_serial;
	}
	public int getPhoto_serial() {
		return photo_serial;
	}
	public void setPhoto_serial(int photo_serial) {
		this.photo_serial = photo_serial;
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
