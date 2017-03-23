/**
 * Created by Administrator on 2015/9/14.
 */
$(document).ready(function(){
    $('.loginbtn').on('click',function(){
        cart();
    })
    function cart(){
        $('.baixiong').animate({marginLeft:'-75px;'},50);
        setTimeout(function(){
            $(".baixiong") .animate({marginLeft:'-57px'},50)
        },50);
        setTimeout(function(){
            $(".baixiong") .animate({marginLeft:'-72px'},50)
        },100);
        setTimeout(function(){
            $(".baixiong") .animate({marginLeft:'-60px'},50)
        },150);
        setTimeout(function(){
            $(".baixiong") .animate({marginLeft:'-69px'},50)
        },200);
        setTimeout(function(){
            $(".baixiong") .animate({marginLeft:'-63px'},50)
        },250);
        setTimeout(function(){
            $(".baixiong") .animate({marginLeft:'-65px'},50)
        },300);
    }
    //显示验证码
    function code(){
        $('.content-box').css('height','470px');
        $('.coderow,.changecode').show()
    }
    //倒计时
    $(document).on('click','.effective',function () {
        var count = 90;
        var countdown = setInterval(CountDown, 1000);
        function CountDown() {
            $('.effective').text(  count + " 秒");
            if (count == 0) {
                $('.effective').text("重新获取");
                clearInterval(countdown);
            }
            count--;
        }
    })
    //账号格式
    $(document).on('blur',"#username",function(){
        var name=$(this).val();
        if(name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)&&!name.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)){
            $('.code-span').addClass('effective');
            return false;
        }
        if(!name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)&&!name.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)){
            $('.format').show();
            return false;
        }
    });
    //获取验证码
    //$(".yzm").on('click',function(){
    //    var name=$('.addmodulename').val();
    //    if(name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
    //        $('.yzmremind').show();
    //    }
    //})
    //获取焦点隐藏错误提示
    $(".username,.userpassword,.code,.userpassword").focus(function(){
        $(".remind").hide();
    });
})