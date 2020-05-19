let fullDate = "";

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
	
	$(document).on("show.bs.modal", "#newTripModal", function(event){
		console.log("모달1");
	})
	
	//수정 모달창이 켜졌을때
	$(document).on("show.bs.modal", "#mp-modifyTripModal", function(event){
		
		let modal = $(this);
		const ADD_BTN = $(event.relatedTarget);
		
		let name = ADD_BTN.data("name");
		let auth = ADD_BTN.data("auth");
		let member = ADD_BTN.data("member");
		let days = ADD_BTN.data("days");
		let start = ADD_BTN.data("start");
		let end = ADD_BTN.data("end");
		
		if(days==0 || days==null){
			getCal();
		}else if (days>0){
			getDay();
		}
		
		fullDate = start+" - "+end;
		$("#mTrip_name").val(name);
		$("#mDays_count").val(days);
		$("#datePickInput2").val(fullDate);
		
		if(auth==1){
			$("#unlock").prop("checked", true);
		}else if(auth==0){
			$("#lock").prop("checked", true);
		}
	})
	
		// 일수 or 날짜 선택 가능
	  $(document).on('change', '.select-day', function(){
	  $this = $(this);
		  
	  let date = $("#datePickInput2").val();
	  let str = date.split(" - ");
		  
	  if ($this.val() == 1) {
		  getDay();
	  } else if($this.val() == 2){
		  getCal();
	  }
  });
	
	function init() {
	/*
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
    */

		
		$(document).on("click", "#btnCreateTrip", function(){
			 console.log("여기");
			  let param = $("#mpNewtripFrm").serialize();
			  
				$.post("newtrip.mp", param, function(data, state) {
					alert(data);
					location.reload();
//					$("#main").html(data);
				});
		})
		
/*
  $("#btnCreateTrip").on('click',function () {
	  console.log("여기");
	  let param = $("#mpNewtripFrm").serialize();
	  
		$.post("newtrip.mm", param, function(data, state) {
			alert(data);
//			$("#main").html(data);
		});
  });
  */

  $(".trip-list-box").on('click', function(){
  	location.href="./mypage/edit_trip.jsp";
  })
  
  $(".button-container .btn-page").on('click',function(){
	  $this = $(this).data("page");
	  $("#list-here").load("mypage/"+$this+".jsp");
	  init();
  })
}

load();

function getCal(){
	$(".trip-cal-input").show();
	$(".trip-day-input").hide();
	$(".datepicker-here").datepicker();
	
	// datepicker 호출 후에 다시 값 넣어주기
	$("#datePickInput2").val(fullDate);
}

function getDay(){
	$(".trip-day-input").show();
	$(".trip-cal-input").hide();
	$(".datepicker-here").datepicker();
}



