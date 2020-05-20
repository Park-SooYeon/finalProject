package adSuper;

import java.io.File;
import java.util.List;

import org.apache.commons.fileupload.FileUpload;
import org.apache.ibatis.session.SqlSession;

import bean.Factory;

public class AdSuperDao {
// 서블릿과 BoardMybatis를 연결해주는 역할

	SqlSession sqlSession;
	// 가장 중요한 역할!
	
	public AdSuperDao() {
		sqlSession = Factory.getFactory().openSession();
		//mybatis와 연결되어지는 연결고리
	}
	
}
