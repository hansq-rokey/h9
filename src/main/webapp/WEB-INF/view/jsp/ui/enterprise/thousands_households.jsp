<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/theme.css" rel="stylesheet" type="text/css">
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery.mousewheel.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery.rotate.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/shop/js/theme.js" type="text/javascript" ></script>
    <title>千家万户</title>
        <script>
$(document).ready(function() {
	
	$.ajax({  
  	  type:"get",  
  	  dataType:"jsonp",
  	  jsonp: "jsonpCallback",
  	  url: "/u/user/info.html",  
  	  crossDomain:true,
  	  success: function(obj){  
  		if ( obj.result.loginstatus == true ) {
			//获取登陆用户成功之后给值
			$("#infoLi").show();
			$("#logoutLi").show();
			$("#loginLi").hide();
			$("#regLi").hide();
			var nick=obj.result.name;
			if(nick==null)
				nick ="白熊";
			$("#userInfo").text(nick);
		}
  	  },  
  	  beforeSend:function(){
  		  
  	  },  
  	  complete:function(data,status){
  		  //alert( JSON.stringify(data));
  	  },
	      error: function(jqXHR, textStatus, errorThrown) {
	    	  
	      }
  	}); 
	});
</script>
</head>
<body>
<header>
    <div class="navbox">
        <ul class="headnav">
            <li><a href="http://www.ibaixiong.com">首页</a> </li>
            <li><a href="http://bbs.ibaixiong.com">社区</a> </li>
            <li><a href="http://www.ibaixiong.com"><img src="http://fe.ibaixiong.com/common/image/logo02.png"  class="themelogo"></a> </li>
            <li id="loginLi"><a href="http://login.ibaixiong.com/?service=http://www.ibaixiong.com" class="loginlink">登录</a></li>
			<li id="regLi"><a href="http://user.ibaixiong.com/register.html" class="registerlink">注册</a></li>
			<li id="infoLi" style="display: none;"><a href="/u/order/list.html" id="userInfo"></a></li>
			<li id="logoutLi" style="display: none;"><a href="/logout.html">退出</a></li>
        </ul>
    </div>
