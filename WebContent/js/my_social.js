// 프로필 정보 가져오기
let addr = $("#pro-addr").text();
let rDate = $("#pro-enroll").text();
let web = $("#pro-web").text();
let id = $("#pro-id").text();
let nickname = $("#pro-nick").text();
let img = $("#pro-main-img").attr("src");
let self = $("#self-desc").text();

function init() {
  //show modal
  $("#mp-modifyModal").on("show.bs.modal", function (event) {
    const ADD_BTN = $(event.relatedTarget); // Button that triggered the modal
    const TRIP_NAME = ADD_BTN.data("whatever"); // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

    // modal에 넣어주는 작업
    var modal = $(this);
    modal.find("input[name=mp-id]").val(id);
    modal.find("#mp-name").val(nickname);
    modal.find("input[name=mp-address]").val(addr);
    modal.find("#pro-img").attr("src", img);
    modal.find("input[name=mp-web]").val(web);
    modal.find("textarea").val(self);

    // modal.find('.modal-title').text('여행이름 ' + TRIP_NAME)
    // modal.find('.modal-body input').val(TRIP_NAME)

    //TODO
    // submit -> profile modify
  });

  /*
  $(".swipe-to-right").click(function () {
    $(".travel-item-list").animate(
      {
        right: "+=225",
      },
      200,
      function () {
        $(".swipe-to-left").show();
        if (parseInt($(".travel-item-list").css("right")) > -225) {
          $(".swipe-to-right").hide();
        }
      }
    );

    //$(".travel-item-list").css("left", move - 250 + "px");
    //move = move - 250;
  });

  $(".swipe-to-left").click(function () {
    let total_width = $(".travel-item-list").width();
    let container_width = $(".trip-slide").width();
    let right_index = parseInt($(".travel-item-list").css("right"));
    let each_width = $(".travel-box").outerWidth() + parseInt($(".travel-box").css("margin-right"));
    let sub_width = total_width - container_width;

    console.log(total_width - container_width);
    console.log(right_index);
    console.log(each_width);

    if (sub_width - right_index <= 225) {
      $(".travel-item-list").animate(
        {
          right: "-=225",
        },
        200,
        function () {
          $(".swipe-to-right").show();
          if (right_index <= -(total_width - container_width)) {
            $(".swipe-to-left").hide();
          }
        }
      );
    }

    //$(".travel-item-list").css("left", move - 250 + "px");
    //move = move - 250;
  });
  */

  let screen = window.matchMedia("screen and (max-width:768px)");
  let sliderCnt = 2;
  
  if(screen.matches){
	  sliderCnt = 2;
  }else{
	  sliderCnt = 3;
  }
  
  // 여행리스트 - swiper
  var swiper = new Swiper(".trip-slide .swiper-container", {
    slidesPerView: sliderCnt,
    spaceBetween: 8,
    slidesPerGroup: 1,
    loop: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  
  screen.addListener(function(e) {
	    if(e.matches) {
	    	sliderCnt = 2;
	    } else {
	    	sliderCnt = 3;
	    }
	    var swiper = new Swiper('.trip-slide .swiper-container', {
	        slidesPerView: sliderCnt,
	        spaceBetween: 5,
	        slidesPerGroup: 1,
	        loop:true,
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev'
	    });
	});
  
  
  $(".profile-menu a").click(function () {
    $(this).addClass("on");
    $(".profile-menu a").not(this).removeClass("on");
  });

  // "도움이 됐어요" 눌렀을때 css 변경
  $(".social-like").click(function () {
    $(this).find("i").toggleClass("on");
  });

  // "내 여행목록에 담기" 눌렀을때 css 변경
  $(".social-save").click(function () {
    $(this).find("i").toggleClass("fa-heart fa-heart-o");
  });

  $(".ellipsis-btn").click(function () {
    $(this).find(".ellipsis-menu").toggle();
  });
}

init();

uploadFiles = [];
var $drop = $("#drop");
$drop
  .on("dragenter", function (e) {
    //드래그 요소가 들어왔을떄
    $(this).addClass("drag-over");
  })
  .on("dragleave", function (e) {
    //드래그 요소가 나갔을때
    $(this).removeClass("drag-over");
  })
  .on("dragover", function (e) {
    e.stopPropagation();
    e.preventDefault();
  })
  .on("drop", function (e) {
    //드래그한 항목을 떨어뜨렸을때
    e.preventDefault();
    $(this).removeClass("drag-over");
    var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
    for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var size = uploadFiles.push(file); //업로드 목록에 추가
      preview(file, size - 1); //미리보기 만들기
    }
  });
function preview(file, idx) {
  var reader = new FileReader();
  reader.onload = (function (f, idx) {
    return function (e) {
      var div =
        '<div class="thumb"> \
<div class="close" data-idx="' +
        idx +
        '">X</div> \
<img src="' +
        e.target.result +
        '" title="' +
        escape(f.name) +
        '"/> \
</div>';
      $(".mp-upload-top").empty();
      $("#thumbnails").append(div);
      //$("#thumbnails").html(div);
    };
  })(file, idx);
  reader.readAsDataURL(file);
}
$("#btnSubmit").on("click", function () {
  var formData = new FormData();
  $.each(uploadFiles, function (i, file) {
    if (file.upload != "disable")
      //삭제하지 않은 이미지만 업로드 항목으로 추가
      formData.append("upload-file", file, file.name);
  });
  $.ajax({
    url: "/api/etc/file/upload",
    data: formData,
    type: "post",
    contentType: false,
    processData: false,
    success: function (ret) {
      alert("완료");
    },
  });
});
$("#thumbnails").on("click", ".close", function (e) {
  var $target = $(e.target);
  var idx = $target.attr("data-idx");
  uploadFiles[idx].upload = "disable"; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
  $target.parent().remove(); //프리뷰 삭제
});
