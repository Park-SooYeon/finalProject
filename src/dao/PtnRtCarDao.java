package partner;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class PtnRtCarDao {
	SqlSession sqlSession;
	
	public PtnRtCarDao() {
		sqlSession = Factory.getFactory().openSession();
	}
}
