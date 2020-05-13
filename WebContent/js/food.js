var rating = $('.rating');
	
rating.each(function(){
	var targetScore = $(this).attr('data-rate');
	$(this).find('i:nth-child(-n' + targetScore +')').css({color:'#ffc107'});
});
		
