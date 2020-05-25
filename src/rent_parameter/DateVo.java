package rent_parameter;

public class DateVo {
	String now;
	String year;
	String day;
	String month;
	String hour;
	String min;
	public DateVo(String now,String year,String day,String month,String hour,String min) {
		this.now = now;
		this.year = year;
		this.day = day;
		this.month = month;
		this.hour = hour;
		this.min = min;
	}
	public String getNow() {
		return now;
	}
	public void setNow(String now) {
		this.now = now;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	
}
