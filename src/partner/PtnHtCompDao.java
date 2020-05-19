package partner;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class PtnHtCompDao {
	SqlSession sqlSession;
	
	public PtnHtCompDao() {
		sqlSession = Factory.getFactory().openSession();
	}
}
