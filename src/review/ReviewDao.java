package review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.Page;
import bean.ReviewVo;

public class ReviewDao {
	SqlSession sqlSession;
	
	public ReviewDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<ReviewVo> select(Page p){
		List<ReviewVo> list = null;
		try {
			int totList = sqlSession.selectOne("review.count", p);
			p.setTotListSize(totList);
			p.pageCompute();
			list = sqlSession.selectList("review.select", p);
			
		}catch(Exception ex){
			ex.printStackTrace();			
		}
		
		return list;
		
	}

}
