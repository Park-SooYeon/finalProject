function init() {
  $(".add-new-trip").click(function () {
    $("#exampleModal").on("show.bs.modal", function (event) {
      const ADD_BTN = $(event.relatedTarget); // Button that triggered the modal
      const TRIP_NAME = ADD_BTN.data("whatever"); // Extract info from data-* attributes
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this);
      // modal.find('.modal-title').text('여행이름 ' + TRIP_NAME)
      // modal.find('.modal-body input').val(TRIP_NAME)
    });
  });

  $("#select-day").change(function () {
    if ($(this).val() == 1) {
      $("#trip-day-input").show();
      $("#trip-cal-input").hide();
    } else {
      $("#trip-cal-input").show();
      $("#trip-day-input").hide();
    }
  });

  $("#btnCreateTrip").click(function () {
    // 추후 submit으로 변경
  });

  $("#datePickInput").datepicker({
    language: "kr",
    minDate: new Date(),
    range: true,
    toggleSelected: false
  });
}

init();
