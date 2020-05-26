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
	
	public List<PlaceVo> select(String mId){
		List<PlaceVo> list = null;
		int serial = 0;
		try {
			serial = sqlSession.selectOne("hotel.select_serial", mId);
			
			list = sqlSession.selectList("hotel.select", serial);
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
	public int insert(String member_id, PlaceVo vo, List<UploadVo> attList) {
		int result = 0;
		int serial = 0;
		try {
			System.out.println("dao start");
			
			System.out.println("member_id" + member_id);
			// 파트너 시리얼 값 세팅 
			serial = sqlSession.selectOne("hotel.select_serial", member_id);
			vo.setPartner_serial(serial);
			
			System.out.println(serial);
			
			
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
			
			System.out.println("serial : " + vo.getPlace_serial());
			
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
} 