</header>
<div class="content">
    <div class="content-box">
        <div class="content-left">
            <span class="head-office">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="head-office-sun">
            </span>
            <div class="pointbox point1">
                <img src="http://fe.ibaixiong.com/shop/images/point.png" class="point">
            </div>
            <span class="animate-img animate1">
                <img src="http://fe.ibaixiong.com/shop/images/bluebg.png" class="bluebg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-bg.png" class="yellowbg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="show-sun">
                <img src="http://fe.ibaixiong.com/shop/images/ice.png" class="show-ice">
            </span>
            <span class="animate-img animate2">
                <img src="http://fe.ibaixiong.com/shop/images/bluebg.png" class="bluebg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-bg.png" class="yellowbg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="show-sun">
                <img src="http://fe.ibaixiong.com/shop/images/ice.png" class="show-ice">
            </span>
            <span class="animate-img animate3">
                <img src="http://fe.ibaixiong.com/shop/images/bluebg.png" class="bluebg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-bg.png" class="yellowbg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="show-sun">
                <img src="http://fe.ibaixiong.com/shop/images/ice.png" class="show-ice">
            </span>
            <span class="animate-img animate4">
                <img src="http://fe.ibaixiong.com/shop/images/bluebg.png" class="bluebg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-bg.png" class="yellowbg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="show-sun">
                <img src="http://fe.ibaixiong.com/shop/images/ice.png" class="show-ice">
            </span>
            <span class="animate-img animate5">
                <img src="http://fe.ibaixiong.com/shop/images/bluebg.png" class="bluebg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-bg.png" class="yellowbg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="show-sun">
                <img src="http://fe.ibaixiong.com/shop/images/ice.png" class="show-ice">
            </span>
            <span class="animate-img animate6">
                <img src="http://fe.ibaixiong.com/shop/images/bluebg.png" class="bluebg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-bg.png" class="yellowbg">
                <img src="http://fe.ibaixiong.com/shop/images/head-office-sun.png" class="show-sun">
                <img src="http://fe.ibaixiong.com/shop/images/ice.png" class="show-ice">
            </span>
        </div>
        <div class="content-right">
            <ul class="right-list">
                <li class="item01 on" style="margin-left:-20px;">
                    <img src="http://fe.ibaixiong.com/shop/images/userimg01.png" style="opacity: 1">
                    <p class="text" style="opacity: 1">昨天上午下单，今天午后到家，仅用一天...</p>
                </li>
                <li class="item02">
                    <img src="http://fe.ibaixiong.com/shop/images/userimg02.png">
                    <p class="text">冷了，宝宝洗澡冷，租的房子又没有...</p>
                </li>
                <li class="item03">
                    <img src="http://fe.ibaixiong.com/shop/images/userimg03.png">
                    <p class="text">上天气凉了，在暖气到来之前，这款...</p>
                </li>
                <li class="item04">
                    <img src="http://fe.ibaixiong.com/shop/images/userimg04.png">
                    <p class="text">质量非常好，与网站上描的完全一致...</p>
                </li>
                <li class="item05">
                    <img src="http://fe.ibaixiong.com/shop/images/userimg05.png">
                    <p class="text">包装真的很好，物流很快速，很放心，超...</p>
                </li>
                <li class="item06">
                    <img src="http://fe.ibaixiong.com/shop/images/userimg06.png">
                    <p class="text">一打开就惊呆了，这么薄的电暖片第一...</p>
                </li>
            </ul>
        </div>
        <ul class="left-list open">
            <li>
                <div class="left-item open01"></div>
                <div class="right-item">
                    <div class="">
                        <img src="http://fe.ibaixiong.com/shop/images/userimg01.png" class="userimg">
                        <span class="username">张先生</span>
                    </div>
                    <div class="">
                        <p>昨天上午下单，今天午后到家，仅用一天的时间，快递速度非常之快。两层包装纸箱，里面垫了泡沫。产品美观，工艺精湛，简洁大方，细节处理的非常好，不愧是大品牌</p>
                    </div>
                    <div class="small-map-box">
                        <span class="sun-box">
                            <img src="http://fe.ibaixiong.com/shop/images/sun.png" class="sun-img">
                            <img src="http://fe.ibaixiong.com/shop/images/light.png" class="light-img">
                        </span>
                    </div>
                </div>
            </li>
            <li>
                <div class="left-item open02"></div>
                <div class="right-item">
                    <div class="">
                        <img src="http://fe.ibaixiong.com/shop/images/userimg02.png" class="userimg">
                        <span class="username">纪先生</span>
                    </div>
                    <div class="">
                        <p>冷了，宝宝洗澡冷，租的房子又没有浴霸，想买个油汀，正好看到熊爸爸电暖片，好便宜。做工大气，发货快，试了下发热也很快，有这个就不怕我家小胖子洗澡感冒了。</p>
                    </div>
                    <div class="small-map-box">
                        <span class="sun-box">
                            <img src="http://fe.ibaixiong.com/shop/images/sun.png" class="sun-img">
                            <img src="http://fe.ibaixiong.com/shop/images/light.png" class="light-img">
                        </span>
                    </div>
                </div>
            </li>
            <li>
                <div class="left-item  open03"></div>
                <div class="right-item">
                    <div class="">
                        <img src="http://fe.ibaixiong.com/shop/images/userimg03.png" class="userimg">
                        <span class="username">李小姐</span>
                    </div>
                    <div class="">
                        <p>上天气凉了，在暖气到来之前，这款电暖实在好用，手机控制，物流超快，很重的东西也给你抬上楼送到家，物品包装严整，造型美观大方，显高当，通电后启动快速，迅速升温。</p>
                    </div>
                    <div class="small-map-box">
                        <span class="sun-box">
                            <img src="http://fe.ibaixiong.com/shop/images/sun.png" class="sun-img">
                            <img src="http://fe.ibaixiong.com/shop/images/light.png" class="light-img">
                        </span>
                    </div>
                </div>
            </li>
            <li>
                <div class="left-item  open04"></div>
                <div class="right-item">
                    <div class="">
                        <img src="http://fe.ibaixiong.com/shop/images/userimg04.png" class="userimg">
                        <span class="username">陆先生</span>
                    </div>
                    <div class="">
                        <p>质量非常好，与网站上描述的完全一致，非常满意,真的很喜欢，完全超出期望值，发货速度非常快，包装非常仔细、严实，物流公司服务态度很好，运送速度很快，相信熊爸爸，超值。</p>
                    </div>
                    <div class="small-map-box">
                        <span class="sun-box">
                            <img src="http://fe.ibaixiong.com/shop/images/sun.png" class="sun-img">
                            <img src="http://fe.ibaixiong.com/shop/images/light.png" class="light-img">
                        </span>
                    </div>
                </div>
            </li>
            <li>
                <div class="left-item  open05"></div>
                <div class="right-item">
                    <div class="">
                        <img src="http://fe.ibaixiong.com/shop/images/userimg05.png" class="userimg">
                        <span class="username">王小姐</span>
                    </div>
                    <div class="">
                        <p>包装真的很好，物流很快速，很放心，超薄，和以前的电暖片完全不一样，很喜欢，功能齐全，配件多，起热快，供热均匀，很不错，买的很超值。</p>
                    </div>
                    <div class="small-map-box">
                        <span class="sun-box">
                            <img src="http://fe.ibaixiong.com/shop/images/sun.png" class="sun-img">
                            <img src="http://fe.ibaixiong.com/shop/images/light.png" class="light-img">
                        </span>
                    </div>
                </div>
            </li>
            <li>
                <div class="left-item  open06"></div>
                <div class="right-item">
                    <div class="">
                        <img src="http://fe.ibaixiong.com/shop/images/userimg06.png" class="userimg">
                        <span class="username">朱小姐</span>
                    </div>
                    <div class="">
                        <p>一打开就惊呆了，这么薄的电暖片第一次看到，功率小，还能手机控制，挂在家里感觉像是一个艺术品，因为一个电暖片而喜欢上冬天的感觉，很棒，支持熊爸爸产品。</p>
                    </div>
                    <div class="small-map-box">
                        <span class="sun-box">
                            <img src="http://fe.ibaixiong.com/shop/images/sun.png" class="sun-img">
                            <img src="http://fe.ibaixiong.com/shop/images/light.png" class="light-img">
                        </span>
                    </div>
                </div>
            </li>
            <i class="close-icon"></i>
        </ul>
    </div>
    <div class="content-bottom">
        <div class="pic-box">
            <img src="http://fe.ibaixiong.com/shop/images/china.png">
            <div class="user-list">
                <img src="http://fe.ibaixiong.com/shop/images/china-user.png">
                <p><span class="red">23,502</span>个中国家庭与您共同见证健康取暖！ </p>
            </div>
        </div>
        <div class="pic-box">
            <img src="http://fe.ibaixiong.com/shop/images/germany.png">
            <div class="user-list">
                <img src="http://fe.ibaixiong.com/shop/images/germany-user.png">
                <p><span class="red">85,366</span>个德国家庭与您共同见证健康取暖！ </p>
            </div>
        </div>
        <div class="pic-box">
            <img src="http://fe.ibaixiong.com/shop/images/usa.png">
            <div class="user-list">
                <img src="http://fe.ibaixiong.com/shop/images/usa-user.png">
                <p><span class="red">210,947</span>个美国家庭与您共同见证健康取暖！ </p>
            </div>
        </div>
    </div>
    <footer>
        <p>©2015 Hangzhou Baixiong Technology Co.Ltd。ALLrights reserver. 备案号：浙ICP备15024007号-1. <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010402000428" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="http://fe.ibaixiong.com/common/image/ghs.png" style="float:left;"/>浙公网安备 33010402000428号</a></p>
    </footer>
