function init() {
  /*
	$("#mp-btnModifyProfile").click(function () {
    $("#mp-ModifyModal").on("show.bs.modal", function (event) {
      const ADD_BTN = $(event.relatedTarget); // Button that triggered the modal
      const TRIP_NAME = ADD_BTN.data("whatever"); // Extract info from data-* attributes
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this);
      // modal.find('.modal-title').text('여행이름 ' + TRIP_NAME)
      // modal.find('.modal-body input').val(TRIP_NAME)
    });
  });
  */

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

    $(".travel-item-list").animate(
      {
        right: "-=225",
      },
      200,
      function () {
        $(".swipe-to-right").show();
        if (parseInt($(".travel-item-list").css("right")) <= -(total_width - container_width)) {
          $(".swipe-to-left").hide();
        }
      }
    );

    //$(".travel-item-list").css("left", move - 250 + "px");
    //move = move - 250;
  });
}

init();
