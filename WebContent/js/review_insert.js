/**
 * review_insert 페이지에서 사용될 js
 */
				
/* 별점 선택시에 사용되는 함수 */
// 초기 별점
var stars = 9;
// 선택된 별점 유지 시켜주기
let star = function(starNum) {
	let starArea = document.getElementById('review_star');

	for (var i = 9; i >= 1; i -= 2) {
		let ele = starArea.childNodes[i];

		stars = starNum;
		if (i >= starNum)
			ele.classList.add("checked");
		else
			ele.classList.remove("checked");
	}
}

/* 사진 drag and drop 이벤트에 사용되는 함수들 */
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
	
    // 별점 hover시 클릭될 별점으로 보이는 이벤트 처리
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