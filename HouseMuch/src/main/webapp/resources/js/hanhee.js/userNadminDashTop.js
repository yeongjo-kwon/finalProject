/*
입주민, 관리자 대시보드 탑 메뉴 js
*/
$(function(){
	$('.dept01 li').mouseover(function(){
		$('.dept02').css('display','inline')
					.slideDown(200);
	}).mouseout(function(){
		$('.dept02').css('display','none')
					.slideUp(200);
	});
	
	$('.dept01 li a').mouseover(function(){
		$(this).css('color','#7DB249');
	}).mouseout(function(){
		$(this).css('color','#666666');
	});
	
	$('.dept02 li a').mouseover(function(){
		$(this).css('color','#7DB249');
	}).mouseout(function(){
		$(this).css('color','#666666');
	});
	
	
});