<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="clearfix" style='margin-top:5px'>
						<ul class='float-left' >
							<li><i class="fa fa-cutlery"style="margin-right: 3px"></i>접근성</li>
							<li><i class="fa fa-share-alt"style="margin-right: 3px" aria-hidden="true"></i>서비스</li>
							<li><i class="fa fa-krw"style="margin-right: 3px" aria-hidden="true"></i>규모</li>
						</ul>
						<div class="review_star p-2" id="review_star">
							<span class="fa fa-star fa-3x" onclick="star(1)"></span>
							<span class="fa fa-star fa-3x" onclick="star(3)"></span>
							<span class="fa fa-star fa-3x" onclick="star(5)"></span>
							<span class="fa fa-star fa-3x" onclick="star(7)"></span>
							<span class="fa fa-star fa-3x checked" onclick="star(9)"></span>
						</div>
							
							
					</div>
</body>
</html>