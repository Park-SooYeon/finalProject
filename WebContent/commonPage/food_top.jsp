<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="relative about-banner" id="food_top">	
				<div class="overlay overlay-bg"></div>
				<div class="container">				
					<div class="row d-flex align-items-center justify-content-center">
						<div class="about-content col-lg-12">
							<h1 class="text-white">
								<c:choose>
									<c:when test="${param.menu == 1 }">
										즐길거리
									</c:when>
									<c:when test="${param.menu == 2 }">
										음식점
									</c:when>
									<c:when test="${param.menu == 3 }">
										축제
									</c:when>
								</c:choose>
							</h1>							
						</div>	
					</div>
				</div>
			</section>


