package bean;

public class partnerVo {
    int partner_serial;
    String member_id;
    int business_number;//사업자 등록번호
    String partner_name; //회사명
    String partner_phone; 
    int state;
    String partner_location;//본사 주소
    
    
    membershipVo vo; 
    
    
	public membershipVo getVo() {
		return vo;
	}
	public void setVo(membershipVo vo) {
		this.vo = vo;
	}
	public int getPartner_serial() {
		return partner_serial;
	}
	public void setPartner_serial(int partner_serial) {
		this.partner_serial = partner_serial;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBusiness_number() {
		return business_number;
	}
	public void setBusiness_number(int business_number) {
		this.business_number = business_number;
	}
	public String getPartner_name() {
		return partner_name;
	}
	public void setPartner_name(String partner_name) {
		this.partner_name = partner_name;
	}
	public String getPartner_phone() {
		return partner_phone;
	}
	public void setPartner_phone(String partner_phone) {
		this.partner_phone = partner_phone;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getPartner_location() {
		return partner_location;
	}
	public void setPartner_location(String partner_location) {
		this.partner_location = partner_location;
	}
	
    
    
	
	
}
