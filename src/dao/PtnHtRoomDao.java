package dao;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class PtnHtRoomDao {
	SqlSession sqlSession;
	
	public PtnHtRoomDao() {
		sqlSession = Factory.getFactory().openSession();
	}
}