</div>
<!--<footer class="bx-footer">-->
    <!--<div class="footer-wrap">-->
        <!--<div class="row">-->
            <!--<div class="col-lg-2">-->
                <!--<ul>-->
                    <!--<li><p>关于白熊</p></li>-->
                    <!--<li><a href="#">了解我们</a> </li>-->
                    <!--<li><a href="#">加入我们</a> </li>-->
                    <!--<li><a href="#">联系我们</a> </li>-->
                <!--</ul>-->
            <!--</div>-->
            <!--<div class="col-lg-2">-->
                <!--<ul>-->
                    <!--<li><p>白熊渠道</p></li>-->
                    <!--<li><a href="#">白熊天猫店</a> </li>-->
                    <!--<li><a href="#">京东众筹</a> </li>-->
                    <!--<li><a href="#">白熊商城</a> </li>-->
                <!--</ul>-->
            <!--</div>-->
            <!--<div class="col-lg-2">-->
                <!--<ul>-->
                    <!--<li><p>关注我们</p></li>-->
                    <!--<li class="wx"><a href="#">官方微信</a><img src="http://fe.ibaixiong.com/shop/images/erweima.png" class="erweima"> </li>-->
                    <!--<li><a href="#">新浪微博</a> </li>-->
                <!--</ul>-->
            <!--</div>-->
            <!--<div class="col-lg-2">-->
                <!--<ul>-->
                    <!--<li><p>共建家园</p></li>-->
                    <!--<li><a href="#" class="feedback">问题反馈</a> </li>-->
                <!--</ul>-->
            <!--</div>-->
            <!--<div class="col-lg-4 tc">-->
                <!--<div><i class="mobileicon"></i><span class="mobilenum">400-6823-3521</span></div>-->
                <!--<div style="text-indent: 34px;">周一到周五（9:00-18:00）</div>-->
            <!--</div>-->
        <!--</div>-->
        <!--<div class="row">-->
            <!--<p class="footer-infor">© 2015 ibaixiong.com All rights reserved.    杭州白熊科技有限责任公司    浙ICP备15024007号-1</p>-->
        <!--</div>-->
    <!--</div>-->
<!--</footer>-->
</body>
</html>
