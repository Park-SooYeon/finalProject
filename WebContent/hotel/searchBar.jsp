<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="background: #38a4ff">
	<div class="container" style="background: #38a4ff">
			<div class="jumbotron" style="padding-top: 20px; background: #38a4ff">
		<div class="col-lg-10 offset-2 " >
		
 </div>           

<form  method="post" name="frm_ms" id="frm_ms" class="row" >
	                        <div class="col-lg-2 offset-lg-1 col-md-12 ">
									<input type="text" class="form-control" name="name" placeholder="From " onfocus="this.placeholder = ''" onblur="this.placeholder = 'From '">									
									</div>
									<div class="col-lg-2  " >
									<input type="text" class="form-control date-picker" name="start" placeholder="Start " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start '">
									</div>
									<div class="col-lg-2">
									<input type="text" class="form-control date-picker" name="return" placeholder="Return " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Return '">
									</div>
									<div class="col-lg-2  ">
									<input type="number" min="1" max="20" class="form-control" name="adults" placeholder="Adults " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Adults '">
									</div>
									
									<div class="col-lg-2 ">	
									<input type="button" class="genric-btn info-border"  value="검색" id="btnReservation">
										</div>						
								</form>		
</div>
</div>
</div>

</body>
</html>