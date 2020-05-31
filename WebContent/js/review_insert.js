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

var sel_files = [];//이미지 정보들을 담을 배열

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
        
        var filesArr = Array.prototype.slice.call(files);        
        $(".picture_area").empty();
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
        		$(".picture_area").append(html);
        		index++;
        	}        	
        	reader.readAsDataURL(f);
        });
        
        handleFileUpload(files,objDragAndDrop);        
    });
    
    function handleFileUpload(files,obj)
    {
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
        this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
        
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
            type: "POST",
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
    
    
    //별점 총점 평균
    $('#star_1').click(function(){
    	$('#reputation').val(1);
    });
    $('#star_2').click(function(){
    	$('#reputation').val(2);
    });
    $('#star_3').click(function(){
    	$('#reputation').val(3);
    });
    $('#star_4').click(function(){
    	$('#reputation').val(4);
    });
    $('#star_5').click(function(){
    	$('#reputation').val(5);
    });
    
    //서비스 점수
    $('#service_star_1').click(function(){
    	$('#service').val(1);
    });
    $('#service_star_2').click(function(){
    	$('#service').val(2);
    });
    $('#service_star_3').click(function(){
    	$('#service').val(3);
    });
    $('#service_star_4').click(function(){
    	$('#service').val(4);
    });
    $('#service_star_5').click(function(){
    	$('#service').val(5);
    });
    
    //청결도 점수
    $('#cleanliness_star_1').click(function(){
    	$('#cleanliness').val(1);
    });
    $('#cleanliness_star_2').click(function(){
    	$('#cleanliness').val(2);
    });
    $('#cleanliness_star_3').click(function(){
    	$('#cleanliness').val(3);
    });
    $('#cleanliness_star_4').click(function(){
    	$('#cleanliness').val(4);
    });
    $('#cleanliness_star_5').click(function(){
    	$('#cleanliness').val(5);
    });
    
    
    //접근성 점수
    $('#accessibility_star_1').click(function(){
    	$('#accessibility').val(1);
    });
    $('#accessibility_star_2').click(function(){
    	$('#accessibility').val(2);
    });
    $('#accessibility_star_3').click(function(){
    	$('#accessibility').val(3);
    });
    $('#accessibility_star_4').click(function(){
    	$('#accessibility').val(4);
    });
    $('#accessibility_star_5').click(function(){
    	$('#accessibility').val(5);
    });
    
    //가격점수
    $('#price_star_1').click(function(){
    	$('#price').val(1);
    });
    $('#price_star_2').click(function(){
    	$('#price').val(2);
    });
    $('#price_star_3').click(function(){
    	$('#price').val(3);
    });
    $('#price_star_4').click(function(){
    	$('#price').val(4);
    });
    $('#price_star_5').click(function(){
    	$('#price').val(5);
    });
    
    //규모점수
    $('#scale_star_1').click(function(){
    	$('#scale').val(1);
    });
    $('#scale_star_2').click(function(){
    	$('#scale').val(2);
    });
    $('#scale_star_3').click(function(){
    	$('#scale').val(3);
    });
    $('#scale_star_4').click(function(){
    	$('#scale').val(4);
    });
    $('#scale_star_5').click(function(){
    	$('#scale').val(5);
    });
    
    //음식점수
    $('#food_star_1').click(function(){
    	$('#food_star').val(1);
    });
    $('#food_star_2').click(function(){
    	$('#food_star').val(2);
    });
    $('#food_star_3').click(function(){
    	$('#food_star').val(3);
    });
    $('#food_star_4').click(function(){
    	$('#food_star').val(4);
    });
    $('#food_star_5').click(function(){
    	$('#food_star').val(5);
    });
    
    
    
    
    
    $('#review_insert').click(function(){
    	$("input[name=place_serial]").prop("disabled", false);
    	$('#place_serial').val(place_serial);
    	let review_insert = new FormData($('#review_insert_frm')[0]);
    	
/*    	//폼데이터 안에 값 확인
    	for (var key of review_insert.keys()) {

    		  alert(key);

    		}

    		for (var value of review_insert.values()) {

    		  alert(value);
	
    		}*/
    		
    	document.review_insert_frm.action="?inc=review_insertR.rv";    	
    	document.review_insert_frm.submit();
    });
});
    

/*function delete_photo(){
	$('.image').remove();
	$('.picture_area').empty();
	location.reload();
};*/
    
/*
$('#input_imgs').on("change", handleImgFileSelect);    
function fileUploadAction(){
	$('#input_imgs').trigger('click');
}

function handleImgFileSelect(e){
	
	// 이미지 정보들을 초기화
	sel_files = [];
	$(".imgs_wrap").empty();
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);        
	
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
			$(".imgs_wrap").append(html);        		
			index++;
		}
		reader.readAsDataURL(f);
	});
}
//선택파일 삭제
function deleteImageAction(index){ 
	sel_files.splice(index, 1);
	
	var img_id = "#img_id_"+index;
	$(img_id).remove();
}

function submitAction(){
	var data = new FormData();
	
	for(var i=0, len=sel_files.length; i<len; i++){
		var name = "image_"+i;
		data.append(name, sel_files[i]);		
	}
	data.append("image_count", sel_files.length);
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST","./study01_af.php");
	xhr.onload = function(e){
		if(this.status == 200){
			console.log("Result : "+e.currentTarget.responseText);
		}
	}
	
	xhr.send(data);
}
*/
	