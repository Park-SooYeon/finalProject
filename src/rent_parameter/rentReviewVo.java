package rent_parameter;

public class rentReviewVo {
	int review_serial;
	int car_serial;
	String resrve_serial;
	String scale;
	String take_overtime;
	String good_news;
	String bad_news;
	String writed_date;
	double score;
	
	public rentReviewVo() {
		
	}

	public int getReview_serial() {
		return review_serial;
	}

	public void setReview_serial(int review_serial) {
		this.review_serial = review_serial;
	}

	public int getCar_serial() {
		return car_serial;
	}

	public void setCar_serial(int car_serial) {
		this.car_serial = car_serial;
	}

	public String getResrve_serial() {
		return resrve_serial;
	}

	public void setResrve_serial(String resrve_serial) {
		this.resrve_serial = resrve_serial;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
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

	public String getWrited_date() {
		return writed_date;
	}

	public void setWrited_date(String writed_date) {
		this.writed_date = writed_date;
	}
	
}
