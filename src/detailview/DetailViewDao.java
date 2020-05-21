package detailview;

import org.apache.ibatis.session.SqlSession;

import bean.DetailViewVo;
import bean.Factory;
import bean.PlaceVo;

public class DetailViewDao {
	SqlSession sqlSession;
	
	public DetailViewDao() {
		sqlSession = Factory.getFactory().openSession();		
	}
	
	public DetailViewVo view(int place_serial) {		
		DetailViewVo vo = null;
		PlaceVo pVo = null;
		try {
			vo = sqlSession.selectOne("detailView.view", place_serial);			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
		
	}

}
