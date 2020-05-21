package partner;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.DitailViewVo;
import bean.Factory;

public class PtnHtCompDao {
	SqlSession sqlSession;
	
	public PtnHtCompDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<DitailViewVo> select(){
		List<DitailViewVo> list = null;
		
		try {
			list = sqlSession.selectList("hotel.select");
		}catch(Exception ex) {
			ex.toString();
		}finally {
			return list;
		}
	}
} 
