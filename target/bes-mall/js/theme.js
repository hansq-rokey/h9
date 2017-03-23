/**
 * Created by Administrator on 2015/9/14.
 */
$(document).ready(function(){
    setInterval(flicker, 5000);
    flicker();
    function flicker() {
        var x = 27;
        var y = 1;
        //var rand =2;
        var rand = parseInt(Math.random() * (x - y + 1) + y);
        $('.content-left').find('div').removeClass().addClass('point'+rand+'').find('img').animate({width:'40px',height:'40px',opacity:'1'},1500,function(){
            $('.content-left').find('.point').animate({width:'0px',height:'0px',opacity:'0'},1300)
        });
    }
    var rotation = function (){
        $(".light-img,.head-office-sun").rotate({
            angle:0,
            animateTo:360,
            callback: rotation,
            duration:3000,
            easing: function (x,t,b,c,d){        // t: current time, b: begInnIng value, c: change In value, d: duration
                return c*(t/d)+b;
            }
        });
    };
    rotation();
    function width(){
        var w=$('.content-box').width();
        width=w-359;
        $('.left-item').css('width',width);
    }
    width();
    //左侧滚动图宽度
    $(window).resize(function(){
        var w=$(window).width();
        width=w-359;
        $('.left-item').css('width',width);
    })
    //点击图片打开
    var rightlist=$('.right-list');
    $('.right-list li').on('click',function(){
        var x=$(this).index();
        var L=$(rightlist).find('li').length;
        var top="";
        $('.left-list').show().animate({height:'100%',width:'100%'},600).addClass('opened').find('li').eq(x).fadeIn(1000);
        $(animateimg).animate({opacity:'0'},500).find('.yellowbg').css('top','54px').siblings('.bluebg').css({opacity:'1'}).siblings('.show-ice').css({width:'26px',height:"26px"}).siblings('.show-sun').css({width:'0px',height:"0px"});
        $(animateimg).eq(x).animate({opacity:'1'},500);
        $(animateimg).eq(x).find('.yellowbg').animate({top:'2px'},1000);
        $(animateimg).eq(x).find('.bluebg').animate({opacity:'0'},1000);
        setTimeout(function(){
            $(animateimg).eq(x).find('.yellowbg').animate({top:'6px'},100);
        },1000);
        setTimeout(function(){
            $(animateimg).eq(x).find('.yellowbg').animate({top:'3px'},100);
        },1100);
        setTimeout(function(){
            $(animateimg).eq(x).find('.yellowbg').animate({top:'5px'},100);
        },1200);
        setTimeout(function(){
            $(animateimg).eq(x).find('.yellowbg').animate({top:'4px'},100);
        },1300);
        $(animateimg).eq(x).find('.show-ice').animate({width:'0',height:'0'},1000);
        $(animateimg).eq(x).find('.show-sun').animate({width:'26px',height:'26px'},1000);
        //$('.left-list').find('.right-item').animate({width:'359px'},1000)
        //setTimeout(function() {
        //    ;
        //},1000);
        $('.on').removeClass('on').animate({marginLeft:'0px'},1000).find('img,p').animate({opacity:'0'},1000);
        $('.right-list li').eq(x).addClass('on').animate({marginLeft:'-20px'},600).find('img,p').animate({opacity:'1'},1000);
        if(x<L-4){
            top=-193*x;
        }if(x>=L-4){
            top=-193*(L-4);
        }
        $('.right-list').animate({top:top},1000);
    });
    //关闭图片
    $('.close-icon').on('click',function(){
        $('.left-list').removeClass('opened').animate({height:'0',width:'0'},600).find('li').fadeOut(1000);
        //$('.right-item').animate({opacity:'0'},1000)
    });
    //太阳切换动画
    var animateimg=$('.animate-img');
    function sun(index,up,L){
        if(up==1){
            if(index>=L-1){
                //$(animateimg).eq(index).animate({opacity:'0'},500).find('.yellowbg').css('top','54px').siblings('.bluebg').css({opacity:'1'}).siblings('.show-ice').css({width:'26px',height:"26px"}).siblings('.show-sun').css({width:'0px',height:"0px"});
                $(animateimg).css({opacity:'0'});
                $(animateimg).find('.bluebg').css({opacity:'1'});
                $(animateimg).find('.yellowbg').css({top:'54px'});
                $(animateimg).find('.show-sun').css({width:'0',height:'0'});
                $(animateimg).find('.show-ice').css({width:'26px',height:'26px'});
                $(animateimg).eq(0).animate({opacity:'1'},500);
                $(animateimg).eq(0).find('.yellowbg').animate({top:'2px'},1000);
                $(animateimg).eq(0).find('.bluebg').animate({opacity:'0'},1000);
                setTimeout(function(){
                    $(animateimg).eq(0).find('.yellowbg').animate({top:'6px'},100);
                },1000);
                setTimeout(function(){
                    $(animateimg).eq(0).find('.yellowbg').animate({top:'3px'},100);
                },1100);
                setTimeout(function(){
                    $(animateimg).eq(0).find('.yellowbg').animate({top:'5px'},100);
                },1200);
                setTimeout(function(){
                    $(animateimg).eq(0).find('.yellowbg').animate({top:'4px'},100);
                },1300);
                $(animateimg).eq(0).find('.show-ice').animate({width:'0',height:'0'},1000);
                $(animateimg).eq(0).find('.show-sun').animate({width:'26px',height:'26px'},1000);
            }else{
                $(animateimg).css({opacity:'0'});
                $(animateimg).find('.bluebg').css({opacity:'1'});
                $(animateimg).find('.yellowbg').css({top:'54px'});
                $(animateimg).find('.show-sun').css({width:'0',height:'0'});
                $(animateimg).find('.show-ice').css({width:'26px',height:'26px'});
                //$(animateimg).eq(index).animate({opacity:'0'},100).find('.yellowbg').css('top','54px').siblings('.bluebg').css({opacity:'1'}).siblings('.show-ice').css({width:'26px',height:"26px"}).siblings('.show-sun').css({width:'0px',height:"0px"});
                $(animateimg).eq(index+1).animate({opacity:'1'},500);
                $(animateimg).eq(index+1).find('.yellowbg').animate({top:'2px'},1000);
                $(animateimg).eq(index+1).find('.bluebg').animate({opacity:'0'},1000);
                setTimeout(function(){
                    $(animateimg).eq(index+1).find('.yellowbg').animate({top:'6px'},100);
                },1000);
                setTimeout(function(){
                    $(animateimg).eq(index+1).find('.yellowbg').animate({top:'3px'},100);
                },1100);
                setTimeout(function(){
                    $(animateimg).eq(index+1).find('.yellowbg').animate({top:'5px'},100);
                },1200);
                setTimeout(function(){
                    $(animateimg).eq(index+1).find('.yellowbg').animate({top:'4px'},100);
                },1300);
                $(animateimg).eq(index+1).find('.show-ice').animate({width:'0',height:'0'},1000);
                $(animateimg).eq(index+1).find('.show-sun').animate({width:'26px',height:'26px'},1000);
            }
        }
        if(up==2){
            if(index==0){
                //$(animateimg).eq(index).animate({opacity:'1'},500);
                //$(animateimg).eq(index).find('.yellowbg').animate({top:'54px'},1000);
                //$(animateimg).eq(index).find('.show-ice').animate({width:'0',height:'0'},1000);
                //$(animateimg).eq(index).find('.show-sun').animate({width:'26px',height:'26px'},1000);
                //$(animateimg).eq(index).animate({opacity:'0'},100).find('.yellowbg').css('top','54px').siblings('.bluebg').css({opacity:'1'}).siblings('.show-ice').css({width:'26px',height:"26px"}).siblings('.show-sun').css({width:'0px',height:"0px"});
                //setTimeout(function(){
                //$(animateimg).eq(index).animate({opacity:'1'},100);
                //$(animateimg).eq(index).find('.yellowbg').animate({top:'2px'},1000);
                //$(animateimg).eq(index).find('.bluebg').animate({opacity:'0'},1000);
                //},500);
                //setTimeout(function(){
                //    $(animateimg).eq(index).find('.yellowbg').animate({top:'6px'},100);
                //},1500);
                //setTimeout(function(){
                //    $(animateimg).eq(index).find('.yellowbg').animate({top:'3px'},100);
                //},1600);
                //setTimeout(function(){
                //    $(animateimg).eq(index).find('.yellowbg').animate({top:'5px'},100);
                //},1700);
                //setTimeout(function(){
                //    $(animateimg).eq(index).find('.yellowbg').animate({top:'4px'},100);
                //},1800);
                //$(animateimg).eq(index).find('.show-ice').animate({width:'0',height:'0'},1000);
                //$(animateimg).eq(index).find('.show-sun').animate({width:'26px',height:'26px'},1000);
            }else{
                $(animateimg).eq(index).css({opacity:'0'});
                $(animateimg).find('.bluebg').css({opacity:'1'});
                $(animateimg).find('.yellowbg').css({top:'54px'});
                $(animateimg).find('.show-sun').css({width:'0',height:'0'});
                $(animateimg).find('.show-ice').css({width:'26px',height:'26px'});
                //$(animateimg).eq(index).animate({opacity:'0'},500).find('.yellowbg').css('top','54px').siblings('.bluebg').css({opacity:'1'}).siblings('.show-ice').css({width:'26px',height:"26px"}).siblings('.show-sun').css({width:'0px',height:"0px"});
                $(animateimg).eq(index-1).animate({opacity:'1'},500);
                $(animateimg).eq(index-1).find('.yellowbg').animate({top:'2px'},1000);
                $(animateimg).eq(index-1).find('.bluebg').animate({opacity:'0'},1000);
                setTimeout(function(){
                    $(animateimg).eq(index-1).find('.yellowbg').animate({top:'6px'},100);
                },1000);
                setTimeout(function(){
                    $(animateimg).eq(index-1).find('.yellowbg').animate({top:'3px'},100);
                },1100);
                setTimeout(function(){
                    $(animateimg).eq(index-1).find('.yellowbg').animate({top:'5px'},100);
                },1200);
                setTimeout(function(){
                    $(animateimg).eq(index-1).find('.yellowbg').animate({top:'4px'},100);
                },1300);
                $(animateimg).eq(index-1).find('.show-ice').animate({width:'0',height:'0'},1000);
                $(animateimg).eq(index-1).find('.show-sun').animate({width:'26px',height:'26px'},1000);
            }
        }
    }
    //滚动
        $(document).on("mousewheel", function (event, delta) {
            if(!$(rightlist).find('li').is(":animated")){
            var index=$('.on').index();
            var L=$(rightlist).find('li').length;
                var li=$('.left-list li')
                var up;
            if (delta < 0) {
                // 向上滚
                up=1;
                if(index>=0&&index<L-4){
                    var top=-193*(index+1);
                    var h=$(li).height();
                    $('.on').removeClass('on').animate({marginLeft:'0px'},1000).find('img,p').animate({opacity:'0'},1000);
                    $(rightlist).animate({top:top},1000);
                    sun(index,up,L);
                    $('.right-list li').eq(index+1).addClass('on').animate({marginLeft:'-20px'},1000).find('img,p').animate({opacity:'1'},1000);
                    if($('.left-list').hasClass('opened')){
                        $(li).eq(index).fadeOut(2000).find('.right-item');
                        $(li).eq(index+1).fadeIn(2000).addClass('11');
                    }
                }
                if(index>=0&&index>=L-4&&index<L-1){
                    $('.on').removeClass('on').animate({marginLeft:'0px'},1000).find('img,p').animate({opacity:'0'},1000);
                    $('.right-list li').eq(index+1).addClass('on').animate({marginLeft:'-20px'},1000).find('img,p').animate({opacity:'1'},1000);
                    sun(index,up,L);
                    if($('.left-list').hasClass('opened')){
                        $(li).eq(index).fadeOut(2000).find('.right-item');
                        $(li).eq(index+1).fadeIn(2000).addClass('11');
                    }
                }if(index>=0&&index>=L-1){
                    $('.on').removeClass('on').animate({marginLeft:'0px'},1000).find('img,p').animate({opacity:'0'},1000);
                    $(rightlist).animate({top:0},1000);
                    $('.right-list li').eq(0).addClass('on').animate({marginLeft:'-20px'},1000).find('img,p').animate({opacity:'1'},1000);
                    sun(index,up,L);
                    if($('.left-list').hasClass('opened')){
                        $(li).eq(index).fadeOut(2000).find('.right-item');
                        $(li).eq(0).fadeIn(2000).addClass('11').css('z-index','1002');
                    }
                }
            } else if (delta > 0) {
                // 向下滚
                up=2;
                if(index<L&&index>L-4){
                    $('.on').removeClass('on').animate({marginLeft:'0px'},1000).find('img,p').animate({opacity:'0'},1000);
                    $('.right-list li').eq(index-1).addClass('on').animate({marginLeft:'-20px'},1000).find('img,p').animate({opacity:'1'},1000);
                    sun(index,up,L);
                    if($('.left-list').hasClass('opened')){
                        $(li).eq(index).fadeOut(2000).find('.right-item');
                        $(li).eq(index-1).fadeIn(2000).addClass('11');
                    }
                }if(index<L&&index<=L-4&&index>0){
                    var top=$(rightlist).position().top;
                    top=top+193;
                    $('.on').removeClass('on').animate({marginLeft:'0px'},1000).find('img,p').animate({opacity:'0'},1000);
                    $(rightlist).animate({top:top},1000);
                    $('.right-list li').eq(index-1).addClass('on').animate({marginLeft:'-20px'},1000).find('img,p').animate({opacity:'1'},1000);
                    sun(index,up,L);
                    if($('.left-list').hasClass('opened')){
                        $(li).eq(index).fadeOut(2000).find('.right-item');
                        $(li).eq(index-1).fadeIn(2000).addClass('11');
                    }
                }if(index<L&&index<1){
                    $('.right-list li').eq(index).addClass('on').css({marginLeft:'-20px'});
                    sun(index,up,L);
                    if($('.left-list').hasClass('opened')){
                        $(li).eq(index).fadeIn(2000).addClass('11').css('z-index','1002').find('.right-item').animate({height:'100%'},1000);
                    }
                }
            }
            }
        });
    //jQuery(function($) {
    //    $('div.mousewheel_example')
    //        .bind('mousewheel', function(event, delta) {
    //            var dir = delta > 0 ? 'Up' : 'Down',
    //                vel = Math.abs(delta);
    //            return false;
    //        });
    //});
});