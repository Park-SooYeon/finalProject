<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>Table Booking Form a Flat Responsive Widget Template :: w3layouts </title>
	<!-- Meta tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Table Booking Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
	/>
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<!-- Meta tags -->
	<!--stylesheets-->
	<link href="../plugin/KDGtemplate/style.css" rel='stylesheet' type='text/css' media="all">
	<!--//style sheet end here-->
	<!-- Calendar -->
	<link rel="stylesheet" href="../template/css/jquery-ui.css" />
	<!-- //Calendar -->
	<link href="../plugin/wickedpicker/css/wickedpicker.css" rel="stylesheet" type='text/css' media="all" />
	<!-- Time-script-CSS -->

	<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
</head>

<body>
	<div class='rentmain' style="padding-top: 70px;">
	<h1 class="header-w3ls">
		어디에서 픽업하세요?</h1>
	<div class="appointment-w3">
		<form name="rent_frm" id="rent_frm" method="post">
			
			<div class="information">
				
				
				<div class="main">

					
					<div class="form-left-w3l">
						<input id="mainRent"  class='datepicker-here'  data-position='right top' data-timepicker="true" data-language='en' name="rentDate" type="text" placeholder="차량인수일 " required="">
						
						<div class="clear"></div>
					</div>
					<div class="form-left-w3l">
						<input id="mainReturn" class='datepicker-here'  data-position='left top' data-timepicker="true" data-language='en' name="returnDate" type="text" placeholder="차량반납일 " required="">
						
						<div class="clear"></div>
					</div>
				</div>
				
				<div class="main">
					<div class="form-left-w3l">
						<select class="form-control" name='placeMain' id="place" >
							<option value="지역">지역</option>
							<option value="서울">서울</option>
							<option value="경기도">경기도</option>
							<option value="안천">인천</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="제주도">제주도</option>
						</select>
					</div>
					<div class="form-right-w3ls">
						<select class="form-control" name='placeSub' id="subplace">
						<option value="">시</option>
						</select>
					</div>
					<label class="defrent" id="defrent">> 전화 예약이 필요하신가요??</label><br/><br/>
					
					<div class="hiddenmain" id="hiddenmain">
						<div id="callimg"><img src="../images/rent/phone.png"/></div>
						<div>예약 전화</div>
						
						<div class="hiddenmainsub" id="hiddenmainsub">
							<div>02 2023 6423</div>
							<span>
							영업시간<br/>
							콜센터로 연락이 어려우신 경우, 오후 3시 이후에 다시 전화 부탁 드리겠습니다.<br/>
							오후 3시 이후부터는 보다 원활한 상담이 가능합니다.<br/>
							감사합니다. &nbsp; <i id='callInfosub' data-toggle="tooltip" data-placement="top" title="예약 및 상담시간 : 월 ~ 금  08:00-23:00"><img src='../images/rent/callInfo.png'/></i>
							</span>
						</div>
						
					</div>
				
				
				</div>
				
			</div>
			
			
			<div class="btnn">
				<input id='btnCompanySearch' type="submit" value="검색">
			</div>
		</form>
	</div>
	<div class="copy">
		<p>&copy;차량렌트 - 검색,비교후 예약 900개 공급업체 보유, 최저가 맞춤 <a href="../index.jsp" target="_blank">travelista</a> <br/> 문의전화 000-0000-0000 <br/> 기타 상담전화 111-1111-1111</p>
	</div>
	</div>
	
	
	
	<!-- Calendar -->
	<script>
    // Create start date
    var start = new Date(),
        prevDay,
        startHours = 9;

    // 09:00 AM
    start.setHours(9);
    start.setMinutes(0);

    // If today is Saturday or Sunday set 10:00 AM
    if ([6, 0].indexOf(start.getDay()) != -1) {
        start.setHours(10);
        startHours = 10
    }

    $('#mainRent').datepicker({
        timepicker: true,
        language: 'en',
        startDate: start,
        minHours: startHours,
        maxHours: 18,
        navTitles: {
            days: '<h3>차량 인수일 : </h3> MM, yyyy'
        },
        minDate: new Date(),
        onSelect: function (fd, d, picker) {
            // Do nothing if selection was cleared
            if (!d) return;

            var day = d.getDay();

            // Trigger only if date is changed
            if (prevDay != undefined && prevDay == day) return;
            prevDay = day;

            // If chosen day is Saturday or Sunday when set
            // hour value for weekends, else restore defaults
            if (day == 6 || day == 0) {
                picker.update({
                    minHours: 10,
                    maxHours: 16
                })
            } else {
                picker.update({
                    minHours: 9,
                    maxHours: 18
                })
            }
        }
    })
    $('#mainReturn').datepicker({
        timepicker: true,
        language: 'en',
        startDate: start,
        minHours: startHours,
        maxHours: 18,
        navTitles: {
            days: '<h3>차량 반납일 : </h3> MM, yyyy'
        },
        minDate: new Date(),
        onSelect: function (fd, d, picker) {
            // Do nothing if selection was cleared
            if (!d) return;

            var day = d.getDay();

            // Trigger only if date is changed
            if (prevDay != undefined && prevDay == day) return;
            prevDay = day;

            // If chosen day is Saturday or Sunday when set
            // hour value for weekends, else restore defaults
            if (day == 6 || day == 0) {
                picker.update({
                    minHours: 10,
                    maxHours: 16
                })
            } else {
                picker.update({
                    minHours: 9,
                    maxHours: 18
                })
            }
        }
    })
