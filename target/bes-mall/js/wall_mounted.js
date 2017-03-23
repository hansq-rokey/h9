/**
 * Created by Administrator on 2015/9/11.
 */
$(document).ready(function(){
    //切换板块
    //自动轮播
    var n;
    function slider(){
    	clearTimeout($.autoscroll);
        //var index=$('.icon-circle').length;
        $('.slider-wrap').stop();
        var leftWidth=-slidwidth*n;
        $('.icon-circle-thin').removeClass('icon-circle-thin');
        $('.icon-circle').eq(n).addClass('icon-circle-thin');
        $('.slider-wrap').animate({left:leftWidth},1000);
    }
    $('.bullet li').mouseenter(function(){
        n=$(this).index();
        slider();
    });
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
  
    
    var index=$('.icon-circle').length;
    var slidwidth=$('.section').width();
    $('.slider-wrap').css('width',index*slidwidth);
    $('.slider').css('width',slidwidth);
    $.autoscroll=function (){
        var curindex=$('.icon-circle-thin').index();
        var leftWidth=-slidwidth*(curindex+1);
        if(curindex==index-1){
            curindex=0;
            $('.slider-wrap').animate({left:'0'});
        }else{
            curindex=curindex+1;
            $('.slider-wrap').animate({left:leftWidth},1000);
        }
        $('.icon-circle-thin').removeClass('icon-circle-thin');
        $('.icon-circle').eq(curindex).addClass('icon-circle-thin');
        //$('.curslider').fadeOut(800).removeClass('curslider');
        //$('.slider').eq(curindex).fadeIn(800).addClass('curslider');
    };
    //setInterval(function(){
    //    $.autoscroll()
    //},5000);
    //
    var width=$(window).width();
    var open=true;
    $('.prodbox').css('width',width);
    function delay(){

    }
    function act21(){
        if($('.section').find('img').is(":animated")){
            $('.section').find('img').stop();
        }
        delay=setTimeout(function(){
            $(".secimg24").animate({opacity:'1'},300);
        },900);
        $(".secimg23").animate({opacity:'1',bottom:'93px'},1200);
        $(".secimg22").animate({opacity:'0'},1200);
        $(".secimg21").animate({opacity:'1',bottom:'121px'},1200);
    }
    function act22(){
            if($('.section').find('img').is(":animated")){
                $('.section').find('img').stop();
                clearTimeout(delay);
            }
            $(".secimg23").animate({opacity:'0.5',bottom:'235px'},1000);
            $(".secimg22").animate({opacity:'1',bottom:'36px'},1000);
            $(".secimg24").animate({opacity:'0'},200);
            $(".secimg25").animate({opacity:'0'},300);
            $(".secimg21").animate({opacity:'0.5',bottom:'70px'},1000);
    }
    function act5(){
        setTimeout(function(){
            $(".colorLump1").animate({width:'138px'},800);
            $(".colorLump2").animate({width:'297px'},800);
            $(".colorLump3").animate({width:'344px'},800);
        });
    }
    function act91(){
        setTimeout(function(){
            $(".secimg91").animate({marginLeft:'-312px',top:'115px',width:'380px'},1000);
            $('.whiteBg').animate({opacity:'0'},1000);
        });
        setTimeout(function(){
            $(".secimg96").animate({opacity:'1'},300)
        },900);
    }
    function act92(){
        setTimeout(function(){
            $(".secimg91").animate({marginLeft:'-372px',top:'130px',width:'340px'},1000);
            $('.whiteBg').animate({opacity:'0'},1000);
        });
        setTimeout(function(){
            $(".secimg96").animate({opacity:'1'},300)
        },900);
    }
    function act93(){
        setTimeout(function(){
            $(".secimg91").animate({marginLeft:'-432px',top:'145px',width:'300px'},1000);
            $('.whiteBg').animate({opacity:'0'},1000);
        });
        setTimeout(function(){
            $(".secimg96").animate({opacity:'1'},300)
        },900);
    }
    function act94(){
        setTimeout(function(){
            $(".secimg91").animate({marginLeft:'-492px',top:'160px',width:'260px'},1000);
            $('.whiteBg').animate({opacity:'0'},1000);
        });
        setTimeout(function(){
            $(".secimg96").animate({opacity:'1'},300)
        },900);
    }
    function act95(){
        setTimeout(function(){
            $(".secimg91").animate({marginLeft:'-512px',top:'173px',width:'217px'},1000);
            $('.whiteBg').animate({opacity:'0'},1000);
        });
        setTimeout(function(){
            $(".secimg96").animate({opacity:'1'},300)
        },900);
            setInterval($.autoscroll,6000);
            pass=true;
    }
    var pass=false;
    $(document).on("mousewheel DOMMouseScroll scroll", function () {
        var top=$(window).scrollTop();
        if (top > 3999&& top < 5001) {
            act5();
        }
    })
    $(document).on("mousewheel", function (event, delta) {
        var top=$(window).scrollTop();
        if ($(window).scrollTop() > 60) {
            $('.content-nav-box').addClass('fixed');
        }
        if ($(window).scrollTop() < 100) {
            $('.content-nav-box').removeClass('fixed');
        }

        if (delta < 0){
            if (top > 599 && top < 1099) {
                if(open==true) {
                    open = false;
                    act22();
                }
            }if (top >1099 && top < 1353) {
                if(open==false) {
                    open = true;
                    act21();
                }
            }
            //if (top > 6999&& top < 7098) {
            //    if(pass==false){
            //        act91();
            //    }
            //}
            //if (top > 7099&& top < 7198) {
            //    if(pass==false){
            //        act92();
            //    }
            //}
            //if (top > 7199&& top < 7298) {
            //    if(pass==false){
            //        act93();
            //    }
            //}
            //if (top > 7299&& top < 7398) {
            //    if(pass==false){
            //        act94();
            //    }
            //}
            if (top > 6999&& top < 7798) {
                if(pass==false){
                    pass=true;
                    act95();
                }
            }
        } else if (delta >0){
            if (top < 1300 && top > 900) {
                if(open==true) {
                    open = false;
                    act22();
                }
            }if (top <900 && top > 700) {
                if(open==false) {
                    open = true;
                    act21();
                }
            }
        }
    });
});
function alertLayel(e){
	var html='<div class="alertpop" style="display: block;position: fixed;width: 100%;height:100%;top:0;left:0;z-index: 9999;"><div class="popbg" style="    width: 100%;height:100%;position: absolute;top:0;left:0;z-index: 989;background: #000;opacity: 0.5;"></div><div class="alertLayel" style="width:400px;height:200px;padding-top:10px;background:#fff;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;z-index:9999;"><h3 style="height:30px;position:relative;margin:0;"><i class="closeicon" style="margin-right:12px;margin-top:0;"></i> </h3><p class="alertContent" style="line-height:30px;font-size:14px;text-align:center;height:100px;">'+e+'</p><div class="row tc"><input type="button" value="确定" class="alertBtn" style="height:30px;border:none;width:80px;background:#ff6200;color:#fff;"></div></div></div>';
	$("body").append(html);
}