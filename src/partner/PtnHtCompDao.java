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
	
	public List<PlaceVo> select(String mId){
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("hotel.select", mId);
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
	public int insert(String member_id, PlaceVo vo, List<AttVo> attList) {
		int result = 0;
		int serial = 0;
		try {

			// 파트너 시리얼 값 세팅 
			serial = sqlSession.selectOne("hotel.select_serial", member_id);
			vo.setPartner_serial(serial);
			
			System.out.println(serial);
			
			int cnt = sqlSession.insert("hotel.insert", vo);
			System.out.println("asddsa");
			if(cnt<1) {
				System.out.println("본문 저장중 오류 발생");
				throw new Exception("본문 저장중 오류 발생");
				
			}
			for(AttVo attVo : attList) {
				cnt = sqlSession.insert("hotel.att_insert", attVo);
				if(cnt<1) {
					System.out.println("첨부 데이터 저장중 오류 발생");
					throw new Exception("첨부 데이터 저장중 오류 발생");
				}
			}
			
			sqlSession.commit();
			result = 1;
			
		}catch(Exception ex) {
			ex.toString();
			result = 0;
			
		}finally {
			System.out.println("dao result : " + result);
			return result;
		}
	}
} 
