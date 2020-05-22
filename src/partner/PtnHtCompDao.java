package partner;

import java.util.ArrayList;
import java.util.List;

import javax.el.ELException;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.PlaceVo;

public class PtnHtCompDao {
	SqlSession sqlSession;
	
	public PtnHtCompDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<PlaceVo> select(){
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("hotel.select");
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
	public int insert(PlaceVo vo, List<AttVo> attList) {
		int result = 0;
		try {
			int cnt = sqlSession.insert("hotel.insert", vo);
			if(cnt<1) {
				throw new Exception("본문 저장중 오류 발생");
			}
			for(AttVo attVo : attList) {
				cnt = sqlSession.insert("hotel.att_insert", attVo);
				if(cnt<1) {
					throw new Exception("첨부 데이터 저장중 오류 발생");
				}
			}
		}catch(Exception ex) {
			ex.toString();
		}finally {
			return result;
		}
	}
} 
