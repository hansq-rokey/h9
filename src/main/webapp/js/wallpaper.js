/**
 * Created by Administrator on 2016/4/6.
 */
$(function(){
    Switch=0;
    //问题反馈
    $('.feedback').on('click',function(){
        $('.pop').show();
    })
    $('.closeicon').on('click',function(){
        $(this).parent().parent().parent().hide();
    });
    //弹窗
    $(document).on('click','.alertBtn,.closeicon',function(){
        $('.alertpop').remove();
    });
    var height=$(window).height();
    $('.pages').css('height',height);
    var page=-1;
    $(document).on("mousewheel", function (event, delta) {
        //向下滚动
        if(!$('.scroll-wrapper').find('div').is(":animated")) {
    		  console.log(page);
              scoll(event, delta);
            if(page!=8 && page!=-1){
                $('.icon-circle-thin').removeClass('icon-circle-thin');
                $('.icon-circle').eq(page).addClass('icon-circle-thin');
            }
        }
    });
    function scoll(event, delta){
            if (delta < 0) {
                if(page==-1){
                    $('.container').animate({top: '-70px'},500);
                    $('.bullet').fadeIn(500);
                }
                if (page==0) {
                	$('.container').animate({top: -1 * height-70},1500);
                }
                 if (page == 1) {
            	  	$('.container').animate({top: -2 * height-70},1500);
                }
                if (page == 2) {
                    $('.container').animate({top: -3 * height-70},1500);
                }
                if (page == 3) {
                    $('.container').animate({top: -4 * height-70},1500);
                }
                if (page == 4) { 
                    $('.container').animate({top: -5 * height-70},1500);
                }
                if (page== 5) { 
            	  $('.container').animate({top: -6 * height-70},1500);
            	  console.log(-6 * height-70);
                }
                if (page == 6) {
                    $('.container').animate({top: -7 * height-70-352},1500);
                   console.log(-6 * height-70-352);
                }
               
                if (page < 8) {
                    page = page + 1;
                }
                if (page > 8) {
                    page = 8;
                }
            }
            //向上滚动
            if (delta > 0) {
            	if (page == -1) {
                    $('.container').animate({top: '0'},1500);
                }
                if (page == 1) {
                    $('.container').animate({top: '-70px'},1500);
                }
                if (page == 2) {
                    $('.container').animate({top: -1 * height-70},1500);
                }
                if (page == 3) {
                    $('.container').animate({top: -2 * height-70},1500);
                }
                if (page == 4) {
                    $('.container').animate({top: -3 * height-70},1500);
                }
                if (page == 5) {
                    $('.container').animate({top: -4 * height-70},1500);
                    $('.image41').animate({width: '738px'}, 2000);
                    $('.image43').animate({width: '738px'}, 2000);
                    $('.image45').animate({width: '738px'}, 2000);
                }
                if (page == 6) {
                    $('.container').animate({top: -5 * height-70},1500);
                }
                if (page == 7) {
                	$('.container').animate({top: -6 * height-70},1500);
                	
                }
                if(page > -1){
                    page = page - 1;
                }
                if (page < -1) {
                    page = -1;
                }
            }
    }
    $('.icon-circle').on('click',function(){
        if(!$('.scroll-wrapper').find('div').is(":animated")) {
            var num = $(this).attr('data-num');
            $('.icon-circle-thin').removeClass('icon-circle-thin');
            $(this).addClass('icon-circle-thin');
            page = num - 1;
            $('.container').animate({top: -(num - 1) * height-70}, 2000);
         /*   setTimeout(function () {
            if (page == 3) {
                $('.image41').animate({width: '738px'}, 2000);
                setTimeout(function () {
                    $('.image43').animate({width: '738px'}, 2000);
                }, 600);
                setTimeout(function () {
                    $('.image45').animate({width: '738px'}, 2000);
                    $('.image42,.image44,.image46').fadeIn(1200);
                }, 1200);
            }
            }, 2000);*/
        }
    });
})
