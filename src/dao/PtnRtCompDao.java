package dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import rent_parameter.CompanyVo;

public class PtnRtCompDao {
	SqlSession sqlSession;
	
	public PtnRtCompDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	// 파트너 아이디로 파트너 시리얼 가져오기
	public int getSerial(String mId) {
		int serial = 0;
		try {
			serial = sqlSession.selectOne("partner_rent.select_serial", mId);
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return serial;
		}
	}
	
	
	public List<CompanyVo> select(int serial){
		List<CompanyVo> list = null;
		try {
			System.out.println("adssaddas");
			list = sqlSession.selectList("partner_rent.select", serial);
			
			System.out.println("serial : " + serial);
			System.out.println("list : " + list.size());
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			
			return list;
		}
	}
	
}
