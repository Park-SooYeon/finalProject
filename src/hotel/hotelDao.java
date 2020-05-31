package hotel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.Page;
import bean.PlaceVo;

public class hotelDao {

	SqlSession sqlSession;
	
	
	public hotelDao() {
		sqlSession = Factory.getFactory().openSession();
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
	
	
}