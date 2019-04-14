// JavaScript Document
$(document).ready(function(){
	//横纵轴滑动函数
	/*$(this).on('touchstart', function(e) {
		e.preventDefault();
		startX = e.originalEvent.changedTouches[0].pageX,
		startY = e.originalEvent.changedTouches[0].pageY;
		});
	$(this).on('touchmove', function(e) {
		e.preventDefault();
		moveX = e.originalEvent.changedTouches[0].pageX,
		moveY = e.originalEvent.changedTouches[0].pageY;
		});
	$(this).on('touchend', function(e) {
		e.preventDefault();
		endX = e.originalEvent.changedTouches[0].pageX,
		endY = e.originalEvent.changedTouches[0].pageY,
		X = endX - startX,
		Y = endY - startY;
		if ( Y < -100 ) {
			}
		else if ( Y > 100 ) {
			}
		});*/
//function bodyVerticalAxis_slide($){
	$('body').on('touchstart', function(e) {
		//e.preventDefault();
		startX = e.originalEvent.changedTouches[0].pageX,
		startY = e.originalEvent.changedTouches[0].pageY;
		});
	$('body').on('touchend', function(e) {
		//e.preventDefault();
		endX = e.originalEvent.changedTouches[0].pageX,
		endY = e.originalEvent.changedTouches[0].pageY,
		X = endX - startX,
		Y = endY - startY;
		if ( Y < -40 ) {
			//document.addEventListener('touchmove', function (e) {e.preventDefault()});
			$('.indicator').hide(100);
			$('.banner').slideUp(300);
			$('.banner').children().fadeOut(400);
			setTimeout("$('.selectionBar').slideUp(200)",300);
			}
		});
	//}
	//$(this).bodyVerticalAxis_slide();
	$('body').on('touchstart', function(e) {
		//e.preventDefault();
		startX = e.originalEvent.changedTouches[0].pageX,
		startY = e.originalEvent.changedTouches[0].pageY;
		});
	$('body').on('touchend', function(e) {
		//e.preventDefault();
		endX = e.originalEvent.changedTouches[0].pageX,
		endY = e.originalEvent.changedTouches[0].pageY,
		X = endX - startX,
		Y = endY - startY;
		if ( Y > 80 ) {
			$('.selectionBar').slideDown(200);
			setTimeout("$('.banner').children().fadeIn(400)",200);
			setTimeout("$('.banner').slideDown(300)",200);
			setTimeout("$('.indicator').show(100)",400);
			}
		});
	//定义变量
	var monitor_entry = 0;
	/*//第一入口列表
	$('.entryList1').on('touchstart', function(e) {
		startX_entryList1 = e.originalEvent.changedTouches[0].pageX,
		startY_entryList1 = e.originalEvent.changedTouches[0].pageY;
		});
	$('.entryList1').on('touchend', function(e) {
		endX_entryList1 = e.originalEvent.changedTouches[0].pageX,
		endY_entryList1 = e.originalEvent.changedTouches[0].pageY,
		X_entryList1 = endX_entryList1 - startX_entryList1,
		Y_entryList1 = endY_entryList1 - startY_entryList1;
		if ( X_entryList1 > 40 && monitor_entry == 0 ) {
			$(this).prev().prev().animate({left:'-100%'},300);
			$(this).prev().animate({left:'0'},300);
			$(this).animate({left:'100%'},300);
			$('.screen').animate({left:'33.33%'},300);
		}
	});
	//第二入口列表
	$('.entryList2').on('touchstart', function(e) {
		startX_entryList2 = e.originalEvent.changedTouches[0].pageX,
		startY_entryList2 = e.originalEvent.changedTouches[0].pageY;
		});
	$('.entryList2').on('touchend', function(e) {
		endX_entryList2 = e.originalEvent.changedTouches[0].pageX,
		endY_entryList2 = e.originalEvent.changedTouches[0].pageY,
		X_entryList2 = endX_entryList2 - startX_entryList2,
		Y_entryList2 = endY_entryList2 - startY_entryList2;
		if ( X_entryList2 > 40 && monitor_entry == 0 ) {
			$(this).prev().animate({left:'0'},300);
			$(this).animate({left:'100%'},300);
			$(this).next().animate({left:'200%'},300);
			$('.screen').animate({left:'66.67%'},300);
		}
		else if ( X_entryList2 < -40 && monitor_entry == 0 ) {
			$(this).prev().animate({left:'-200%'},300);
			$(this).animate({left:'-100%'},300);
			$(this).next().animate({left:'0'},300);
			$('.screen').animate({left:'0'},300);
		}
	});*/
/*	//第三入口列表
	$('.entryList3').on('touchstart', function(e) {
		startX_entryList3 = e.originalEvent.changedTouches[0].pageX,
		startY_entryList3 = e.originalEvent.changedTouches[0].pageY;
		});
	$('.entryList3').on('touchend', function(e) {
		endX_entryList3 = e.originalEvent.changedTouches[0].pageX,
		endY_entryList3 = e.originalEvent.changedTouches[0].pageY,
		X_entryList3 = endX_entryList3 - startX_entryList3,
		Y_entryList3 = endY_entryList3 - startY_entryList3;
		if ( X_entryList3 < -40 && monitor_entry == 0 ) {
			$(this).animate({left:'-100%'},300);
			$(this).next().animate({left:'0'},300);
			$(this).next().next().animate({left:'100%'},300);
			$('.screen').animate({left:'33.33%'},300);
		}
	});*/
	$('.category').click(function(){
		$($(this).attr('name')).prev().prev().animate({left:'-200%'},300);
		$($(this).attr('name')).prev().animate({left:'-100%'},300);
		$($(this).attr('name')).animate({left:'0'},300);
		$($(this).attr('name')).next().animate({left:'100%'},300);
		$($(this).attr('name')).next().next().animate({left:'200%'},300);
		});
	$('.category1').click(function(){
		$('.screen').animate({left:'0'},300);
		});
	$('.category2').click(function(){
		$('.screen').animate({left:'33.33%'},300);
		});
	$('.category3').click(function(){
		$('.screen').animate({left:'66.67%'},300);
		});
/*	$('.entry').click(function(){
		var disBetEntryAndTop = $(this).offset().top;
		var presetDistance = $(this).attr('name');
		if( disBetEntryAndTop > 0){
			$(this).css('position','fixed').css('top',presetDistance).animate({top:'0'},600);
			$(this).after("<div class='placeholder' style='width: 100%;height: 4rem;border-bottom: 0.1em solid rgba(255,255,255,0);'>");
			$(this).children('.arrow').removeClass('arrowRotate_after').addClass('arrowRotate_before').css('transform','rotate(180deg)');
			$(this).siblings('.entry').fadeOut(300);
			setTimeout("$('.nav').slideUp(160)",440);
			setTimeout("$('form').animate({top:'4.05rem'},300)",600);
			setTimeout("$('.entryListContainer').animate({height:'8rem'},300)",600);
			setTimeout("$('.list').fadeIn(300)",600);
			monitor_entry = 1;
			}
		else if( disBetEntryAndTop == 0){
			$(this).animate({top:presetDistance},600);
			setTimeout("$('.entry').css('position','static')",600);
			setTimeout("$('.placeholder').remove()",600);
			$(this).children('.arrow').removeClass('arrowRotate_before').addClass('arrowRotate_after').css('transform','rotate(0)');
			setTimeout("$('.entry').fadeIn(300)",300);
			$('form').animate({top:'-5rem'},300);
			$('.entryListContainer').animate({height:'24.6rem'},300);
			$('.list').fadeOut(300);
			setTimeout("$('.nav').slideDown(160)",160);
			monitor_entry = 0;
			}
		});*/
	});