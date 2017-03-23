/**
 * Created by Administrator on 2015/12/3.
 */
$(document).ready(function(){
    var width=$(window).width();
    var height=$(window).height();
    $('.page').css('height',height);
    //���ֹ���
    var options = {
        useEasing : true,
        useGrouping : true,
        separator : ',',
        decimal : '.',
        prefix : '',
        suffix : ''
    };
    var number1 = new CountUp("number1", 0, 268, 0, 2.5, options);
    var number2 = new CountUp("number2", 0, 3562, 0, 2.5, options);
    var number3 = new CountUp("number3", 0, 35, 0, 2.5, options);
    var number4 = new CountUp("number4", 0, 4, 0, 2.5, options);
    var number5 = new CountUp("number5", 0, 8, 0, 2.5, options);
    var number52 = new CountUp("number52", 0, 15, 0, 2.5, options);
    var number6 = new CountUp("number6", 0, 10, 0, 2.5, options);
    var number7 = new CountUp("number7", 0, 365, 0, 2.5, options);
    var number8 = new CountUp("number8", 0, 5, 0, 2.5, options);
    //����
    var nowpage=0;
    var pass1=false;
    var pass2=false;
    $(document).on("mousewheel", function (event, delta) {
        if(!$('.container').is(":animated")){
            if (delta < 0) {  //���¹�
                nowpage = nowpage + 1;
                if(nowpage==1&&pass1==false){
                    pass1=true;
                    setTimeout(function(){
                        $('.image01').animate({top:'80px'},800)
                    },800);
                    setTimeout(function(){
                        $('.image01').animate({top:'0px'},400)
                    },1600);
                    setTimeout(function(){
                        $('.image01').animate({marginLeft:'-210px'},400)
                    },2000);
                    setTimeout(function(){
                        $('.matter1').animate({marginRight:'-236px',opacity:1},500)
                    },2600);
                    setTimeout(function () {
                        $('.article1').animate({opacity: 1}, 1000)
                    }, 3100);
                }
                if(nowpage==2&&pass2==false){
                    pass2=true;
                    setTimeout(function(){
                    number1.start();
                    number2.start();
                    number3.start();
                    number4.start();
                    number5.start();
                    number52.start();
                    number6.start();
                    number7.start();
                    number8.start();
                    },800);
                }
            }else if(delta>0){   //���Ϲ�
                nowpage = nowpage - 1;
            }
            if(nowpage<0){
                nowpage=0;
            }
            if(nowpage>4){
                nowpage=4;
            }
            $('.container').animate({top:-nowpage*height},1000);
            $(".icon-circle").eq(nowpage).addClass("on").siblings().removeClass("on");
        }
    });
    //����ұ�Բ��
    $(".icon-circle").on('click',function(){
        var index=$(this).index();
        if(!$('.container').is(":animated")) {
            nowpage = index;
            if (nowpage == 1 && pass1 == false) {
                pass1 = true;
                setTimeout(function () {
                    $('.image01').animate({top: '80px'}, 800)
                }, 800);
                setTimeout(function () {
                    $('.image01').animate({top: '0px'}, 400)
                }, 1600);
                setTimeout(function () {
                    $('.image01').animate({marginLeft: '-210px'}, 400)
                }, 2000);
                setTimeout(function () {
                    $('.matter1').animate({marginRight: '-236px', opacity: 1}, 500)
                }, 2600);
                setTimeout(function () {
                    $('.article1').animate({marginTop: '0', opacity: 1},1000)
                }, 3100);
            }
            if (nowpage == 2 && pass2 == false) {
                pass2 = true;
                setTimeout(function () {
                    number1.start();
                    number2.start();
                    number3.start();
                    number4.start();
                    number5.start();
                    number52.start();
                    number6.start();
                    number7.start();
                    number8.start();
                }, 800);
            }
            $('.container').animate({top: -nowpage * height}, 1000);
            $(".icon-circle").eq(nowpage).addClass("on").siblings().removeClass("on");
        }
    })
});