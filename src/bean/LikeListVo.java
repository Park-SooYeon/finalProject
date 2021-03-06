package bean;

public class LikeListVo {
	int like_serial;
	String member_id;
	int trip_list_serial;
	int place_serial;
	int partner_serial;
	String trip_name;
	
	PlaceVo p;
	
	public String getTrip_name() {
		return trip_name;
	}
	public void setTrip_name(String trip_name) {
		this.trip_name = trip_name;
	}
	public PlaceVo getP() {
		return p;
	}
	public void setP(PlaceVo p) {
		this.p = p;
	}
	public int getLike_serial() {
		return like_serial;
	}
	public void setLike_serial(int like_serial) {
		this.like_serial = like_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public int getPartner_serial() {
		return partner_serial;
	}
	public void setPartner_serial(int partner_serial) {
		this.partner_serial = partner_serial;
	}
	
	@Override
	public String toString() {
		return "LikeListVo [like_serial=" + like_serial + ", member_id=" + member_id + ", trip_list_serial="
				+ trip_list_serial + ", place_serial=" + place_serial + ", partner_serial=" + partner_serial
				+ ", trip_name=" + trip_name + ", p=" + p.toString() + "]";
	}
	
	
	

}