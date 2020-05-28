package rent_parameter;

public class CarPm {
	int company_serial;
	long between;
	String kindCheck;
	String airconCheck;
	String gearCheck;
	String doorCheck;
	String maxPeopleCheck;
	String priceCheck;
	public CarPm(int company_serial , long between ,String kindCheck,String airconCheck,String gearCheck,String doorCheck,String maxPeopleCheck,String priceCheck){
		this.company_serial = company_serial;
		this.between = between;
		this.kindCheck = kindCheck;
		this.airconCheck = airconCheck;
		this.gearCheck = gearCheck;
		this.doorCheck = doorCheck;
		this.maxPeopleCheck = maxPeopleCheck;
		this.priceCheck = priceCheck;
	}

	public int getCompany_serial() {
		return company_serial;
	}

	public void setCompany_serial(int company_serial) {
		this.company_serial = company_serial;
	}

	public String getKindCheck() {
		return kindCheck;
	}

	public void setKindCheck(String kindCheck) {
		this.kindCheck = kindCheck;
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

	public int getCar_serial() {
		return company_serial;
	}

	public void setCar_serial(int car_serial) {
		this.company_serial = car_serial;
	}

	public long getBetween() {
		return between;
	}

	public void setBetween(long between) {
		this.between = between;
	}
	
}
