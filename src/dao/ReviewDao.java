package dao;

import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.List;
import java.util.UUID;

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
	
	public String insert(ReviewVo vo, String uploadPath) {
		String msg = "정상적으로 입력되었습니다.";	
		System.out.println("ReviewVo insert 들어옴, 받아온 vo : " + vo);		
		
		try {
			int cnt = sqlSession.insert("review.insert", vo);
			if(cnt<1) {
				throw new Exception("본문 저장중 오류 발생");
			}
			
			vo.getReview_serial();
			System.out.println("review_serial : " + vo.getReview_serial());
			
			List<MultipartFile> file = vo.getFileUpload();
			
			System.out.println("Dao에 file : " + file);
			if(!file.isEmpty()) {
				for(int i=0; i<file.size(); i++) {
					String nnName = UUID.randomUUID().toString();
					System.out.println("nnName : " + nnName);
					System.out.println(file.get(i));
					String photo_name = file.get(i).getOriginalFilename();
					System.out.println("파일명 제대로 들어오는지?? " + photo_name);
					vo.setPhoto_name(photo_name);
					System.out.println("review_serial : " + vo.getReview_serial());
					String tempName = Normalizer.normalize(photo_name, Normalizer.Form.NFC);
					System.out.println("tempName : " + tempName);
					String sysFile = nnName + tempName;
					System.out.println("sysFile : " + sysFile);
					vo.setSysFile(sysFile);
					
					String savePath = uploadPath + sysFile; // 저장 될 파일 경로
					cnt = sqlSession.insert("review.photo", vo);
					System.out.println("sysfile 적용적용");
					

				try {
					file.get(i).transferTo(new File(savePath));					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
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
