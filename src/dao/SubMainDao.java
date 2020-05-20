package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.PlaceVo;
import vo.MainVo;

public class SubMainDao { 
	
	SqlSession sqlSession;
	
	public SubMainDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<PlaceVo> happyMenuSelect(int local) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_place_happy", local);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> foodMenuSelect(int local) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_place_food", local);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> festivalMenuSelect(int local) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_place_festival", local);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> highStarsSelect(int menu) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_high_stars", menu);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	
	public List<PlaceVo> manyReviewSelect(int menu) {
		List<PlaceVo> list = null;
		try {
			list = sqlSession.selectList("sub_main.select_many_review", menu);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
}
