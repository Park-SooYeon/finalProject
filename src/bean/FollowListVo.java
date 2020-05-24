package bean;

public class FollowListVo {

	int follow_serial;
	String member_id;
	String target_id;
	String follow_time;
	
	public int getFollow_serial() {
		return follow_serial;
	}
	public void setFollow_serial(int follow_serial) {
		this.follow_serial = follow_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public String getFollow_time() {
		return follow_time;
	}
	public void setFollow_time(String follow_time) {
		this.follow_time = follow_time;
	}
	
	
	
}
