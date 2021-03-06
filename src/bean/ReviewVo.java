package bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVo {
	int review_serial;
	String member_id;
	int place_serial;
	int review_type;
	int reputation;
	String review_title;
	String review_content;
	String visit_date;
	String review_date;
	int service;
	int cleanliness;
	int accessibility;
	int price;
	int scale;
	int food;
	
	ReportVo report;
	List<Review_PhotoVo> r_photo;

	
	int photo_serial;
	String photo_name;
	String sysFile;
	
	int like_serial;
	String like_id;
	
	PlaceVo p;
	
	List<MultipartFile> fileUpload;	
	
	// 리뷰 포스팅 가져올때 필요한 프로필 사진
	String member_photo;

	String nickName;
	int likecount;
	
	
	int review_cnt;
	
	
	
	
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public List<MultipartFile> getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(List<MultipartFile> fileUpload) {
		this.fileUpload = fileUpload;
	}
	public PlaceVo getP() {
		return p;
	}
	public void setP(PlaceVo p) {
		this.p = p;
	}
	
	public int getReview_serial() {
		return review_serial;
	}
	public void setReview_serial(int review_serial) {
		this.review_serial = review_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPlace_serial() {
		return place_serial;
	}
	public void setPlace_serial(int place_serial) {
		this.place_serial = place_serial;
	}
	public int getReview_type() {
		return review_type;
	}
	public void setReview_type(int review_type) {
		this.review_type = review_type;
	}
	public int getReputation() {
		return reputation;
	}
	public void setReputation(int reputation) {
		this.reputation = reputation;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getService() {
		return service;
	}
	public void setService(int service) {
		this.service = service;
	}
	public int getCleanliness() {
		return cleanliness;
	}
	public void setCleanliness(int cleanliness) {
		this.cleanliness = cleanliness;
	}
	public int getAccessibility() {
		return accessibility;
	}
	public void setAccessibility(int accessibility) {
		this.accessibility = accessibility;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getScale() {
		return scale;
	}
	public void setScale(int scale) {
		this.scale = scale;
	}
	public int getFood() {
		return food;
	}
	public void setFood(int food) {
		this.food = food;
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
	public int getLike_serial() {
		return like_serial;
	}
	public void setLike_serial(int like_serial) {
		this.like_serial = like_serial;
	}
	public String getLike_id() {
		return like_id;
	}
	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}
	public ReportVo getReport() {
		return report;
	}
	public void setReport(ReportVo report) {
		this.report = report;
	}
	
	
	
	public List<Review_PhotoVo> getR_photo() {
		return r_photo;
	}
	public void setR_photo(List<Review_PhotoVo> r_photo) {
		this.r_photo = r_photo;
	}
	public String getSysFile() {
		return sysFile;
	}
	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}
	@Override
	public String toString() {
		return "ReviewVo [review_serial=" + review_serial + ", member_id=" + member_id + ", place_serial="
				+ place_serial + ", review_type=" + review_type + ", reputation=" + reputation + ", review_title="
				+ review_title + ", review_content=" + review_content + ", visit_date=" + visit_date + ", review_date="
				+ review_date + ", service=" + service + ", cleanliness=" + cleanliness + ", accessibility="
				+ accessibility + ", price=" + price + ", scale=" + scale + ", food=" + food + ", photo_serial="
				+ photo_serial + ", photo_name=" + photo_name + ", like_serial=" + like_serial + ", like_id=" + like_id
				+ ", p=" + p + "]";
	}
	
	
	

}
