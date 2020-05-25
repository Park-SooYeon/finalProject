package rent_parameter;

import java.sql.Timestamp;

public class test {
	
	public test() {}
	public long TimeMaker(String date) {
		String date1 ="05/13/2020 09:00 am";
		String date2 ="05/20/2020 09:00 am";
		
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
		System.out.println(now1);
		
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
		System.out.println(now2);
		
		
		Timestamp t1 = Timestamp.valueOf(now1);
		Timestamp t2 = Timestamp.valueOf(now2);
		long diff = t2.getTime() - t1.getTime();
		long between = diff / (60*60*1000*24);
		System.out.println(t1.getTime());
		System.out.println(t2.getTime());
		System.out.println(between);
		return between;
	}

	public static void main(String[] args) {
		String date = "05/13/2020 09:00 am";
		test t = new test();
		t.TimeMaker(date);

	}

}
