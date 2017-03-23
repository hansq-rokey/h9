/**
 * Created by Administrator on 2015/9/11.
 */
$(document).ready(function(){
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
    
    //切换板块
    //拖动
    var width=$('body').width();
    var _move=false;//移动标记
    var _x,_y;//鼠标离控件左上角的相对位置
    var leftNum=$('.secimg14').offset().left;
    $(".arrowImgBox").css({left:width/2-243});
    $(".arrowImgBox").click(function(){
        //alert("click");//点击（松开后触发）
    }).mousedown(function(e){
        _move=true;
        _x=e.pageX-parseInt($(".arrowImgBox").css("left"));
        _y=e.pageY-parseInt($(".arrowImgBox").css("top"));
        //$(".arrowImgBox").fadeTo(20, 0.5);//点击后开始拖动并透明显示
    });
    $(document).mousemove(function(e){
        if(_move){
            var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置
            var n=$('.arrowImgBox').offset().left;
            var min=width/2-244;
            var max=width/2+186;
            if(x>min&&x<max){
                $(".arrowImgBox").css({left:x});//控件新位置
                $('.fuzzybox ').css('width',430-(n-leftNum));
            }else if(x<min){
                _move=false;
                $(".arrowImgBox").css({left:min});
                $('.fuzzybox ').css('width','430px');
            }else if(x>max){
                _move=false;
                $(".arrowImgBox").css({left:max});
                $('.fuzzybox ').css('width','0px');
            }
        }
    }).mouseup(function(){
        _move=false;
        $(".arrowImgBox").fadeTo("fast", 1);//松开鼠标后停止移动并恢复成不透明
    });
    //省电
    $(".usertime").keyup(function(){
        var tmptxt=$(this).val();
        $(this).val(tmptxt.replace(/\D|^0/g,''));
    }).bind("paste",function(){
        var tmptxt=$(this).val();
        $(this).val(tmptxt.replace(/\D|^0/g,''));
    }).css("ime-mode", "disabled").bind('input propertychange', function() {
        var tmptxt=$(this).val();
        $('.colorLump1,.colorLump2,.colorLump3').css('width',0);
        if(tmptxt){
            setTimeout(function(){
                $('.colorLump1').animate({width:'900px'}).find('span').text("共耗"+(tmptxt*2).toFixed(2)+"°电");
                $('.colorLump2').animate({width:'830px'}).find('span').text("共耗"+(tmptxt*1.8).toFixed(2)+"°电");
                $('.colorLump3').animate({width:'365px'}).find('span').text("共耗"+(tmptxt*0.74).toFixed(2)+"°电");
            });
        }else{

            setTimeout(function(){
                $('.colorLump1').animate({width:'900px'}).find('span').text("2000W");
                $('.colorLump2').animate({width:'830px'}).find('span').text("1800W");
                $('.colorLump3').animate({width:'365px'}).find('span').text("740W");
            });
        }

    });
    //自动轮播
    var n;
    function slider(){
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
    var open=true;
    $('.prodbox').css('width',width);
    function delay(){

    }
    function act2(){
        setTimeout(function(){
            $('.colorLump1').animate({width:'890px'},1000);
            $('.colorLump2').animate({width:'830px'},1000);
            $('.colorLump3').animate({width:'365px'},1000);
        });
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
    var pass41=false;
    function act41() {
        $(".secimg43").animate({width: '100%'}, 3000);
        setTimeout(function () {
            $(".secimg43").animate({opacity: '0'}, 500, function () {
                $(".secimg43").css({width: '10px', opacity: '1'})
            })
        }, 5000);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number19").animate({opacity:'1'},100);
        },100);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number20").animate({opacity:'1'},100);
        },200);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number21").animate({opacity:'1'},100);
        },300);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number22").animate({opacity:'1'},100);
        },400);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number23").animate({opacity:'1'},100);
        },500);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number24").animate({opacity:'1'},100);
        },600);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number25").animate({opacity:'1'},100);
        },700);
        setTimeout(function(){
            $(".number").animate({opacity:'0'},100);
            $(".number26").animate({opacity:'1'},100);
        },800);
        setInterval(function () {
            $(".secimg43").animate({width: '100%'}, 3000);
            setTimeout(function () {
                $(".secimg43").animate({opacity: '0'}, 500, function () {
                    $(".secimg43").css({width: '10px', opacity: '1'})
                })
            }, 5000);
        },6000);
        pass41=true;
    }
    function act5(){
        setTimeout(function(){
            $(".secimg51").animate({marginLeft:'-465px'},1500);
            $(".secimg53").animate({marginLeft:'215px'},1500);
        });
    }

    $(document).on("mousewheel DOMMouseScroll scroll", function () {
        var top=$(window).scrollTop();
        console.log(top);
        if ($(window).scrollTop() > 60) {
            $('.content-nav-box').addClass('fixed');
        }
        if ($(window).scrollTop() < 100) {
            $('.content-nav-box').removeClass('fixed');
        }
        if(top>999&&top<1501){
            act2();
            $(".usertime").focus();
        }
        if (top > 3299&& top < 3900&&pass41==false) {
            act41();
        }
        if (top > 4299&& top < 4901) {
            act5();
        }
    });
});
function alertLayel(e){
	var html='<div class="alertpop" style="display: block;position: fixed;width: 100%;height:100%;top:0;left:0;z-index: 9999;"><div class="popbg" style="    width: 100%;height:100%;position: absolute;top:0;left:0;z-index: 989;background: #000;opacity: 0.5;"></div><div class="alertLayel" style="width:400px;height:200px;padding-top:10px;background:#fff;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;z-index:9999;"><h3 style="height:30px;position:relative;margin:0;"><i class="closeicon" style="margin-right:12px;margin-top:0;"></i> </h3><p class="alertContent" style="line-height:30px;font-size:14px;text-align:center;height:100px;">'+e+'</p><div class="row tc"><input type="button" value="确定" class="alertBtn" style="height:30px;border:none;width:80px;background:#ff6200;color:#fff;"></div></div></div>';
	$("body").append(html);
}