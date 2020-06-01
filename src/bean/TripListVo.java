package bean;

public class TripListVo {

	int trip_list_serial;
	String member_id;
	String trip_name;
	int days_count;
	String start_date;
	String end_date;
	int trip_auth;
	String trip_date;
	
	// 해당 place가 호텔인지 api인지 알아보기 위한 flag (mybatis에서 parameter로 전달)
	// hotel or api
	String flag;
	
	// 날짜만 입력했을 경우, 일수 계산하기 위한 필드
	int another_days;
	PlaceVo p;
	
	
	
	public int getAnother_days() {
		return another_days;
	}
	public void setAnother_days(int another_days) {
		this.another_days = another_days+1;
		// 끝 날짜 - 시작날짜 + 1 => 일수
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public PlaceVo getP() {
		return p;
	}
	public void setP(PlaceVo p) {
		this.p = p;
	}
	public int getTrip_list_serial() {
		return trip_list_serial;
	}
	public void setTrip_list_serial(int trip_list_serial) {
		this.trip_list_serial = trip_list_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTrip_name() {
		return trip_name;
	}
	public void setTrip_name(String trip_name) {
		this.trip_name = trip_name;
	}
	public int getDays_count() {
		return days_count;
	}
	public void setDays_count(int days_count) {
		this.days_count = days_count;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getTrip_auth() {
		return trip_auth;
	}
	public void setTrip_auth(int trip_auth) {
		this.trip_auth = trip_auth;
	}
	public String getTrip_date() {
		return trip_date;
	}
	public void setTrip_date(String trip_date) {
		this.trip_date = trip_date;
	}
	
	@Override
	public String toString() {
		return "TripListVo [trip_list_serial=" + trip_list_serial + ", member_id=" + member_id + ", trip_name="
				+ trip_name + ", days_count=" + days_count + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", trip_auth=" + trip_auth + ", trip_date=" + trip_date + "]";
	}
	
	
	
}
