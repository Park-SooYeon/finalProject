package rent_parameter;

public class ReviewPm {
	String reserve_serial;
	int review_1;
	int review_2;
	int review_3;
	int review_4;
	int review_5;
	int review_6;
	int review_7;
	String scale;
	String take_overtime;
	String good_news;
	String bad_news;
	int car_serial;
	
	public ReviewPm(String reserve_serial,int review_1,int review_2,int review_3,int review_4,int review_5,int review_6,int review_7,String scale,String take_overtime,String good_news,String bad_news,int car_serial) {
		this.reserve_serial = reserve_serial;
		this.review_1 = review_1;
		this.review_2 = review_2;
		this.review_3 = review_3;
		this.review_4 = review_4;
		this.review_5 = review_5;
		this.review_6 = review_6;
		this.review_7 = review_7;
		this.scale = scale;
		this.take_overtime = take_overtime;
		this.good_news = good_news;
		this.bad_news = bad_news;
		this.car_serial = car_serial;
	}

	public String getReserve_serial() {
		return reserve_serial;
	}

	public void setReserve_serial(String reserve_serial) {
		this.reserve_serial = reserve_serial;
	}

	public int getReview_1() {
		return review_1;
	}

	public void setReview_1(int review_1) {
		this.review_1 = review_1;
	}

	public int getReview_2() {
		return review_2;
	}

	public void setReview_2(int review_2) {
		this.review_2 = review_2;
	}

	public int getReview_3() {
		return review_3;
	}

	public void setReview_3(int review_3) {
		this.review_3 = review_3;
	}

	public int getReview_4() {
		return review_4;
	}

	public void setReview_4(int review_4) {
		this.review_4 = review_4;
	}

	public int getReview_5() {
		return review_5;
	}

	public void setReview_5(int review_5) {
		this.review_5 = review_5;
	}

	public int getReview_6() {
		return review_6;
	}

	public void setReview_6(int review_6) {
		this.review_6 = review_6;
	}

	public int getReview_7() {
		return review_7;
	}

	public void setReview_7(int review_7) {
		this.review_7 = review_7;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getTake_overtime() {
		return take_overtime;
	}

	public void setTake_overtime(String take_overtime) {
		this.take_overtime = take_overtime;
	}

	public String getGood_news() {
		return good_news;
	}

	public void setGood_news(String good_news) {
		this.good_news = good_news;
	}

	public String getBad_news() {
		return bad_news;
	}

	public void setBad_news(String bad_news) {
		this.bad_news = bad_news;
	}
	
	
}
