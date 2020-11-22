package dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.hotelBookingVo;

public class PtnHtOrderDao {
	SqlSession sqlSession;
	
	public PtnHtOrderDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public Map<String, String> selectInfo(int serial) {
		Map<String, String> info = new HashMap<>(); 
		String result1 = null;
		String result2 = null;
		String result3 = null;
		try {
			System.out.println("serial : " + serial);
			result1 = sqlSession.selectOne("hotel_order.sales", serial);
			
			System.out.println("result1 : " + result1);
			if(result1 == null && result1 == "") {
				info.put("sales", "0");
			}else {
				info.put("sales", result1);
			}
			
			
			
			result2 = sqlSession.selectOne("hotel_order.cancleCnt", serial);
			System.out.println("result2 : " + result2);
			if(result2 == null && result2 == "") {
				info.put("cancleCnt", "0");
			}else {
				info.put("cancleCnt", result2);
			}
			
			result3 = sqlSession.selectOne("hotel_order.orderCnt", serial);
			System.out.println("result3 : " + result3);			
			if(result3 == null && result3 == "") {
				info.put("orderCnt", "0");
			}else {
				info.put("orderCnt", result3);
			}
			
			
			Collection<String> values = info.values();
			System.out.println("map : " + values);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			
		}
		
		return info;
	}
	
	public List<hotelBookingVo> select(int serial){
		List<hotelBookingVo> list = null;
		try {
			list = sqlSession.selectList("hotel_order.select", serial);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public hotelBookingVo view(int serial) {
		hotelBookingVo vo = null;
		
		try {
			vo = sqlSession.selectOne("hotel_order.view", serial);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public int modify(int serial) {
		int result = 0;
		try {
			int cnt = sqlSession.update("hotel_order.update", serial);
			if(cnt<1) throw new Exception("예약 취소중 오류 발생");
			
			sqlSession.commit();
			result=1;
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			return result;
		}
	}
	

}
