package bean;

public class PlanVo {

	int days_serial;
	int trip_list_serial;
	int place_serial;
	int trip_order;
	String trip_day;
	String end_date;
	
	PlaceVo p;
	
	
	
	
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public PlaceVo getP() {
		return p;
	}
	public void setP(PlaceVo p) {
		this.p = p;
	}
	public int getDays_serial() {
		return days_serial;
	}
	public void setDays_serial(int days_serial) {
		this.days_serial = days_serial;
	}
	public int getTrip_list_serial() {
		return trip_list_serial;
	}
	public void setTrip_list_serial(int trip_list_serial) {
		this.trip_list_serial = trip_list_serial;
	}
	public int getPlace_serial() {
		return place_serial;
	}
	public void setPlace_serial(int place_serial) {
		this.place_serial = place_serial;
	}
	public int getTrip_order() {
		return trip_order;
	}
	public void setTrip_order(int trip_order) {
		this.trip_order = trip_order;
	}
	public String getTrip_day() {
		return trip_day;
	}
	public void setTrip_day(String trip_day) {
		this.trip_day = trip_day;
	}
	@Override
	public String toString() {
		return "PlanVo [days_serial=" + days_serial + ", trip_list_serial=" + trip_list_serial + ", place_serial="
				+ place_serial + ", trip_order=" + trip_order + ", trip_day=" + trip_day + "]";
	}
	
	
	
}
