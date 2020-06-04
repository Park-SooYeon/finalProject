package dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import rent_parameter.ReserveVo;

public class PtnRtOrderDao {
	SqlSession sqlSession;
	
	public PtnRtOrderDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public Map<String, String> selectInfo(int serial) {
		Map<String, String> info = new HashMap<>(); 
		String result1 = null;
		String result2 = null;
		String result3 = null;
		try {
			result1 = sqlSession.selectOne("partner_rent.sales", serial);
			
			if(result1 == null && result1 == "") {
				info.put("sales", "0");
			}else {
				info.put("sales", result1);
			}
			
			
			
			result2 = sqlSession.selectOne("partner_rent.cancleCnt", serial);
			if(result2 == null && result2 == "") {
				info.put("cancleCnt", "0");
			}else {
				info.put("cancleCnt", result2);
			}
			
			result3 = sqlSession.selectOne("partner_rent.orderCnt", serial);		
			if(result3 == null && result3 == "") {
				info.put("orderCnt", "0");
			}else {
				info.put("orderCnt", result3);
			}
			
			
			Collection<String> values = info.values();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			
		}
		
		return info;
	}
	
	public List<ReserveVo> select(int serial){
		List<ReserveVo> list = null;
		
		try {
			list = sqlSession.selectList("partner_rent.reserve_select", serial);
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
			return list;
		}
	}
}
