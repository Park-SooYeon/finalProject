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

  let screensm = window.matchMedia("screen and (max-width:500px)");
  let screen = window.matchMedia("screen and (max-width:768px)");
  let screenlg = window.matchMedia("screen and (max-width:1100px");
  let sliderCnt = 3;

  if (screensm.matches) {
    sliderCnt = 1;
  } else if (screen.matches) {
    sliderCnt = 2;
  } else if (screenlg.matches) {
    sliderCnt = 3;
  }

  swiper(sliderCnt);

  // 여행리스트 - swiper
  function swiper(sliderCnt) {
    $(".trip-slide .swiper-container").each(function (index, element) {
      //swiper가 적용될 클래스를 하나씩 가져와서 index를 붙인 instance 클래스 추가
      let $this = $(this);
      $this.addClass("instance-" + index);
      var swiper = new Swiper(".instance-" + index, {
        slidesPerView: sliderCnt,
        spaceBetween: 8,
        slidesPerGroup: 1,
        loop: true,
        navigation: {
          nextEl: $(".instance-" + index).siblings(".swiper-button-next"),
          prevEl: $(".instance-" + index).siblings(".swiper-button-prev"),
        },
      });
    });
  }

  screen.addListener(function (e) {
    if (e.matches) {
      sliderCnt = 2;
    } else {
      sliderCnt = 3;
    }
    swiper(sliderCnt);
  });

  screensm.addListener(function (e) {
    if (e.matches) {
      sliderCnt = 1;
    } else {
      sliderCnt = 2;
    }
    swiper(sliderCnt);
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

  // 삭제버튼 나오게
  $(".ellipsis-btn").click(function () {
    $(this).find(".ellipsis-menu").toggle();
  });
  
	$("#mp-btnFollow").click(function(event){
	    if ($("#mp-btnFollow").text() == "+ Follow"){
	    	alert("팔로우");
	    	//event.preventDefault();
	      $("#mp-btnFollow").animate({ width: '-=10px' }, 100, 'easeInCubic', function () {});
	      
	      $("#mp-btnFollow").animate({ width: '+=20px'}, 600, 'easeInOutBack', function () { 
	        $("#mp-btnFollow").css("color", "#fff");
	        $("#mp-btnFollow").text("Following");

	        $("#mp-btnFollow").animate({
	          backgroundColor: "#2B96ED",
	          borderColor: "##2B96ED"
	        }, 1000 );
	      });
	    }else{
	      alert("언팔");
	      // 팔로우가 되지 않은 상태로 css change
	      $("#mp-btnFollow").animate({ width: '-=10px'}, 600, 'easeInOutBack', function () { 
	        $("#mp-btnFollow").text("+ Follow");
	        $("#mp-btnFollow").css("color", "#3399FF");
	        $("#mp-btnFollow").css("background-color", "#ffffff");
	        $("#mp-btnFollow").css("border-color", "#3399FF");
	      });
	    }
	  }); 
	
	$(".mp-modify-area").hover(function(){
		$("#mp-btnModifyProfile").toggle();
	});
}

init();

function photoUpload() {
  $("#pro-upload").click();
  imgPreview();
}

function imgPreview() {
  $("#pro-upload").on("change", function () {
    readURL(this);
  });
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $("#pro-img").attr("src", e.target.result);
    };

    reader.readAsDataURL(input.files[0]);
  }
}


	  