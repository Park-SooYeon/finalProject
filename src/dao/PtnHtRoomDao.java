package dao;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.PlaceVo;
import bean.roomPhotoVo;
import bean.roomVo;
import partner.UploadVo;

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
	
	public List<roomVo> selectRoom(PlaceVo vo){
		List<roomVo> list = null;
		try {
			System.out.println("vo : " + vo.getPartner_serial());
			System.out.println("vo : " + vo.getPlace_serial());
			list = sqlSession.selectList("room.select_room", vo);
			
			System.out.println("list : " + list);
		}catch(Exception ex) {
			ex.toString();
		}finally {
			
			return list;
		}
	}
	
	public List<PlaceVo> selectHotel(int partner_serial){
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("room.hotel_list", partner_serial);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
		
	}
	
	public roomVo view(int serial) {
		roomVo vo = null;
		try {
			vo = sqlSession.selectOne("room.view", serial);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return vo;
		}
	}
	
	public int insert(roomVo vo, List<roomPhotoVo> attList) {
		int result = 0;
		try {
			
			int cnt = sqlSession.insert("room.insert", vo);
			
			if(cnt<1) {
				throw new Exception("본문 저장중 오류 발생");
			}
			
			
			//uploadVo.setPlace_serial(vo.getPlace_serial());
			
			for(roomPhotoVo rmVo : attList) {
				
				cnt = sqlSession.insert("room.att_insert", rmVo);
				
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
			return result;
		}
	}
	
	public int modify(roomVo vo, List<roomPhotoVo> photoList, List<roomPhotoVo> delList, String[] photoNum) {
		int result = 0;
		try {
			
			System.out.println("vo price dao : " + vo.getPrice());
			// 본문글 수정 
			int cnt = sqlSession.update("room.update", vo);
			if(cnt<1) throw new Exception("본문글 수정중 오류발생");
			System.out.println("vo price dao : " + vo.getPrice());
			System.out.println("cnt : " + cnt);
			
			// boardAtt 테이블에 첨부파일 정보 추가  
			for(roomPhotoVo rpVo : photoList) {

				photoList.get(0).setPhoto_serial(Integer.parseInt(photoNum[0]));
				photoList.get(1).setPhoto_serial(Integer.parseInt(photoNum[1]));
				photoList.get(2).setPhoto_serial(Integer.parseInt(photoNum[2]));
				
				rpVo.setRooms_serial(vo.getRooms_serial());
				
				cnt = sqlSession.insert("room.att_update", rpVo);
				if(cnt<1) throw new Exception("첨부 데이터 정보 추가중 오류 발생");
			}

			
			// 파일 삭제
			delFile(delList);
			sqlSession.commit();
			
			result=1;
		}catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}finally {
			return result;
		}
	}
	
	public int delete(roomVo vo, List<roomPhotoVo> delList) {
		int result = 0;
		int cnt = 0;
		try {
			
			cnt = sqlSession.delete("room.delete", vo);
			System.out.println("cnt : " + cnt);
			if(cnt<1) throw new Exception("삭제중 오류 발생");
			
			// 첨부된 파일 삭제
		
			roomPhotoVo rpVo = new roomPhotoVo();
			// 	room 시리얼 값 세팅 
			rpVo.setRooms_serial(vo.getRooms_serial());
				cnt = sqlSession.delete("room.att_delete", rpVo);
				System.out.println("cnt2 : " + cnt);
				if(cnt<1) throw new Exception("첨부파일 삭제중 오류 발생"); 
			
			
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
	
	
	// insert, modify에서 sql 오류가 발생할 때, 삭제할 때 공통 사용  	
	public void delFile(List<roomPhotoVo> delList) {
		if(delList != null) {
			System.out.println("delLIst : " + delList);
			for(roomPhotoVo rpVo : delList) {
				System.out.println("delete!");
				File f = new File(controller.PtnHtCompController.filePath + rpVo.getSysFile());
				System.out.println("f : " +f);
				if(f.exists()) f.delete();
			}
		}
		
	}
}
