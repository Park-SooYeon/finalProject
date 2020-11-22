package vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true) // 모든 필드의 데이터를 받아오지 않아도 될 때 사용
public class RestDataVo {
	String addr1;
	String contentid;
	String contenttypeid;
	String firstimage;
	String title;
	
	int reputation;
	int review_cnt;
	
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
}
