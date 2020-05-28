<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

	<div id='viewReview'>
		<div id='viewReviewTop' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<h5>고객 평가</h5>
		</div>
		<div id='viewReviewMid' class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class='row'>
				<div id='viewReviewMidLeft' class='col-lg-9 col-md-9 col-sm-9 col-xs-9'>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re1}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							렌트 비용 대비 전반적인 평가
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re2}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							카운터 직원의 친절도 및 전문성
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re3}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							차량인수 소요시간
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re4}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							차량반납 소요시간
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re5}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							차량 청결도
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re6}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							차량의 전반적인 상태
						</div>
					</div>
					<div class='row'>
						<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
							${review_tot.re7}
						</div>
						<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
							재선택 가능성
						</div>
					</div>
				</div>
				<div id='viewReviewMidRight' class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					<div>" 
							<c:choose>
								<c:when test="${review_tot.totRe >= 9.0}"> 
								매우만족 <br/> 
								</c:when>
								<c:when test="${review_tot.totRe >= 8.0}"> 
								만족<br/>
								</c:when>
								<c:when test="${review_tot.totRe >= 7.0}"> 
								보통<br/>
								</c:when>
								<c:when test="${review_tot.totRe <= 7.0 and vo.review > 0.0}"> 
								보통이하<br/>
								</c:when>
								<c:when test="${review_tot.totRe == 0.0}"> 
								리뷰없음<br/>
								</c:when>
								
							</c:choose>	
							 "</div>
					<span>${review_tot.totRe} <b> / 10</b></span>
					<p>리뷰 ${review_tot.review_count} 건 </p>
				</div>
			</div>
		</div>
		
		
		<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
			<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
				고객 유형에따른 필터 : 
				<select id='scale_kind' class="form-control" name='scale_kind'>
				  <option value=''>모든 고객들</option>
				  <option value='가족'>가족</option>
				  <option value='커플'>커플</option>
				  <option value='그룹'>그룹</option>
				  <option value='개인'>개인</option>
				</select>
			</div>
			<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
				<c:if test="${fn:length(review_list) > 0}">
				<c:forEach var="rvo" items="${review_list}" varStatus="status">
				<div class='row'>
					<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
						<div class='row'>
							<div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>
								<c:choose>
									<c:when test="${rvo.scale eq '가족'}"> 
										<img src="../images/rent/review_family.png"/>
									</c:when>
									<c:when test="${rvo.scale eq '그룹'}"> 
										<img src="../images/rent/review_group.png"/>
									</c:when>
									<c:when test="${rvo.scale eq '커플'}"> 
										<img src="../images/rent/review_cuple.png"/>
									</c:when>
									<c:when test="${rvo.scale eq '개인'}"> 
										<img src="../images/rent/review_one.png"/>
									</c:when>
								</c:choose>	
							</div>
							<div class='col-lg-10 col-md-10 col-sm-10 col-xs-10'>
								<div class='row'>
									<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8 '>
										<span>${rvo.scale }</span>
									</div>
									<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4 '>
										<span>${rvo.writed_date }</span> <span>${rvo.score }</span>
									</div>
								</div>
								<div class='row'>
									<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
									<img src='../images/rent/review-time.png'/> &nbsp;&nbsp;차량 인수시간 : ${rvo.take_overtime }
									</div>
								</div>
								<div class='row'>
									<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12 '>
										<c:if test="${not empty rvo.bad_news}">
										<div><img src='../images/rent/review_mynus.png'/></div> &nbsp;&nbsp;<span>${rvo.bad_news}</span>
										</c:if>
									</div>
									<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12 '>
										<c:if test="${not empty rvo.good_news}">
										<div><img src='../images/rent/review_plus.png'/></div> &nbsp;&nbsp;<span>${rvo.good_news}</span>
										</c:if>
									</div>
								</div>
								<div class='row'>
									<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8'></div>
									<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'>
										<div id='review_warning' class='review_warning' data-toggle="modal" data-target="#warning-modal">악용 사례 신고</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:if>
				<c:if test="${empty review_list}">
				<div class='row'>
					<div  class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
						리뷰가 없습니다.
					</div>	
				</div>
				</c:if>
				
				
				<!-- Modal -->
				<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">댓글 신고</h4>
				      </div>
				      <div class="modal-body">
				        	<div>게시물 신고는 마이리얼트립 이용수칙에 맞지 않는 글을 신고하는 기능이며 , 반대의견을 표시하는 것이 아닙니다. 고객님의 관심과 신고가 건전하고 올바른 마이리얼트립 문화를 만듭니다. 허위 신고의 경우 신고자가 제재받을 수 있음을 유념해 주세요</div>
				        	<div class='row warning'>
					        	<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					        		<div class='row'>
					        			<div class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					        				내용
					        			</div>
					        			<div class='col-lg-9 col-md-9 col-sm-9 col-xs-9'>
					        				: 마이리얼 트립 부적합한 리뷰 신고
					        			</div>
					        		</div>
					        		<div class='row'>
					        			<div class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
					        				작성자
					        			</div>
					        			<div class='col-lg-9 col-md-9 col-sm-9 col-xs-9'>
					        				: 김도경
					        			</div>
					        		</div>
					        		
					        		<hr/>
					        		
					        		
					        		<div class='row'>
						        		<div class='col-lg-3 col-md-3 col-sm-3 col-xs-3'>
						        				신고사유
						        		</div>
						        		<div class='col-lg-9 col-md-9 col-sm-9 col-xs-9'>
						        			여러 사유에 해당하는 경우 대표적인 사유 1개를 선택해 주세요
						        		</div>
					        		</div>
					        		
					        		<div class='row'>
					        			<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
					        				<label><input type="radio" name='' value='영리목적/홍보성'/>영리목적/홍보성</label><br/>
					        				<label><input type="radio" name='' value='불법정보'/>불법정보</label><br/>
					        				<label><input type="radio" name='' value='욕설/인신공격'/>욕설/인신공격</label><br/>
					        				<label><input type="radio" name='' value='같은 내용 반복(도배)'/>같은 내용 반복(도배)</label><br/>
					        				
					        			</div>
					        			<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
					        				<label><input type="radio" name='' value='개인 정보 노출'/>개인 정보 노출</label><br/>
					        				<label><input type="radio" name='' value='음란성/선정성'/>음란성/선정성</label><br/>
					        				<label><input type="radio" name='' value='아이디/DB거래'/>아이디/DB거래</label><br/>
					        				<label><input type="radio" name='' value='기타'/>기타</label><br/>
					        			</div>
					        		</div>
					        		
					        		<hr/>
					        		
					        		<div class='row'>
					        			<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
						        			<div>상세내용 (선택)</div>
						        			<input type='text'/>
					        			</div>
					        		</div>
					        		
					        	</div>
					        </div>
					        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-danger">신고하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>
		</div>
		
	</div>
