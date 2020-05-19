package ditailview;

import org.apache.ibatis.session.SqlSession;

import bean.DitailViewVo;
import bean.Factory;

public class DitailViewDao {
	SqlSession sqlSession;
	
	public DitailViewDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public DitailViewVo view(int place_serial) {
		DitailViewVo vo = null;
		
		try {
			vo = sqlSession.selectOne("ditailView.view", place_serial);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
		
	}

}
