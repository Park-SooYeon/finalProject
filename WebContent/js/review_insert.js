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
function getCookie(place_serial) {
	  var value = document.cookie.match('(^|;) ?' + place_serial + '=([^;]*)(;|$)');
	  return value? value[2] : null;
	}

var place_serial = getCookie('place_serial');

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
var sel_files = [];
    $('input[type=file]').on('change', function(e) {
        var files = e.originalEvent.target.files;
        
        var filesArr = Array.prototype.slice.call(files);        
        $("#fileUpload").empty();
        var index = 0;
        filesArr.forEach(function(f){
        	if(!f.type.match("image.*")){
        		alert("확장자는 이미지 확장자만 가능합니다.");
        		return;
        	}
        	
        	sel_files.push(f);
        	
        	var reader = new FileReader();
        	reader.onload = function(e){
        		var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width: 10%; height: 10%;'></a>";
        		$("#fileUpload").append(html);
        		$(".picture_area").append(html);
        		index++
        	}
        	reader.readAsDataURL(f);
        });
        
        handleFileUpload(files,objDragAndDrop);        
    });
    
    //선택파일 삭제
    function deleteImageAction(index){ 
    	sel_files.splice(index, 1);
    	
    	var img_id = "#img_id_"+index;
    	$(img_id).remove();
    }
    
    function handleFileUpload(files,obj)
    {  alert(files.originalEvent.target.files);
       for (var i = 0; i < files.length; i++) 
       {
            var fd = new FormData();
            fd.append('file', files[i]);
            
            var status = new createImage(obj); //Using this we can set progress.
            status.setFileNameSize(files[i].name,files[i].size);
            sendFileToServer(fd,status);
            
       }
    }
    
    var rowCount=0;
    function createImage(obj){            
        rowCount++;
        var row="odd";
        if(rowCount %2 ==0) row ="even";        
        this.statusbar = $("<div class='image "+row+"'></div>");
        this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
        this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
        this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
        this.abort = $("<div class='abort'>삭제</div>").appendTo(this.statusbar);
        
        obj.after(this.statusbar);
        
        this.setFileNameSize = function(name,size){
            var sizeStr="";
            var sizeKB = size/1024;
            if(parseInt(sizeKB) > 1024){
                var sizeMB = sizeKB/1024;
                sizeStr = sizeMB.toFixed(2)+" MB";
            }else{
                sizeStr = sizeKB.toFixed(2)+" KB";
            }
     
            this.filename.html(name);
            this.size.html(sizeStr);
        }
        
        
        this.setProgress = function(progress){       
            var progressBarWidth =progress*this.progressBar.width()/ 100;  
            this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
            if(parseInt(progress) >= 100)
            {
                this.abort.hide();
            }
        }
        
        this.setAbort = function(jqxhr){
            var sb = this.statusbar;
            this.abort.click(function()
            {
                jqxhr.abort();
                sb.hide();      
            });
        }  
    }
    
    function sendFileToServer(formData,status)
    {
        var uploadURL = "/fileUpload/post"; //Upload URL
        var extraData ={}; //Extra Data.
        var jqXHR=$.ajax({
                xhr: function() {
                var xhrobj = $.ajaxSettings.xhr();
                if (xhrobj.upload) {
                        xhrobj.upload.addEventListener('progress', function(event) {
                            var percent = 0;
                            var position = event.loaded || event.position;
                            var total = event.total;
                            if (event.lengthComputable) {
                                percent = Math.ceil(position / total * 100);
                            }
                            //Set progress
                            status.setProgress(percent);
                        }, false);
                    }
                return xhrobj;
            },
            url: uploadURL,
            type: "GET",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            success: function(data){
                status.setProgress(100);
     
                //$("#status1").append("File upload Done<br>");           
            }
        }); 
     
        status.setAbort(jqXHR);
    }
    
   
    $("#btnImgInsert").on("click", function() {
    	var ele = document.getElementById("modal-body");//$("#fileUpload");

    	for(var i = 0 ; i < ele.childElementCount - 2 ; i++) {
    		$(".picture_area").append("<img src='" + name + "' style='width: 25%; height: 25%'/>");
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
    
    $('#star_1').click(function(){
    	$('#star_input').val(1);
    });
    $('#star_2').click(function(){
    	$('#star_input').val(2);
    });
    $('#star_3').click(function(){
    	$('#star_input').val(3);
    });
    $('#star_4').click(function(){
    	$('#star_input').val(4);
    });
    $('#star_5').click(function(){
    	$('#star_input').val(5);
    });
    
    $('#review_insert').click(function(){
    	let review_insert = new FormData($('#review_insert_frm')[0]);
    	review_insert.append("place_serial", place_serial);
    	
    	//폼데이터 안에 값 확인
    	for (var key of review_insert.keys()) {

    		  alert(key);

    		}

    		for (var value of review_insert.values()) {

    		  alert(value);

    		}
    		
    	//document.review_insert_frm.action="?inc=review_insertR.rv"
    	//document.review_insert_frm.submit();
    });
});