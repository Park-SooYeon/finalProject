package rent;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;



public class RentDao {
	SqlSession sqlSession;
	public RentDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<CompanyVo> companySearch(String placeMain ,String placeSub ,String rentDate , String returnDate){
		List<CompanyVo> list = null;
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			return list;			
		}
	}
}
