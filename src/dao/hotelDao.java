package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.Page;
import bean.PlaceVo;
import bean.ReviewVo;
import bean.roomPhotoVo;
import bean.roomVo;

public class hotelDao {

	SqlSession sqlSession;
	
	
	public hotelDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	

public List<roomPhotoVo> getPhotoList(int place_serial){
	
	List<roomPhotoVo> photoList = null;
	 try {
		 
		 photoList =sqlSession.selectList("ht.photo_list",place_serial);
		 
	 }catch(Exception ex) {
		 ex.printStackTrace();
	 }finally {
		// sqlSession.close();
		 return photoList ;
	 }
	 
	 
	
	
}


public List<ReviewVo> reviewList(int place_serial) {
	List<ReviewVo> reviewList = null;
	
	try {
	
		
		reviewList = sqlSession.selectList("ht.reviewList",place_serial);
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return reviewList;
		
	}
	
	
}

public List<roomVo> detailView(int place_serial) {
	List<roomVo> list = null;
	
	try {
	
		
	    list = sqlSession.selectList("ht.detailView",place_serial);
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}
	
public PlaceVo detailViewHotel(int place_serial) {
	PlaceVo vo =null;
	
	try {
	
		
	    vo = sqlSession.selectOne("ht.detailViewHotel",place_serial);
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return vo;
		
	}
	
	
}
	
public List<PlaceVo> MainSelectNoRev() {
	List<PlaceVo> list = null;
	
	try {
	
		
	    list = sqlSession.selectList("ht.mainNo");
		
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}

public List<PlaceVo> MainSelectYesRev() {
	List<PlaceVo> list = null;
	System.out.println("진입");
	try {
	
		
	    list = sqlSession.selectList("ht.mainYes");

	    
	    
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}
	

public List<PlaceVo> searchMainListOK(int local_code) {

	List<PlaceVo> list = null;
	System.out.println("진입");
	try {
	
		
	    list = sqlSession.selectList("ht.searchMainOK",local_code);

	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}


}

public List<PlaceVo> searchMainListNo(int local_code) {

	List<PlaceVo> list = null;
	System.out.println("진입!!");
	try {
	
		
	    list = sqlSession.selectList("ht.searchMainNo",local_code);


	    
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}


}


/*
public List<PlaceVo> searchList(List<String> local,List<String> filter) {
	List<PlaceVo> list = null;
	System.out.println("진입");
	try {
	
		Map<String,Object> map= new HashMap<String,Object>();
		
	
		
		
		map.put("local", local);
		map.put("filter", filter);
		
		
		
		
		for(int i=0; i<filter.size();i++) {
	 System.out.println("이 필터가 있니?" + filter);
		}
		
		System.out.println("이 필터의 길이가 뭐님? : " + filter.size());
		
	    list = sqlSession.selectList("ht.placeSelect",map);

	    
	    
	    
	}catch(Exception ex) {
	
		ex.printStackTrace();
	
	}finally {
		//sqlSession.close();
		return list;
		
	}
	
	
}
*/
	
}