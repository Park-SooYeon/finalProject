function init() {
	const mid = $("#pro-id").text(); 
	$("#posts-here").load("selectPosts.mp?mid="+mid);
	
  //show modal
  $("#mp-modifyModal").on("show.bs.modal", function (event) {
	  
	// 프로필 정보 가져오기
	  const addr = $("#pro-addr").text();
	  const rDate = $("#pro-enroll").text();
	  const web = $("#pro-web").text();
	  const id = $("#pro-id").text();
	  const nickname = $("#pro-nick").text();
	  const img = $("#pro-main-img").attr("src");
	  const self = $("#self-desc").text();
	  
    const ADD_BTN = $(event.relatedTarget); // Button that triggered the modal
    const TRIP_NAME = ADD_BTN.data("whatever"); // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

    // modal에 넣어주는 작업
    let modal = $(this);
    modal.find("input[name=member_id]").val(id);
    modal.find("#nickName").val(nickname);
    modal.find("input[name=member_city]").val(addr);
    modal.find("#pro-img").attr("src", img);
    modal.find("input[name=member_web]").val(web);
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
  $(document).on("click",".social-like",function () {
    $(this).find("i").toggleClass("on");
  });


  // 삭제버튼 나오게
  $(".ellipsis-btn").click(function () {
    $(this).find(".ellipsis-menu").toggle();
  });
  
	$("#mp-btnFollow").click(function(event){
		const TARGET_ID = $(this).data("target");
		const MEMBER_ID = $(this).data("follow");
		console.log(TARGET_ID);
		console.log(MEMBER_ID);
		
		let $btn = $("#mp-btnFollow");
		
		$btn.toggleClass("btn-follow btn-following", function(){
			if ($btn.hasClass("btn-following")){
				//follow
				$btn.animate({ width: '-=20px'}, 600, 'easeInOutBack', function () { 
	
						$btn.animate({ width: '+=30px'}, 600, 'easeInOutBack', function () {
							$.get("follow.mp", {"target_id" : TARGET_ID}, function(data, state) {
								alert(data);
							});
						});
				});
			}else{
				// 팔로우가 되지 않은 상태로 css change
				$.get("follow_delete.mp", {"target_id" : TARGET_ID, "member_id" : MEMBER_ID}, function(data, state) {
					alert(data);

				});

			}
		});
		
	  }); 
	
	$(".mp-modify-area").hover(function(){
		$("#mp-btnModifyProfile").toggle();
	});
	
	  $("#btnModifyProfile").click(function () {
		  let fd = new FormData($('#mp-proModifyFrm')[0]);
		  console.log(fd);
		  $.ajax({
			 url : "editProfile.mp",
			 type : "post",
			 data : fd,
			 contentType : false,
			 processData : false,
			 error : function(xhr, status, error){
				 console.log(error);
			 },
			 success : function(data, xhr, status){
				 alert(data);
			 }
		  })
	  });
}

init();

function photoUpload() {
  $("#member_photo").click();
  imgPreview();
}

function imgPreview() {
  $("#member_photo").on("change", function () {
    readURL(this);
  });
}

function readURL(input) {
  if (input.files && input.files[0]) {
    let reader = new FileReader();

    reader.onload = function (e) {
      $("#pro-img").attr("src", e.target.result);
    };

    reader.readAsDataURL(input.files[0]);
  }
}




	  