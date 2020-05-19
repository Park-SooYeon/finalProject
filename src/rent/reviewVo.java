package rent;

import java.util.Date;

public class reviewVo {
	private int reviewSerial;		//리뷰번호
	private int carSerial;			//차량번호
	private String reserveSerial;	//에약번호
	private int review1;			//렌트비용대비 전반적인 평가 (1~10)
	private int review2;			//카운터직원의 친절도 및 전문성 (1~10)
	private int review3;			//차량인수 소요시간(1~10)
	private int review4;			//차량반납 소요시간(1~10)
	private int review5;			//차량 청결도 (1~10)
	private int review6;			//차량의 전반적인상태(1~10)
	private int review7;			//재선택 가능성 (1~10)
	private String scale;			//규모(가족,그룹,커플,개인)
	private String takeOverTime;	//차량 인수까지 걸린시간 ex)1~10분 , 10~20분 , 20~30분 , 30분 이상 ...
	private String goodNews;		//좋았던 점
	private String badNews;			//안좋았던 점
	private Date writedDate;		//작성일
	
	public reviewVo() {
		
	}

	public int getReviewSerial() {
		return reviewSerial;
	}

	public void setReviewSerial(int reviewSerial) {
		this.reviewSerial = reviewSerial;
	}

	public int getCarSerial() {
		return carSerial;
	}

	public void setCarSerial(int carSerial) {
		this.carSerial = carSerial;
	}

	public String getReserveSerial() {
		return reserveSerial;
	}

	public void setReserveSerial(String reserveSerial) {
		this.reserveSerial = reserveSerial;
	}

	public int getReview1() {
		return review1;
	}

	public void setReview1(int review1) {
		this.review1 = review1;
	}

	public int getReview2() {
		return review2;
	}

	public void setReview2(int review2) {
		this.review2 = review2;
	}

	public int getReview3() {
		return review3;
	}

	public void setReview3(int review3) {
		this.review3 = review3;
	}

	public int getReview4() {
		return review4;
	}

	public void setReview4(int review4) {
		this.review4 = review4;
	}

	public int getReview5() {
		return review5;
	}

	public void setReview5(int review5) {
		this.review5 = review5;
	}

	public int getReview6() {
		return review6;
	}

	public void setReview6(int review6) {
		this.review6 = review6;
	}

	public int getReview7() {
		return review7;
	}

	public void setReview7(int review7) {
		this.review7 = review7;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getTakeOverTime() {
		return takeOverTime;
	}

	public void setTakeOverTime(String takeOverTime) {
		this.takeOverTime = takeOverTime;
	}

	public String getGoodNews() {
		return goodNews;
	}

	public void setGoodNews(String goodNews) {
		this.goodNews = goodNews;
	}

	public String getBadNews() {
		return badNews;
	}

	public void setBadNews(String badNews) {
		this.badNews = badNews;
	}

	public Date getWritedDate() {
		return writedDate;
	}

	public void setWritedDate(Date writedDate) {
		this.writedDate = writedDate;
	}
	
}
