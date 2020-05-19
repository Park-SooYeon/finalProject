package rent;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;



public class RentDao {
	SqlSession sqlSession;
	public RentDao() {
		sqlSession = Factory.getFactory().openSession();
	}
}
