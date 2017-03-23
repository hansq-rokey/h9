var $document=$(".wrap").height();//文档高度
function scroll(thisname){
	var $thisOff=$(thisname).offset().top;
}
$(function(){
	$(window).scroll(function(event) {
		var $window=$(window).height();//浏览器高度
		var $scrollTop= $(document).scrollTop();//滚动距离
		var $notIn1=($scrollTop>($(".slider1").offset().top-50+$(".slider1").outerHeight()))||(($scrollTop+$window)<$(".slider1").offset().top);
		var $notIn2=($scrollTop>($(".slider2").offset().top-50+$(".slider3").outerHeight()))||(($scrollTop+$window)<$(".slider3").offset().top);
		var $notIn3=($scrollTop>($(".slider3").offset().top-50+$(".slider3").outerHeight()))||(($scrollTop+$window)<$(".slider3").offset().top);
		var $notIn4=($scrollTop>($(".slider4").offset().top-50+$(".slider4").outerHeight()))||(($scrollTop+$window)<$(".slider4").offset().top);
		var $notIn5=($scrollTop>($(".slider5").offset().top-50+$(".slider5").outerHeight()))||(($scrollTop+$window)<$(".slider5").offset().top);
		var $notIn6=($scrollTop>($(".slider6").offset().top-50+$(".slider6").outerHeight()))||(($scrollTop+$window)<$(".slider6").offset().top);
		var $notIn7=($scrollTop>($(".slider7").offset().top-50+$(".slider7").outerHeight()))||(($scrollTop+$window)<$(".slider7").offset().top);
		var $notIn8=($scrollTop>($(".slider8").offset().top-50+$(".slider8").outerHeight()))||(($scrollTop+$window)<$(".slider8").offset().top);
		var $notIn9=($scrollTop>($(".slider9").offset().top-50+$(".slider9").outerHeight()))||(($scrollTop+$window)<$(".slider9").offset().top);
		var $notIn10=($scrollTop>($(".slider10").offset().top-50+$(".slider10").outerHeight()))||(($scrollTop+$window)<$(".slider10").offset().top);
		var $notIn11=($scrollTop>($(".slider11").offset().top-50+$(".slider11").outerHeight()))||(($scrollTop+$window)<$(".slider11").offset().top);
		  if(!$notIn1){
		    $(".slider2 h1").addClass('animation').removeClass('hide');
		    $(".slider2 p").addClass('animation1').removeClass('hide1');
		  }
		  if(!$notIn2){
		     $(".slider3 h2").addClass('animation').removeClass('hide');
		     $(".slider3 p").addClass('animation1').removeClass('hide1');
		     $(".bg1_2").animate({top:"670px"}, 2000);
		     $(".append_desc3").addClass('animation').removeClass('hide');
		     $(".bg3_1").animate({top:"230px",left:"145px"}, 2000);
		  }
		  if(!$notIn3){
	     	 $(".bg3_1").animate({top:"230px",left:"145px"}, 2000);
		  }else{
		  	$(".slider4").removeClass('aaa');
		  }
		  if(!$notIn4){
	     	$(".bg5_2").animate({width:"826px"},2000);
	     	$(".bg5_3").animate({width:"826px"},3000);
	     	act5();
		  }
		  if(!$notIn5){
	     	act5();
	     	$()
		  }
		  if(!$notIn6){
	     	act5();
		  }else{
		  	$(".slider7").removeClass('aaa');
		  }
		  if(!$notIn7){
	     	$(".slider8").addClass('aaa');
		  }else{
		  	$(".slider8").removeClass('aaa');
		  }
		  if(!$notIn8){
	     	$(".slider9").addClass('aaa');
		  }else{
		  	$(".slider9").removeClass('aaa');
		  }
		  if(!$notIn9){
	     	$(".slider10").addClass('aaa');
		  }else{
		  	$(".slider10").removeClass('aaa');
		  }
		  if(!$notIn10){
	     	$(".slider11").addClass('aaa');;
		  }else{
		  	$(".slider11").removeClass('aaa');
		  }
		  if(!$notIn11){
	     	$(".slider12").addClass('aaa');;
		  }else{
		  	$(".slider12").removeClass('aaa');
		  }

	});
})
function act5(){
	$(".line1").animate({opacity:"1",left: 0}, 1000);
 	$(".line2").animate({opacity:"1",left: 0}, 1000);
 	$(".line3").animate({opacity:"1",rigth: 0}, 1000);
 	$(".line4").animate({opacity:"1",rigth: 0}, 1000);
 	$(".bg7_2 p").animate({opacity:"1"},2000);
 	$(".bg7_3 p").animate({opacity:"1"},2000);
 	$(".bg7_4 p").animate({opacity:"1"},3000);
 	$(".bg7_5 p").animate({opacity:"1"},3000);
}