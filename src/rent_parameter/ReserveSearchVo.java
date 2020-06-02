package rent_parameter;

public class ReserveSearchVo {
	CarViewVo vo;
	DateVo dateVo1;
	DateVo dateVo2;
	
	public ReserveSearchVo(CarViewVo vo,DateVo dateVo1,DateVo dateVo2) {
		this.vo = vo;
		this.dateVo1 = dateVo1;
		this.dateVo2 = dateVo2;
	}

	

	

	public CarViewVo getVo() {
		return vo;
	}

	public void setVo(CarViewVo vo) {
		this.vo = vo;
	}

	public DateVo getDateVo1() {
		return dateVo1;
	}

	public void setDateVo1(DateVo dateVo1) {
		this.dateVo1 = dateVo1;
	}

	public DateVo getDateVo2() {
		return dateVo2;
	}

	public void setDateVo2(DateVo dateVo2) {
		this.dateVo2 = dateVo2;
	}
	
}
