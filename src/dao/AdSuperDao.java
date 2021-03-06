package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Factory;
import bean.Page;
import bean.ReviewVo;
import bean.Review_PhotoVo;
import bean.membershipVo;
import bean.partnerVo;

public class AdSuperDao {
// 서블릿과 BoardMybatis를 연결해주는 역할

	SqlSession sqlSession;
	// 가장 중요한 역할!
	
	public AdSuperDao() {
		sqlSession = Factory.getFactory().openSession();
		//mybatis와 연결되어지는 연결고리
	}
	
	//회원관리조회
	public List<membershipVo> select() {
		List<membershipVo> list = new ArrayList<membershipVo>();
		try {
			list = sqlSession.selectList("admin.select_member");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	//회원관리수정
	public String status_modify(membershipVo vo) {
		String msg="";
		try {
			int count = sqlSession.update("admin.status_save",vo);//mybatis에 vo를 보내고 받아온걸 count에
			System.out.println(count);
			if(count >0) {
				msg="완료되었습니다!!";
				sqlSession.commit();
				
			}else {
				msg="오류가 발생했습니다!!";
				sqlSession.rollback();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			
			return msg;
		}
	}
	//파트너승인관리-조회
	public List<partnerVo> partner_select() {
		List<partnerVo> list = new ArrayList<partnerVo>();
		try {
			list = sqlSession.selectList("admin.partner_approval");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
	}
	//파트너승인요청수락 수정
		public String partner_modify(partnerVo vo) {
			String msg="";
			try {
				int count = sqlSession.update("admin.p_save",vo);//mybatis에 vo를 보내고 받아온걸 count에
				System.out.println(count);
				if(count >0) {
					msg="완료되었습니다!!";
					sqlSession.commit();
					
				}else {
					msg="오류가 발생했습니다!!";
					sqlSession.rollback();
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				
				return msg;
			}
		}
		
		//파트너관리-조회
		public List<partnerVo> partner_Mselect() {
			List<partnerVo> list = new ArrayList<partnerVo>();
			try {
				list = sqlSession.selectList("admin.partner_M");
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				return list;
			}
		}
		//파트너 view
		public partnerVo partner_view(String member_id) {
			partnerVo vo = null;
			try {
				vo = sqlSession.selectOne("admin.partner_view",member_id);
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				return vo;
			}
		}
		
		//파트너 권한박탈
		public String partner_deprive(partnerVo vo) {
			String msg="";
			try {
				int count1 = sqlSession.delete("admin.p_deprive_del",vo);//mybatis에 vo를 보내고 받아온걸 count에
				int count = sqlSession.update("admin.p_deprive",vo);//mybatis에 vo를 보내고 받아온걸 count에
				System.out.println("daoz카운트1"+count1);
				System.out.println("dao카운트"+count);
				if(count >0) {
					msg="완료되었습니다!!";
					sqlSession.commit();
					
				}else {
					msg="오류가 발생했습니다!!";
					sqlSession.rollback();
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				
				return msg;
			}
		}
		
		//파트너관리-조회
				public List<membershipVo> m_select() {
					List<membershipVo> list = new ArrayList<membershipVo>();
					try {
						list = sqlSession.selectList("admin.m_select");
					}catch(Exception ex) {
						ex.printStackTrace();
					}finally {
						return list;
					}
				}
				
		//회원탈퇴수정및삭제
		public String out_modify(membershipVo vo) {
			String msg="";
			try {
				int count = sqlSession.update("admin.out_save",vo);//mybatis에 vo를 보내고 받아온걸 count에
				int count1 = sqlSession.delete("admin.out_del",vo);//mybatis에 vo를 보내고 받아온걸 count에
				
				System.out.println(count);
				if(count >0) {
					msg="완료되었습니다!!";
					sqlSession.commit();
					
				}else {
					msg="오류가 발생했습니다!!";
					sqlSession.rollback();
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				return msg;
			}
		}
		
		//파트너 승인요청 거절 수정
				public String partner_reject(partnerVo vo) {
					String msg="";
					try {
						int count = sqlSession.update("admin.p_reject",vo);//mybatis에 vo를 보내고 받아온걸 count에
						System.out.println(count);
						if(count >0) {
							msg="완료되었습니다!!";
							sqlSession.commit();
							
						}else { 
							msg="오류가 발생했습니다!!";
							sqlSession.rollback();
						}
					}catch(Exception ex) {
						ex.printStackTrace();
					}finally {
						
						return msg;
					}
				}
				
				//리뷰전체조회 (전체리뷰조회 view join)
				public List<ReviewVo> review_all(Page p) {		
					System.out.println("검색"+p.getFindStr());
					List<ReviewVo> list = new ArrayList<ReviewVo>();
					try {
						int totList = sqlSession.selectOne("admin.count",p);
						p.setTotListSize(totList);
						p.pageCompute();
						list = sqlSession.selectList("admin.review_all", p);
						int cocount = sqlSession.selectOne("admin.count1",p);
//						for(ReviewVo vo : list) {
//							System.out.println(vo.toString());
//							
//						}
						
					}catch(Exception ex) {
						ex.printStackTrace();
					}finally {
						return list;
					}
				}	
				//리뷰 카운트
				public int review_count() {	
					int count=0;
					try {
					 count = sqlSession.selectOne("admin.count1");
					}catch(Exception ex) {
						ex.printStackTrace();
					}finally {
						return count;
					}
				}	
				//리뷰상세보기 -조회
				public ReviewVo review_view(int review_serial) {
					System.out.println("dao_review_serial"+review_serial);
					ReviewVo vo = new ReviewVo();
					try {
					    vo = sqlSession.selectOne("admin.review_view",review_serial);
						List<Review_PhotoVo> list2 = sqlSession.selectList("admin.review_att", review_serial);
						
							vo.setR_photo(list2);
//							for(Review_PhotoVo vo2 : list2) {
//								System.out.println("ㅗㅍ포토포토투스트링_"+vo.toString());
//							}
						
					}catch(Exception ex) {
						ex.printStackTrace();
					}finally {
						return vo;
					}
					
				}
						
				//리뷰 삭제하기
				public String review_delete(ReviewVo vo) {
					String msg="";
					try {
						int count1 = sqlSession.delete("admin.review_delete",vo);//mybatis에 vo를 보내고 받아온걸 count에
						System.out.println("daoz카운트1"+count1);
						if(count1 >0) {
							msg="삭제가 완료되었습니다!!";
							sqlSession.commit();
							
						}else {
							
							msg="실패했어요!!";
							sqlSession.rollback();
						 
						}
					}catch(Exception ex) {
						ex.printStackTrace();
					}finally {
						
						return msg;
					}
				}
				
}
