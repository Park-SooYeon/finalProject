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
	
	public Map<String, Integer> selectInfo(int serial) {
		Map<String, Integer> info = new HashMap<>(); 
		int result = 0;
		try {
			System.out.println("serial : " + serial);
			result = sqlSession.selectOne("hotel_order.sales", serial);
			info.put("sales", result);
			
			result = sqlSession.selectOne("hotel_order.cancleCnt", serial);
			info.put("cancleCnt", result);
			
			result = sqlSession.selectOne("hotel_order.orderCnt", serial);
			info.put("orderCnt", result);
			
			Collection<Integer> values = info.values();
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
	

}
