<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 	<div class="row">
			<div class="col-12 pt-3" style='height:70px; border-top:1px solid black;' >
				<h3 style='float:left'>리뷰(2)</h3>
				<input class="btn btn-primary float-right"  onclick="insertMove()"  type='button' id='review'  name='review' value='리뷰작성'/>
			</div>
				
			<div class="col-12">
				<span style='display:inline-block;margin-bottom:10px; font-size:larger'>여행자 평가</span><br/>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name='5' id='5' value='star5' />
					<label class="custom-control-label float-left mr-3" for="5">최고였어요</label>
					<div class="progress">
				 		 <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='4' id='4' value='star4' /> 
					<label class="custom-control-label float-left mr-3" for="4">좋았어요...</label>
					<div class="progress">
				  		<div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='3' id='3' value='star3'> 
					<label class="custom-control-label float-left mr-3" for="3">평범했어요</label>
					<div class="progress">
				 		 <div class="progress-bar progress-bar-striped float-right" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='2' id='2' value='stra2'> 
					<label class="custom-control-label float-left mr-3" for="2">별로였어요</label>
					<div class="progress">
				  		<div class="progress-bar progress-bar-striped float-right " role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div class="custom-control custom-checkbox">
					<input type='checkbox' class="custom-control-input" name='1' id='1' value='stra1'> 
					<label class="custom-control-label float-left mr-3" for="1">실망했어요</label>
					<div class="progress">
				  		<div class="progress-bar progress-bar-striped float-right " role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>

			<br/>

			<div class="col-12 mt-2 " >
				<h5>여행자 리뷰 보기:</h5>
				<div class="form-row mt-3">
					<input type='text' class="form-control col-11 " id='find' name='find' value=''  placeholder="검색하실 리뷰를 작성해주세요........." style="height: fit-content;" >
					<button class="form-group btn btn-primary col-1" id='findStr' name='findStr' ><i class="fa fa-search"></i></button>
				</div>
			</div>
		</div>
		<div class="row border-bottom py-3">
			<div class="col-2">
				<img class="rounded-circle" src="./images/festival/1.png" alt="글쓴이">
				<p class='text-center mt-3'>작성자</p>
			</div>
			<div class="col-10">
				<div class='rating' data-rate='5'> <!-- data-rate에 별점을입력(5초과금지) -->
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
				</div>
				<span>2020년 1월 15일에 작성</span>
				<span class="float-right">8명의 이용자가 도움이 됐다고 하던뎁숑?!</span>
				<h5>리뷰제목</h5>
				<div class="review-box">
					<p class="pre-view">리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다입니다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난다리뷰입니다ㄴ난ㄴㄴ</p>
					<span class="btn-moreInfo">[더보기]</span>
				</div>
				<p><span>방문 날짜 : </span>2020년 1월</p>
				<p>도움이 됐나요? <button class="btn btn-outline-secondary"><i class="fa fa-thumbs-up"></i></button></p>
			</div>
		</div>
		<div class="row border-bottom py-3">
			<div class="col-2">
				<img class="rounded-circle" src="./images/festival/1.png"alt="글쓴이">
				<p class='text-center mt-3'>작성자</p>
			</div>
			<div class="col-10">
				<div class="rating" data-rate="3"> <!-- data-rate에 별점을입력(5초과금지) -->
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
					<i class="fa fa-star"></i>
				</div>
				<span>2020년 1월 15일에 작성</span>
				<span class="float-right">8명의 이용자가 도움이 됐다고 하던뎁숑?!</span>
				<h5>리뷰제목</h5>
				<div class="review-box">
					<p class="pre-view">리뷰입니다</p>
					<span class="btn-moreInfo">[더보기]</span>
				</div>
				<p><span>방문 날짜 : </span>2020년 1월</p>
				<p>도움이 됐나요? <button class="btn btn-outline-secondary"><i class="fa fa-thumbs-up"></i></button></p>
			</div>
		</div>			
		
		


	<script>
	
	
	// 리뷰 두줄이상 넘어가면 더보기
		jQuery(function ($) {
			var colorbox = $('.review-box .pre-view');
			colorbox.each( function() {
				$( this ).outerHeight();
				if( $(this).outerHeight() > 21 ){
				$(this).addClass('hidden');
				var btnMoreCmt = $(this).siblings('.btn-moreInfo');
				btnMoreCmt.show();
				btnMoreCmt.on("click",function(){
					$(this).siblings('.pre-view').removeClass('hidden');
					$(this).remove();
				});
				}
			} );
		});

	//별점표시하기
	
		 $(function(){
			var rating = $('.rating');
			
			rating.each(function(){
				var targetScore = $(this).attr('data-rate');
				$(this).find('i:nth-child(-n+' + targetScore +')').css({color:'#ffc107'});
			});
				
		}); 
	
		//  다음 지도  api 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('서울특별시 종로1.2.3.4가동', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			} 
		});  
		
	</script>

	
  <!-- Swiper JS -->
  <script src="./swiper-5.3.8/package/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
  var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      slidesPerView: 4,
      freeMode: true,
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      thumbs: {
        swiper: galleryThumbs
      }
    });
    
    



	
	
	// 리뷰 두줄이상 넘어가면 더보기
		jQuery(function ($) {
			var colorbox = $('.review-box .pre-view');
			colorbox.each( function() {
				$( this ).outerHeight();
				if( $(this).outerHeight() > 21 ){
				$(this).addClass('hidden');
				var btnMoreCmt = $(this).siblings('.btn-moreInfo');
				btnMoreCmt.show();
				btnMoreCmt.on("click",function(){
					$(this).siblings('.pre-view').removeClass('hidden');
					$(this).remove();
				});
				}
			} );
		});

	//별점표시하기
	
		 $(function(){
			var rating = $('.rating');
			
			rating.each(function(){
				var targetScore = $(this).attr('data-rate');
				$(this).find('i:nth-child(-n+' + targetScore +')').css({color:'#ffc107'});
			});
				
		}); 
    
    
  </script>