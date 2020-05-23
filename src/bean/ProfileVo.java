package bean;

public class ProfileVo {
	int profile_serial;
	String member_id;
	String member_city;
	String member_web;
	String member_info;
	
	String member_photo;
	String nickname;
	String email;
	String mDate;
	
	
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getProfile_serial() {
		return profile_serial;
	}
	public void setProfile_serial(int profile_serial) {
		this.profile_serial = profile_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_city() {
		return member_city;
	}
	public void setMember_city(String member_city) {
		this.member_city = member_city;
	}
	public String getMember_web() {
		return member_web;
	}
	public void setMember_web(String member_web) {
		this.member_web = member_web;
	}
	public String getMember_info() {
		return member_info;
	}
	public void setMember_info(String member_info) {
		this.member_info = member_info;
	}
	@Override
	public String toString() {
		return "ProfileVo [profile_serial=" + profile_serial + ", member_id=" + member_id + ", member_city="
				+ member_city + ", member_web=" + member_web + ", member_info=" + member_info + ", member_photo="
				+ member_photo + ", nickname=" + nickname + ", email=" + email + "]";
	}
	
	
	
}
