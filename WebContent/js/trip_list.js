let page = "";

function load(){
	$("#list-here").load("mytrip.mp");
	
//	$.ajax({
//		url  	 : 'mytrip.mp',
//		type 	 : 'get',
//		data 	 : param,
//		dataType : 'html',
//		success  : function(data){
//			$('#list-here').html(data);
//		}
//	});
	
	init();
}

function init() {
	
    $("#newTripModal").on("show.bs.modal", function (event) {
    	console.log("모달 실행");
      const ADD_BTN = $(event.relatedTarget); // Button that triggered the modal
      const TRIP_NAME = ADD_BTN.data("whatever"); // Extract info from data-* attributes
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this);
      // modal.find('.modal-title').text('여행이름 ' + TRIP_NAME)
      // modal.find('.modal-body input').val(TRIP_NAME)
    });
  
  $(document).on('change', '#select-day', function(){
	  if ($(this).val() == 1) {
		  $("#trip-day-input").show();
		  $("#trip-cal-input").hide();
	  } else if($(this).val() == 2){
		  $("#trip-cal-input").show();
		  $("#trip-day-input").hide();
		  
		  $("#datePickInput").datepicker({
	    	  language:"kr",
	    	  range:true,
	    	  toggleSelected:true,
	    	  position:"bottom",
	    	  multipleDatesSeparator:"-"
	      });
		  
	  }
  });

  $("#btnCreateTrip").click(function () {
    // 추후 submit으로 변경
  });

  $(".trip-list-box").click(function(){
  	location.href="./mypage/edit_trip.jsp";
  })
  
  $(".button-container .btn-page").click(function(){
	  $this = $(this).data("page");
	  $("#list-here").load("mypage/"+$this+".jsp");
	  init();
  })
}

load();

