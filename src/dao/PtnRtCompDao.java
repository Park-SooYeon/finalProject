package dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.Factory;
import bean.hotelBookingVo;
import rent_parameter.CompanyVo;

public class PtnRtCompDao {
	SqlSession sqlSession;
	
	public PtnRtCompDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<CompanyVo> select(int serial){
		List<CompanyVo> list = null;
		try {
			
			list = sqlSession.selectList("rent.select", serial);

		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
}
