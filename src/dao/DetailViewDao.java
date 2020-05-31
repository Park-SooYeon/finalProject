package dao;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class DetailViewDao {
	SqlSession sqlSession;
	
	public DetailViewDao() {
		sqlSession = Factory.getFactory().openSession();		
	}
	
	/*public DetailViewVo view(int place_serial) {		
		DetailViewVo vo = null;		
		try {
			vo = sqlSession.selectOne("detailView.view", place_serial);			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
		
	}
	
	public List<PlaceVo> photoView(int place_serial) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("detailView.photoView", place_serial);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	*/

}
