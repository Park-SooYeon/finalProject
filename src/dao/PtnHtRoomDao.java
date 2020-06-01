package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.roomPhotoVo;
import bean.roomVo;

public class PtnHtRoomDao {
	SqlSession sqlSession;
	
	public PtnHtRoomDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	// 파트너 아이디로 파트너 시리얼 가져오기
	public int getSerial(String mId) {
		int serial = 0;
		try {
			serial = sqlSession.selectOne("hotel.select_serial", mId);
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return serial;
		}
	}
	
	public List<roomVo> select(int serial){
		List<roomVo> list = null;
		try {
			list = sqlSession.selectList("room.select", serial);

		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
	public int insert(roomVo vo, List<roomPhotoVo> attList) {
		int result = 0;
		try {
			
			int cnt = sqlSession.insert("room.insert", vo);
			System.out.println("cnt : " + cnt);
			
			if(cnt<1) {
				System.out.println("본문 저장중 오류 발생");
				throw new Exception("본문 저장중 오류 발생");
			}
			
			
			//uploadVo.setPlace_serial(vo.getPlace_serial());
			
			for(roomPhotoVo rmVo : attList) {
				
				cnt = sqlSession.insert("room.att_insert", rmVo);
				System.out.println("cnt2 : " + cnt);
				
				if(cnt<1) {
					System.out.println("첨부 데이터 저장중 오류 발생");
					throw new Exception("첨부 데이터 저장중 오류 발생");
				}
				
			}
			
			sqlSession.commit();
			result = 1;
			
		}catch(Exception ex) {
			sqlSession.rollback();
			ex.printStackTrace();
			result = 0;
			
		}finally {
			System.out.println("dao result : " + result);
			return result;
		}
	}
	
	public List<roomPhotoVo> getAttList(int serial){
		List<roomPhotoVo> attList = null;
		
		try {
			attList = sqlSession.selectList("room.att_list", serial);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//sqlSession.close();
			return attList;
		}
	}
}
