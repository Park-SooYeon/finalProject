package rent;

import java.util.Date;

public class reserveVo {
	private String reserveSerial;	//예약번호 ex)MRT-001
	private int carSerial;			//차번호
	private String memberId;		//회원 아이디
	private String email;			//이메일
	private String phone;			//핸드폰 번호
	private Date rentDate;			//인수일자
	private Date returnDate;		//반납일자
	private char state;				//판매 상태 'y' or 'n'
	private char fullcover;			//풀커버 보호상품 유무 'y' or 'n'
	private String payment;			//결제수단
	private String cancelReason;	//취소사유
	private Date cancleDate;		//취소날짜
	
	public reserveVo() {
		
	}

	public String getReserveSerial() {
		return reserveSerial;
	}

	public void setReserveSerial(String reserveSerial) {
		this.reserveSerial = reserveSerial;
	}

	public int getCarSerial() {
		return carSerial;
	}

	public void setCarSerial(int carSerial) {
		this.carSerial = carSerial;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRentDate() {
		return rentDate;
	}

	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public char getState() {
		return state;
	}

	public void setState(char state) {
		this.state = state;
	}

	public char getFullcover() {
		return fullcover;
	}

	public void setFullcover(char fullcover) {
		this.fullcover = fullcover;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public Date getCancleDate() {
		return cancleDate;
	}

	public void setCancleDate(Date cancleDate) {
		this.cancleDate = cancleDate;
	}
	
	
}
