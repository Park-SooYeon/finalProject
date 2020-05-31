package dao;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class PtnHtOrderDao {
	SqlSession sqlSession;
	
	public PtnHtOrderDao() {
		sqlSession = Factory.getFactory().openSession();
	}
}
