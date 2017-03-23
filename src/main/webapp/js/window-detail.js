/**
 * Created by Administrator on 2015/9/18.
 */
/**
 * Created by Administrator on 2015/9/11.
 */
$(document).ready(function(){
    //切换板块
    $('.content-nav-li').on('click',function(){
        var x=$(this).index();
        $('.on').removeClass('on');
        $('.select').removeClass('select');
        $(this).find('a').addClass('on');
        $('.prodinforbox').eq(x).addClass('select')
    })
    //
    var width=$(window).width();
    $('.prodbox').css('width',width);

    $('.prodliatbox').mouseover(function(){
        $(this).css({opacity:'1'}).siblings().css({opacity:'0.3'});
    })

    function act2(){
        setTimeout(function(){
            $(".secimg21").animate({bottom:'20px',opacity:'1'},1800,'easeOutSine')
        },400);
    }
    //function act3(){
    //    setTimeout(function(){
    //        $(".secimg").animate({opacity:'1',marginLeft:'256px'},1000,'easeOutSine')
    //    },500)
    //}
    function act4(){
        setTimeout(function(){
            $(".secimg41").animate({opacity:'1.0'},800,'easeOutSine')
        },0);
        setTimeout(function(){
            $(".secimg42").animate({opacity:'1'},800,'easeOutSine')
        },500);
        setTimeout(function(){
            $(".secimg43").animate({opacity:'1'},800,'easeOutSine')
        },1000);
        setTimeout(function(){
            $(".secimg44").animate({width:'390px'},800,'easeOutSine')
        },1500);
        setTimeout(function(){
            $(".secimg45").animate({opacity:'1',marginLeft:'250px'},800,'easeOutSine')
        },2300);
    }
    function act5(){
        setTimeout(function(){
            $(".secimg51").animate({bottom:'84px',marginLeft:'-45px',opacity:'1'},800,'easeOutSine');
        },0);
    }
    function act6(){
        setTimeout(function(){
            $(".secimg61").animate({opacity:'1'},1500,'easeOutSine')
        },200)
    }
    function act7(){
        setTimeout(function(){
            $(".secimg71").animate({marginLeft:'-960px',opacity:'1'},1400,'easeOutSine')
        },0);
        setTimeout(function(){
            $(".secimg72").animate({marginLeft:'-960px',opacity:'1'},1400,'easeOutSine')
        },0);
    }
    $(document).on("mousewheel DOMMouseScroll scroll", function () {
        if ($(window).scrollTop() > 60) {
            $('.content-nav-box').addClass('fixed');
        }
        if ($(window).scrollTop() < 100) {
            $('.content-nav-box').removeClass('fixed');
        }
        var top=$(window).scrollTop();
        if (top > 800 && top < 1500) {
            act2();
        }
        //if (top > 1300 && top < 2100) {
        //    act3();
        //}
        if (top > 2100 && top < 2900) {
            act4();
        }
        if (top > 2900 && top < 3700) {
            act5();
        }
        if (top > 3700 && top < 4500) {
            act6();
        }
        if (top > 4500 && top < 5300) {
            act7();
        }
    });
});