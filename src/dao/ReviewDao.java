package dao;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartFile;

import bean.Factory;
import bean.Page;
import bean.ReviewVo;
import review.ReviewAttVo;
import review.ReviewFileUpload;

public class ReviewDao {
	SqlSession sqlSession;
	
	public ReviewDao() {
		sqlSession = Factory.getFactory().openSession();
	}
	
	public List<ReviewVo> select(Page p){
		List<ReviewVo> list = null;
		try {
			int totList = sqlSession.selectOne("review.count", p);
			p.setTotListSize(totList);
			p.pageCompute();
			list = sqlSession.selectList("review.select", p);
			
		}catch(Exception ex){
			ex.printStackTrace();			
		}
		
		return list;
		
	}
	
	public String insert(ReviewVo vo) {
		String msg = "정상적으로 입력되었습니다.";	
		
		try {
			int cnt = sqlSession.insert("review.insert", vo);
			if(cnt<1) {
				throw new Exception("본문 저장중 오류 발생");
			}
			
			
			List<MultipartFile> file = vo.getFileUpload();
			if(!file.isEmpty()) {
				for(int i=0; i<file.size(); i++) {
					System.out.println(file.get(i));
					String photo_name = file.get(i).getOriginalFilename();
					cnt = sqlSession.insert("review.photo", photo_name);
					System.out.println(photo_name);
					if(cnt<1) {
						throw new Exception("첨부 데이터 저장시 오류 발생");
					}
				}				
			}
			
			sqlSession.commit();
			
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = ex.getMessage();
			sqlSession.rollback();
			//delFile(attList);
		}finally {
			//sqlSession.close();
			return msg;
		}
	}
	
	//insert, modify에서 sql 오류가 발생할 때, 삭제할 때 공통 사용
		public void delFile(List<ReviewAttVo> delList) {
			for(ReviewAttVo attVo : delList) {
				File f = new File(ReviewFileUpload.upload + attVo.getPhoto_name() );
				if(f.exists()) f.delete();
			}
		}

}
