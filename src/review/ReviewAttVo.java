package review;

public class ReviewAttVo {
	int photo_serial;
	int review_serial; 
	String photo_name = "";
	
	
	public int getPhoto_serial() {
		return photo_serial;
	}
	public void setPhoto_serial(int photo_serial) {
		this.photo_serial = photo_serial;
	}
	public int getReview_serial() {
		return review_serial;
	}
	public void setReview_serial(int review_serial) {
		this.review_serial = review_serial;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}	

}
