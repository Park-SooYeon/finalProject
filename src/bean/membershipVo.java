package bean;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class membershipVo {
	
String member_id;
   String email;
   String pwd;
   String member_name;
   Date mDate;
   int state;
   String delete_reason;
   String member_photo;
   String nickName;
   String phone;
   
   String member_city;
   String member_info;
   String member_web;

   MultipartFile imgFile;
   
   
   public String getMember_web() {
	return member_web;
}

public void setMember_web(String member_web) {
	this.member_web = member_web;
}

public String getMember_city() {
	return member_city;
}

public void setMember_city(String member_city) {
	this.member_city = member_city;
}

public String getMember_info() {
	return member_info;
}

public void setMember_info(String member_info) {
	this.member_info = member_info;
}

public MultipartFile getImgFile() {
	return imgFile;
}

public void setImgFile(MultipartFile imgFile) {
	this.imgFile = imgFile;
}

public membershipVo() {
	   
   }
   
   public membershipVo(String member_id,String email,String pwd , 
		   String member_name,Date mDate, int state,String nickName,String phone) {
	
	   this.member_id=member_id;
	   this.email=email;
	   this.pwd = pwd;
	   this.member_name =member_name;
	   this.mDate=mDate;
	   this.state=state;
	   this.nickName=nickName;
	   this.phone=phone;
	
	   
	   
	   
   }
   
   
  
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getMember_id() {
	return member_id;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getMember_name() {
	return member_name;
}
public void setMember_name(String member_name) {
	this.member_name = member_name;
}
public Date getmDate() {
	return mDate;
}
public void setmDate(Date mDate) {
	this.mDate = mDate;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public String getDelete_reason() {
	return delete_reason;
}
public void setDelete_reason(String delete_reason) {
	this.delete_reason = delete_reason;
}
public String getMember_photo() {
	return member_photo;
}
public void setMember_photo(String member_photo) {
	this.member_photo = member_photo;
}
public String getNickName() {
	return nickName;
}
public void setNickName(String nickName) {
	this.nickName = nickName;
}

@Override
public String toString() {
	return "membershipVo [member_id=" + member_id + ", email=" + email + ", pwd=" + pwd + ", member_name=" + member_name
			+ ", mDate=" + mDate + ", state=" + state + ", delete_reason=" + delete_reason + ", member_photo="
			+ member_photo + ", nickName=" + nickName + ", phone=" + phone + ", member_city=" + member_city
			+ ", member_info=" + member_info + ", member_web=" + member_web + ", imgFile=" + imgFile + "]";
}


}
