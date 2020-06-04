package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.PlaceVo;
import rent_parameter.CarVo;
import rent_parameter.CompanyVo;

public class PtnRtCarDao {
	SqlSession sqlSession;
	
	public PtnRtCarDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<CarVo> select(int serial){
		List<CarVo> list = null;
		try {
			System.out.println("adssaddas");
			list = sqlSession.selectList("partner_rent.select_car", serial);
			
			System.out.println("serial : " + serial);
			System.out.println("list : " + list.size());
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {

			return list;
		}
	}
	
	// 등록된 회사 목록 조회 
	public List<CompanyVo> selectComp(int partner_serial){
		List<CompanyVo> list = null;
		try {
			System.out.println("partner_serial : " + partner_serial);
			list = sqlSession.selectList("partner_rent.comp_list", partner_serial);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
		
	}
}
