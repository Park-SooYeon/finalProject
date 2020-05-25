package rent_parameter;

import java.sql.Timestamp;

public class CompanyPm {
	private String placeMain;
	private String placeSub;
	private Timestamp rentDate;
	private Timestamp returnDate;
	private long between;
	
	String companyCheck;
	String airconCheck;
	String gearCheck;
	String doorCheck;
	String maxPeopleCheck;
	String priceCheck;
	String kindCheck;
	
	public CompanyPm(String m,String s,Timestamp r,Timestamp t,long b) {
		this.placeMain = m;
		this.placeSub = s;
		this.rentDate = r;
		this.returnDate = t;
		this.between = b;
	}
	public CompanyPm(String m,String s,Timestamp r,Timestamp t,long b,String companyCheck,	String airconCheck,	String gearCheck,String doorCheck,	String maxPeopleCheck,	String priceCheck ,String kindCheck) {
		this.placeMain = m;
		this.placeSub = s;
		this.rentDate = r;
		this.returnDate = t;
		this.between = b;
		this.companyCheck = companyCheck;
		this.airconCheck = airconCheck;
		this.doorCheck = doorCheck;
		this.maxPeopleCheck = maxPeopleCheck;
		this.priceCheck = priceCheck;
		this.kindCheck = kindCheck;
	}

	public String getCompanyCheck() {
		return companyCheck;
	}
	public void setCompanyCheck(String companyCheck) {
		this.companyCheck = companyCheck;
	}
	public String getAirconCheck() {
		return airconCheck;
	}
	public void setAirconCheck(String airconCheck) {
		this.airconCheck = airconCheck;
	}
	public String getGearCheck() {
		return gearCheck;
	}
	public void setGearCheck(String gearCheck) {
		this.gearCheck = gearCheck;
	}
	public String getDoorCheck() {
		return doorCheck;
	}
	public void setDoorCheck(String doorCheck) {
		this.doorCheck = doorCheck;
	}
	public String getMaxPeopleCheck() {
		return maxPeopleCheck;
	}
	public void setMaxPeopleCheck(String maxPeopleCheck) {
		this.maxPeopleCheck = maxPeopleCheck;
	}
	public String getPriceCheck() {
		return priceCheck;
	}
	public void setPriceCheck(String priceCheck) {
		this.priceCheck = priceCheck;
	}
	public String getKindCheck() {
		return kindCheck;
	}
	public void setKindCheck(String kindCheck) {
		this.kindCheck = kindCheck;
	}
	public long getBetween() {
		return between;
	}

	public void setBetween(long between) {
		this.between = between;
	}

	public String getPlaceMain() {
		return placeMain;
	}

	public void setPlaceMain(String placeMain) {
		this.placeMain = placeMain;
	}

	public String getPlaceSub() {
		return placeSub;
	}

	public void setPlaceSub(String placeSub) {
		this.placeSub = placeSub;
	}

	public Timestamp getRentDate() {
		return rentDate;
	}

	public void setRentDate(Timestamp rentDate) {
		this.rentDate = rentDate;
	}

	public Timestamp getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}
	
	
}