</script>
	
	
	<script>
		$('#defrent').click(function(){
			$('#hiddenmain').slideToggle("fast");
		});
		$('#callimg,#hiddenmain>div:nth-child(2)').click(function(){
			$('#hiddenmainsub').slideToggle("fast");
		});
		$('#callInfosub').tooltip();
		
		var seoul = new Array("서울전체","종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구");
		var busan = new Array("부산전체","중구","서구","동구","영도구","부산진구","동래구","남구","북구","강서구","해운대구","사하구","금정구","연제구","수영구","사상구");
		var daegu = new Array("대구전체","중구","동구","서구","남구","북구","수성구","달서구");
		var inchun = new Array("인천전체","중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군");
		var guangju = new Array("광주전체","동구","서구","남구","북구","광산구");
		var daejun = new Array("대전전체","동구","중구","서구","유성구","대덕구");
		var ulsan = new Array("울산전체","중구","남구","동구","북구","울주군");
		var gyunggi = new Array("경기전체","수원시","성남시","안양시","안산시","용인시","부천시","광명시","평택시","과천시","오산시","시흥시","군포시","의왕시","하남시","이천시","안성시","김포시","화성시","광주시","여주시","양평군","고양시","의정부시","동두천시","구리시","남양주시","파주시","양주시","포천시","연천군","가평군");
		var kangwon = new Array("강원도전체","춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시","홍천군","횡성군","영월군","평창군","정선군","철원군","화천군","양구군","인제군","고성군","양양군");
		var chungbuk = new Array("충청북도전체","청주시","충주시","제천시","보은군","옥천군","영동군","증평군","진천군","괴산군","음성군","단양군");
		var chungnam = new Array("충청남도전체","천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시","금산군","부여군","서천군","청양군","홍성군","예산군","태안군");
		var junrabuk = new Array("전라북도전체","전주시","군산시","익산시","정읍시","남원시","김제시","완주군","진안군","무주군","장수군","임실군","순창군","고창군","부안군");
		var junranam = new Array("전라남도전체","목포시","여수시","순천시","나주시","광양시","담양군","곡성군","구례군","고흥군","보성군","화순군","장흥군","강진군","해남군","영암군","무안군","함평군","영광군","장성군","완도군","진도군","신안군");
		var gyungshangbuk = new Array("경상북도전체","포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시","군위군","의성군","청송군","영양군","영덕군","청도군","고령군","성주군","칠곡군","예천군","봉화군","울진군","울릉군");
		var gyungshangnam = new Array("경상남도전체","창원시","진주시","통영시","사천시","김해시","밀양시","거제시","양산시","의령군","함안군","창녕군","고성군","남해군","하동군","산청군","함양군","거창군","합천군");
		var jeju = new Array("제주전체","제주시","서귀포시");
		
		
		$('#place').change(function(){
			$('#subplace').children("option").remove();
			if($('#place').val()=="서울"){
				for(var i = 0; i < seoul.length ; i++){
					var option = "<option value='" + seoul[i] + "'>" + seoul[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="부산"){
				for(var i = 0; i < busan.length ; i++){
					var option = "<option value='" + busan[i] + "'>" + busan[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="대구"){
				for(var i = 0; i < daegu.length ; i++){
					var option = "<option value='" + daegu[i] + "'>" + daegu[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="인천"){
				for(var i = 0; i < inchun.length ; i++){
					var option = "<option value='" + inchun[i] + "'>" + inchun[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="광주"){
				for(var i = 0; i < busan.length ; i++){
					var option = "<option value='" + busan[i] + "'>" + busan[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="대전"){
				for(var i = 0; i < daejun.length ; i++){
					var option = "<option value='" + daejun[i] + "'>" + daejun[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="울산"){
				for(var i = 0; i < ulsan.length ; i++){
					var option = "<option value='" + ulsan[i] + "'>" + ulsan[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="경기도"){
				for(var i = 0; i < gyunggi.length ; i++){
					var option = "<option value='" + gyunggi[i] + "'>" + gyunggi[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="강원도"){
				for(var i = 0; i < kangwon.length ; i++){
					var option = "<option value='" + kangwon[i] + "'>" + kangwon[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="충청북도"){
				for(var i = 0; i < chungbuk.length ; i++){
					var option = "<option value='" + chungbuk[i] + "'>" + chungbuk[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="충청남도"){
				for(var i = 0; i < chungnam.length ; i++){
					var option = "<option value='" + chungnam[i] + "'>" + chungnam[i] + "</option>";
					$('#place').append(option);
				}
			}
			if($('#place').val()=="전라북도"){
				for(var i = 0; i < junrabuk.length ; i++){
					var option = "<option value='" + junrabuk[i] + "'>" + junrabuk[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="전라남도"){
				for(var i = 0; i < junranam.length ; i++){
					var option = "<option value='" + junranam[i] + "'>" + junranam[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="경상북도"){
				for(var i = 0; i < gyungshangbuk.length ; i++){
					var option = "<option value='" + gyungshangbuk[i] + "'>" + gyungshangbuk[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="경상남도"){
				for(var i = 0; i < gyungshangnam.length ; i++){
					var option = "<option value='" + gyungshangnam[i] + "'>" + gyungshangnam[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			if($('#place').val()=="제주도"){
				for(var i = 0; i < jeju.length ; i++){
					var option = "<option value='" + jeju[i] + "'>" + jeju[i] + "</option>";
					$('#subplace').append(option);
				}
			}
			
		});
		
		$('#hiddenplace').change(function(){
			$('#hiddensubplace').children("option").remove();
			if($('#hiddenplace').val()=="서울"){
				for(var i = 0; i < seoul.length ; i++){
					var option = "<option value='" + seoul[i] + "'>" + seoul[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="부산"){
				for(var i = 0; i < busan.length ; i++){
					var option = "<option value='" + busan[i] + "'>" + busan[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="대구"){
				for(var i = 0; i < daegu.length ; i++){
					var option = "<option value='" + daegu[i] + "'>" + daegu[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="인천"){
				for(var i = 0; i < inchun.length ; i++){
					var option = "<option value='" + inchun[i] + "'>" + inchun[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="광주"){
				for(var i = 0; i < busan.length ; i++){
					var option = "<option value='" + busan[i] + "'>" + busan[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="대전"){
				for(var i = 0; i < daejun.length ; i++){
					var option = "<option value='" + daejun[i] + "'>" + daejun[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="울산"){
				for(var i = 0; i < ulsan.length ; i++){
					var option = "<option value='" + ulsan[i] + "'>" + ulsan[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="경기도"){
				for(var i = 0; i < gyunggi.length ; i++){
					var option = "<option value='" + gyunggi[i] + "'>" + gyunggi[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="강원도"){
				for(var i = 0; i < kangwon.length ; i++){
					var option = "<option value='" + kangwon[i] + "'>" + kangwon[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="충청북도"){
				for(var i = 0; i < chungbuk.length ; i++){
					var option = "<option value='" + chungbuk[i] + "'>" + chungbuk[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="충청남도"){
				for(var i = 0; i < chungnam.length ; i++){
					var option = "<option value='" + chungnam[i] + "'>" + chungnam[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="전라북도"){
				for(var i = 0; i < junrabuk.length ; i++){
					var option = "<option value='" + junrabuk[i] + "'>" + junrabuk[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="전라남도"){
				for(var i = 0; i < junranam.length ; i++){
					var option = "<option value='" + junranam[i] + "'>" + junranam[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="경상북도"){
				for(var i = 0; i < gyungshangbuk.length ; i++){
					var option = "<option value='" + gyungshangbuk[i] + "'>" + gyungshangbuk[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="경상남도"){
				for(var i = 0; i < gyungshangnam.length ; i++){
					var option = "<option value='" + gyungshangnam[i] + "'>" + gyungshangnam[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			if($('#hiddenplace').val()=="제주도"){
				for(var i = 0; i < jeju.length ; i++){
					var option = "<option value='" + jeju[i] + "'>" + jeju[i] + "</option>";
					$('#hiddensubplace').append(option);
				}
			}
			
		});
		
		
		rent.func();
	</script>

</body>

</html>















