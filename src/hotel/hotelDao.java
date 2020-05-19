package hotel;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class hotelDao {

	SqlSession sqlSession;
	
	
	public hotelDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	
	
	
}