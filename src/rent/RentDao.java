package rent;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import rent_parameter.CompanyPm;
import rent_parameter.DateVo;



public class RentDao {
	SqlSession sqlSession;
	public RentDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<rent_parameter.CompanyVo> companySearch(String placeMain ,String placeSub ,String rentDate , String returnDate , long between){
		List<rent_parameter.CompanyVo> list = null;
		try {
			Timestamp rDate = TimeMaker(rentDate);
			Timestamp tDate = TimeMaker(returnDate);
			CompanyPm pm = new CompanyPm(placeMain,placeSub,rDate,tDate,between);
			list = sqlSession.selectList("rent.company",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
	public List<rent_parameter.CompanyVo> companyFillter(String placeMain ,String placeSub ,String rentDate , String returnDate , long between,String companyCheck,String airconCheck,String gearCheck,String doorCheck,String maxPeopleCheck,String priceCheck,String kindCheck){
		List<rent_parameter.CompanyVo> list = null;
		try {
			Timestamp rDate = TimeMaker(rentDate);
			Timestamp tDate = TimeMaker(returnDate);
			CompanyPm pm = new CompanyPm(placeMain,placeSub,rDate,tDate,between,companyCheck,airconCheck,gearCheck,doorCheck,maxPeopleCheck,priceCheck,kindCheck);
			list = sqlSession.selectList("rent.companyFillter",pm);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
	
	public Timestamp TimeMaker(String date) {
		String year = date.substring(6,10);
		String day = date.substring(3,5);
		String month = date.substring(0,2);
		String hour = date.substring(11,13);
		String min = date.substring(14,16);
		String a = date.substring(17,19);
		
		if(a.equals("pm")) {
			int h = Integer.parseInt(hour)+12;
			hour = String.valueOf(h);
		}
		String now = year+"-"+month+"-"+day+" "+hour+":"+min+":00.0";
		Timestamp t = Timestamp.valueOf(now);
		return t;
	}
	
	public DateVo paramTime(String date) {
		String year = date.substring(6,10);
		String day = date.substring(3,5);
		String month = date.substring(0,2);
		String hour = date.substring(11,13);
		String min = date.substring(14,16);
		String a = date.substring(17,19);
		
		if(a.equals("pm")) {
			int h = Integer.parseInt(hour)+12;
			hour = String.valueOf(h);
		}
		String now = year+"-"+month+"-"+day+" "+hour+":"+min+":00.0";
		DateVo dv = new DateVo(now,year,day,month,hour,min);
		return dv;
	}
	
	public long DateBettween(String date1,String date2) {
		String year1 = date1.substring(6,10);
		String day1 = date1.substring(3,5);
		String month1 = date1.substring(0,2);
		String hour1 = date1.substring(11,13);
		String min1 = date1.substring(14,16);
		String a1 = date1.substring(17,19);
		
		if(a1.equals("pm")) {
			int h = Integer.parseInt(hour1)+12;
			hour1 = String.valueOf(h);
		}
		String now1 = year1+"-"+month1+"-"+day1+" "+hour1+":"+min1+":00.0";
		
		String year2 = date2.substring(6,10);
		String day2 = date2.substring(3,5);
		String month2 = date2.substring(0,2);
		String hour2 = date2.substring(11,13);
		String min2 = date2.substring(14,16);
		String a2 = date2.substring(17,19);
		
		if(a2.equals("pm")) {
			int h = Integer.parseInt(hour2)+12;
			hour2 = String.valueOf(h);
		}
		String now2 = year2+"-"+month2+"-"+day2+" "+hour2+":"+min2+":00.0";
		
		
		Timestamp t1 = Timestamp.valueOf(now1);
		Timestamp t2 = Timestamp.valueOf(now2);
		long diff = t2.getTime() - t1.getTime();
		long between = diff / (60*60*1000);
		return between;
		
	}
	
	public int DateBettweenDay(String date1,String date2) {
		System.out.println(date1 +"--" + date2);
		String year1 = date1.substring(6,10);
		String day1 = date1.substring(3,5);
		String month1 = date1.substring(0,2);
		String hour1 = date1.substring(11,13);
		String min1 = date1.substring(14,16);
		String a1 = date1.substring(17,19);
		
		if(a1.equals("pm")) {
			int h = Integer.parseInt(hour1)+12;
			hour1 = String.valueOf(h);
		}
		String now1 = year1+"-"+month1+"-"+day1+" "+hour1+":"+min1+":00.0";
		
		String year2 = date2.substring(6,10);
		String day2 = date2.substring(3,5);
		String month2 = date2.substring(0,2);
		String hour2 = date2.substring(11,13);
		String min2 = date2.substring(14,16);
		String a2 = date2.substring(17,19);
		
		if(a2.equals("pm")) {
			int h = Integer.parseInt(hour2)+12;
			hour2 = String.valueOf(h);
		}
		String now2 = year2+"-"+month2+"-"+day2+" "+hour2+":"+min2+":00.0";
		
		
		Timestamp t1 = Timestamp.valueOf(now1);
		Timestamp t2 = Timestamp.valueOf(now2);
		long diff = t2.getTime() - t1.getTime();
		int between = (int) (diff / (60*60*1000*24));
		return between;
		
	}
}
