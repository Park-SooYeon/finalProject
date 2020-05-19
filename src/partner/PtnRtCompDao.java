package partner;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class PtnRtCompDao {
	SqlSession sqlSession;
	
	public PtnRtCompDao() {
		sqlSession = Factory.getFactory().openSession();
	}
}
