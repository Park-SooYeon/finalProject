package dao;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class SubMainDao { 
	
	SqlSession sqlSession;
	
	public SubMainDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
}
