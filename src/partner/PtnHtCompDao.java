package partner;

import java.util.ArrayList;
import java.util.List;

import javax.el.ELException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import bean.Factory;
import bean.PlaceVo;

public class PtnHtCompDao {
	SqlSession sqlSession;
	
	public PtnHtCompDao() {
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
	
	public List<PlaceVo> select(int serial){
		List<PlaceVo> list = null;
		try {
			
			list = sqlSession.selectList("hotel.select", serial);
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
	public int insert(int serial, PlaceVo vo, List<UploadVo> attList) {
		int result = 0;
		try {
			
			vo.setPartner_serial(serial);
			
			
			
			System.out.println("dao partner_serial : " + vo.getPartner_serial());
			System.out.println("dao place_name : " + vo.getPlace_name());
			System.out.println("dao place_location : " + vo.getPlace_location());
			System.out.println("dao latitude : " + vo.getLatitude());
			System.out.println("dao longitude : " + vo.getLongitude());
			System.out.println("dao grade : " + vo.getGrade());
			System.out.println("dao breakfast : " + vo.getBreakfast());
			System.out.println("dao wifi : " + vo.getWifi());
			System.out.println("dao parking : " + vo.getParking());
			System.out.println("dao local_code : " + vo.getLocal_code() );
			
			
			
			int cnt = sqlSession.insert("hotel.insert", vo);
			System.out.println("cnt : " + cnt);
			
			if(cnt<1) {
				System.out.println("본문 저장중 오류 발생");
				throw new Exception("본문 저장중 오류 발생");
			}
			
			
			//uploadVo.setPlace_serial(vo.getPlace_serial());
			
			for(UploadVo upVo : attList) {
				
				cnt = sqlSession.insert("hotel.att_insert", upVo);
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
	
	
	public PlaceVo view(int serial) {
		PlaceVo vo = null;
		try {
			vo = sqlSession.selectOne("hotel.view", serial);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public List<UploadVo> getAttList(int serial){
		List<UploadVo> attList = null;
		
		try {
			attList = sqlSession.selectList("hotel.att_list", serial);
	
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//sqlSession.close();
			return attList;
		}
	}
} 
