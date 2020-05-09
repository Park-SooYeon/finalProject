<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-default" id='topmain'>
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" id="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
      	<img alt="Brand" src="../images/rent/rc_logo.png" id="brand">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      
      <ul class="nav navbar-nav navbar-right">
        
        <li class="dropdown">
          <a href="#" id="dropdown-toggle" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">예약관리 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <div class="drop">
            	<h4>예약 관리</h4>
            	<p>계정이 없어도 예약관리가 가능합니다.</p>
            	<div class="form-group">
				    <label for="exampleInputEmail1">이메일 주소</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
				</div>
				<div class="form-group">
				    <label for="exampleInputPassword1">예약번호</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="예약번호를 입력하세요">
				</div>
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-link" data-toggle="modal" data-target="#eamilFind" id="btnEmailFind">
				  예약번호를 잊으셨나요?
				</button><br/>
				
				
				<button type="button" class="btn btn-primary btn-lg">Go</button>
            </div>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>







				<!-- Modal -->
				<div class="modal fade" id="eamilFind" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" id="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">예약 번호를 잊으셨나요?</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        	이메일 주소를 입력해 주세요. 고객님의 예약번호를 <br/>이메일 주소로 발송해 드리겠습니다.<br/><br/>
				        	<div class="form-group">
							    <label for="exampleInputEmail1">이메일 주소</label>
							    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
							</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#eamilFind2" id="btnEmailFind2">지금입력</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- Modal2 -->
				<div class="modal fade" id="eamilFind2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" id="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">고객님의 예약번호를 이메일 주소로 발송해 드렸습니다.</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        	이메일을 확인해주세요.<br/><br/>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div>
				  </div>
				</div>




</body>
</html>