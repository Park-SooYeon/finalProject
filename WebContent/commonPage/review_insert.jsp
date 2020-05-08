<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var objDragAndDrop = $(".dragAndDropDiv");
        
        $(document).on("dragenter",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px solid #0B85A1');
        });
        $(document).on("dragover",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on("drop",".dragAndDropDiv",function(e){
            
            $(this).css('border', '2px dotted #0B85A1');
            e.preventDefault();
            var files = e.originalEvent.dataTransfer.files;
        
            handleFileUpload(files,objDragAndDrop);
        });
        
        $(document).on('dragenter', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on('dragover', function (e){
          e.stopPropagation();
          e.preventDefault();
          objDragAndDrop.css('border', '2px dotted #0B85A1');
        });
        $(document).on('drop', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        //drag 영역 클릭시 파일 선택창
        objDragAndDrop.on('click',function (e){
            $('input[type=file]').trigger('click');
        });

        $('input[type=file]').on('change', function(e) {
            var files = e.originalEvent.target.files;
            handleFileUpload(files,objDragAndDrop);
        });
        
        function handleFileUpload(files,obj)
        {
           for (var i = 0; i < files.length; i++) 
           {
                var fd = new FormData();
                fd.append('file', files[i]);
         
                var status = new createImage(obj); //Using this we can set progress.
         
           }
        }
        
        var rowCount=0;
        function createImage(obj){
                
            rowCount++;
            var row="odd";
            if(rowCount %2 ==0) row ="even";
            
            this.statusbar = $("<div class='image "+row+"'></div>");
            this.abort = $("<img src='img/about/info-img.jpg' style='width: 100%; height: 100%;'/>").appendTo(this.statusbar);
            
            
            obj.after(this.statusbar);
      
        }
       
        $("#btnImgInsert").on("click", function() {
        	var ele = document.getElementById("modal-body");//$("#fileUpload");

        	for(var i = 0 ; i < ele.childElementCount - 2 ; i++) {
        		$(".picture_area").append("<img src='img/about/info-img.jpg' style='width: 25%; height: 25%'/>");
        	}
        });
		
        $('#review_star').hover(function() {
        	let starArea = document.getElementById('review_star');
        	for(var i = 7 ; i >= 1 ; i -= 2) {
        		let ele = starArea.childNodes[i];

        		ele.classList.remove("checked");
        	}
        }, function() {
        	let starArea = document.getElementById('review_star');

        	for(var i = 9 ; i >= 1 ; i -= 2) {
        		let ele = starArea.childNodes[i];


        	 	if(i >= stars) ele.classList.add("checked");
        		else ele.classList.remove("checked");
        	}
        });
    });
    stars = 9;
    let star = function(starNum) {
    	let starArea = document.getElementById('review_star');

    	for(var i = 9 ; i >= 1 ; i -= 2) {
    		let ele = starArea.childNodes[i];

			stars = starNum;
    	 	if(i >= starNum) ele.classList.add("checked");
    		else ele.classList.remove("checked");
    	}
    }
</script>

<!-- start banner Area -->
<section class="banner-area relative" style="height: 104px">
	<div class="container pt-50">
		<div class="row d-flex justify-content-center align-items-center">
		</div>
	</div>
</section>
<!-- End banner Area -->

<!-- Start about-info Area -->
<section class="about-info-area bt-4">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-4">
				<img class="img-fluid" src="img/about/info-img.jpg" alt="">
			</div>
			<div class="col-8">
				<h3>관광지명</h3>
				<h6>위치</h6>
			</div>
		</div>
		<hr />
		<h3>이 관광지의 전반적인 평가</h3>
		<div class="review_star p-2" id="review_star">
			<span class="fa fa-star fa-3x" onclick="star(1)"></span>
			<span class="fa fa-star fa-3x" onclick="star(3)"></span>
			<span class="fa fa-star fa-3x" onclick="star(5)"></span>
			<span class="fa fa-star fa-3x" onclick="star(7)"></span>
			<span class="fa fa-star fa-3x checked" onclick="star(9)"></span>
		</div>
		<br />
		<h3>리뷰 제목</h3>
		<input type="text" placeholder="방문 목적이나 인상 깊었던 프로모션에 대해 언급하세요"
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '방문 목적이나 인상 깊었던 프로모션에 대해 언급하세요'"
			class="review-title mt-2"> <br />
		<h3>리뷰 내용</h3>
		<textarea class="review-textarea mt-2"
			placeholder="고객님의 경험을 공유하세요. 장소 또는 액티비티, 여행자를 위한 추천 정보를 알려주세요."
			onfocus="this.placeholder = ''"
			onblur="this.placeholder = '고객님의 경험을 공유하세요. 장소 또는 액티비티, 여행자를 위한 추천 정보를 알려주세요.'"
			required></textarea>
		<a style="float: right;">(최소 50자 이상)</a>
		<br />
		<h3>언제 방문하셨나요?</h3>
		<div class="review-select mt-2" id="default-select">
			<select>
				<option value="1">이번달</option>
				<option value="1">저번달</option>
				<option value="1">저저번달</option>
				<option value="1">저저저번달</option>
				<option value="1">저저저저번달</option>
			</select>
		</div>
		<hr/>
		<div>
			<h3 style="float:left">사진을 첨부하시겠어요?</h3><a>(선택사항)</a>
		</div>
		<br/>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable">
		 	사진 추가
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalScrollableTitle">사진 업로드하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" id="modal-body">
		        <div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here<br/><br/>or Browse Files</div>
        		<input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="btnImgInsert">사진 추가</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="picture_area mt-2"></div>
		<hr/>
		<div class="mb-20">
			<button class="btn btn-primary my-2 my-sm-0" type="submit">리뷰 저장</button>
		</div>
	</div>
</section>
<!-- End about-info Area -->