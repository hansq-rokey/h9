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
    function act2(){
        $(".secimg21").animate({marginRight:'197px'},800);
        setTimeout(function() {
            $('.secimg22').css('opacity', '1');
        },600);
        setTimeout(function(){
            setInterval(function(){
                $(".secimg22").find('.img1').animate({opacity:'0',width:'100%',height:'100%'},5000,function(){
                    $(".secimg22").find('img').css({width:'10px',height:'10px',opacity:'1'})
                })
            },100)
        });
        setTimeout(function(){
            setInterval(function(){
                $(".secimg22").find('.img2').animate({opacity:'0',width:'100%',height:'100%'},5000,function(){
                    $(".secimg22").find('img').css({width:'10px',height:'10px',opacity:'1'})
                })
            },1100)
        });
        setTimeout(function(){
            setInterval(function(){
                $(".secimg22").find('.img3').animate({opacity:'0',width:'100%',height:'100%'},5000,function(){
                    $(".secimg22").find('img').css({width:'10px',height:'10px',opacity:'1'})
                })
            },2100)
        });
        setTimeout(function(){
            setInterval(function(){
                $(".secimg22").find('.img4').animate({opacity:'0',width:'100%',height:'100%'},5000,function(){
                    $(".secimg22").find('img').css({width:'10px',height:'10px',opacity:'1'})
                })
            },3100)
        });
        setTimeout(function(){
            setInterval(function(){
                $(".secimg22").find('.img5').animate({opacity:'0',width:'100%',height:'100%'},5000,function(){
                    $(".secimg22").find('img').css({width:'10px',height:'10px',opacity:'1'})
                })
            },4100)
        });
    }
    function act3(){
        setTimeout(function(){
            $(".secimg").animate({opacity:'1',marginLeft:'256px'},1000,'easeOutSine')
        },500)
    }
    function act4(){
        setTimeout(function(){
            $(".secimg41").animate({opacity:'0.6',top:'166px'},1000,'easeOutSine')
        },500);
        setTimeout(function(){
            $(".secimg42").animate({opacity:'1',top:'355px'},800,'easeOutSine')
        },600);
    }
    function act5(){
        setTimeout(function(){
            $(".secimg51").animate({top:'174px'},800,'easeOutSine');
        },600);
        setTimeout(function(){
            $(".secimg52").animate({top:'220px'},1000,'easeOutSine')
        },1400);
    }
    function act6(){
        setTimeout(function(){
            $(".secimg61").animate({opacity:'1'},600,'easeOutSine')
        },1100);
        setTimeout(function(){
            $(".secimg62").animate({opacity:'1'},900,'easeOutSine')
        },800);
        setTimeout(function(){
            $(".secimg63").animate({opacity:'1'},1200,'easeOutSine')
        },500);
    }
    function act7(){
        setTimeout(function(){
            $(".secimg71").animate({top:'195px'},1000,'easeOutSine')
        },500);
        setTimeout(function(){
            $(".secimg72").animate({top:'280px'},800,'easeOutSine')
        },1000);
    }
    $(document).on("mousewheel DOMMouseScroll scroll", function () {
        if ($(window).scrollTop() > 60) {
            $('.content-nav-box').addClass('fixed');
        }
        if ($(window).scrollTop() < 100) {
            $('.content-nav-box').removeClass('fixed');
        }
        var top=$(window).scrollTop();
        if (top > 500 && top < 1300) {
            act2();
        }
        if (top > 1300 && top < 2100) {
            act3();
        }
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