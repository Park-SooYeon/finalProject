// 프로필 정보 가져오기
let addr = $("#pro-addr").text();
let rDate = $("#pro-enroll").text();
let web = $("#pro-web").text();
let id = $("#pro-id").text();
let nickname = $(".profile-nickname").text();
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

  // 여행리스트 - swiper
  var swiper = new Swiper(".swiper-container", {
    slidesPerView: 3,
    spaceBetween: 30,
    slidesPerGroup: 3,
    loop: true,
    loopFillGroupWithBlank: true,

    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  $(".profile-menu a").click(function () {
    $(this).addClass("on");
    $(".profile-menu a").not(this).removeClass("on");
  });

  // "도움이 됐어요" 눌렀을때 css 변경
  $(".social-like").click(function () {
    $(this).find("i").toggleClass("on");
  });

  $(".ellipsis-btn").click(function () {
    $(this).find(".ellipsis-menu").toggle();
  });
}

init();
