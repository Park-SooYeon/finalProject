package dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.el.ELException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import bean.Factory;
import bean.PlaceVo;
import oracle.jdbc.internal.OracleStatement.SqlKind;
import partner.UploadVo;

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
	
	public int modify(PlaceVo vo, List<UploadVo> photoList, List<UploadVo> delList, String[] photoNum) {
		int result = 0;
		
		try {
			// 본문글 수정 
			int cnt = sqlSession.update("hotel.update", vo);
			if(cnt<1) throw new Exception("본문글 수정중 오류발생");
			
			// boardAtt 테이블에 첨부파일 정보 추가  
			for(UploadVo upVo : photoList) {

				photoList.get(0).setPhoto_serial(Integer.parseInt(photoNum[0]));
				photoList.get(1).setPhoto_serial(Integer.parseInt(photoNum[1]));
				photoList.get(2).setPhoto_serial(Integer.parseInt(photoNum[2]));
				
				upVo.setPlace_serial(vo.getPlace_serial());
				cnt = sqlSession.insert("hotel.att_update", upVo);
				if(cnt<1) throw new Exception("첨부 데이터 정보 추가중 오류 발생");
			}

			
			// 파일 삭제
			delFile(delList);
			
			sqlSession.commit();
			result = 1;
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			System.out.println("dao modi result  : " + result);
			return result;
		}
	}
	
	public int delete(PlaceVo vo, List<UploadVo> delList) {
		int result = 0;
		int cnt = 0;
		try {
			System.out.println("vo place_serial : " + vo.getPlace_serial());
			System.out.println("vo getPartner_serial : " + vo.getPartner_serial());
			
			cnt = sqlSession.delete("hotel.delete", vo);
			System.out.println("cnt : " + cnt);
			if(cnt<1) throw new Exception("삭제중 오류 발생");
			
			// 첨부된 파일 삭제
			for(UploadVo upVo : delList) {
				cnt = sqlSession.delete("hotel.delete", upVo);
				System.out.println("cnt2 : " + cnt);
				if(cnt<1) throw new Exception("첨부파일 삭제중 오류 발생"); 
			}
			
			// 파일 삭제
			delFile(delList);
			sqlSession.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}finally {
			return result;
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
	
	// insert, modify에서 sql 오류가 발생할 때, 삭제할 때 공통 사용  	
	public void delFile(List<UploadVo> delList) {
		if(delList != null) {
			
			for(UploadVo upVo : delList) {
				System.out.println("delete!");
				File f = new File(controller.PtnHtCompController.filePath + upVo.getSysFile());
				System.out.println("f : " +f);
				if(f.exists()) f.delete();
			}
		}
		
	}
	
} 
