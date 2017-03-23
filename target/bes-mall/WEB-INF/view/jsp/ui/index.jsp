<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>熊爸爸发热墙纸,一款可以取暖的纸-杭州白熊科技有限公司</title>
    <meta name="baidu-site-verification" content="BIU8rDkiQL" />
    <meta name="keywords" content="熊爸爸|供暖 |暖魔方|暖气|取暖器|电采暖|石墨烯|挂画式取暖器|挂画|浴室镜|发热墙纸|壁布"/>
	<meta name="description" content="熊爸爸暖魔方，将最新石墨烯核心材料与红外线发热技术应用于室内取暖，结合互联网+智能硬件，把高端理疗保健的“生命光波”应用于日常家庭取暖中，以高科技、高品质、智能化的产品和贴心极致的售后服务为用户缔造全新的生活空间，引领健康新生活。"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/css/index.css" rel="stylesheet" type="text/css">
    <link href="/css/index_new.css" rel="stylesheet" type="text/css">
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/shop/js/index.js" type="text/javascript" ></script>
    <link rel="icon" href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	mce_href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	type="image/x-icon">
    <jsp:include page="include/tongji.jsp"></jsp:include>
    <script>
	function browserRedirect() {
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
        	window.location.href="http://m.ibaixiong.com/index.html";
        }
    }
	$("#userInfo").show();
    browserRedirect();
     $.ajax({  
  	  type:"get",  
  	  dataType:"jsonp",
  	  jsonp: "jsonpCallback",
  	  url: "/u/user/info.html",  
  	  crossDomain:true,
  	  success: function(obj){  
         if ( obj.result.loginstatus == true ) {
			//获取登陆用户成功之后给值
			$("#userInfo").show();
			$("#loginInfo").hide();
			var nick=obj.result.name;
			if(nick==null)
				nick ="白熊";
			$("#userName").text(nick);
			var ssss = obj.result.ssssTag;
			if(ssss == 1){
				$("#ssssLi").show();
			}
			var merchantTag = obj.result.merchantTag;
			if(merchantTag == 1){
				$("#merchantLi").show();
			}
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
	</script>
</head>
<body>
	<header>
    <div class="navbox">
        <a href="http://www.ibaixiong.com"><img src="http://fe.ibaixiong.com/common/image/logo01.png" class="indexlogo"></a>
        <img src="http://fe.ibaixiong.com/common/image/logo02.png" class="indexlogo white-logo">
        <ul class="headnav">
			<li id="userInfo" style="display: none;"><a href="/u/order/list.html">个人中心<img src="http://fe.ibaixiong.com/shop/images/jiantou.png" style="margin-left:5px;"></a>
				<span class="sanjiao"></span>
				<div class="person">
					<p><a href="/u/order/list.html" id="userName" style="width:118px;text-overflow: ellipsis;white-space:nowrap;overflow:hidden;"></a></p>
					<p><a href="/u/order/list.html">我的订单</a></p>
					<p><a href="/u/address/list.html">收货地址</a></p>
					<p><a href="/u/user/updatepwd.html">密码管理</a></p>
					<p id="ssssLi" style="display: none;"><a href="http://4s.ibaixiong.com">4s店</a></p>
					<p id="merchantLi" style="display: none;"><a href="http://merchant.ibaixiong.com">代理商</a></p>
					<p style="border-bottom:none;"> <a href="/logout.html">退出</a>
					<!-- <a href="http://login.ibaixiong.com/logout?service=http://www.ibaixiong.com/index.html">退出</a>--></p>
				</div>
			</li>
            <li id="loginInfo">
            	<a href="http://login.ibaixiong.com/login?service=http://www.ibaixiong.com/sso" class="loginlink">登录/注册</a>
            </li>      
            <li><a href="/u/car/list.html">购物车</a> </li>
            <!-- <li><a href="http://bbs.ibaixiong.com/community.html">社区</a> </li>   -->         
            <li><a href="http://bbs.ibaixiong.com/insight.html">行业洞察</a> </li>
            <li><a href="http://bbs.ibaixiong.com/news.html">白熊资讯</a> </li>
            <li><a href="http://www.ibaixiong.com/attract.html">合作伙伴</a> </li>
            <li><a href="http://www.ibaixiong.com/wallpaper/overview.html#top">发热墙纸</a> </li>
            <li><a href="http://www.ibaixiong.com/thermostat/overview.html">温控器</a> </li>
            <li><a href="http://www.ibaixiong.com/walldraw/overview_new.html#top">壁画款</a> </li>
            <li><a href="http://www.ibaixiong.com/papa/overview.html#top">爬爬垫</a> </li>
            <li><a href="http://www.ibaixiong.com">首页</a> </li>
        </ul>
    </div>
</header>
	<div class="sliders">
    <div class="slider-wrap">
      <div class="slider slider1 curslider">
        	<!-- <p class="button-wrapper" style="margin-top:470px;font-size:16px;"><span class="bath-price" style="margin-left:575px;"><span style="color:#ff6200;">￥</span><span class="strong" style="color:#ff6200;">3699元</span>  起</span> </p> -->
            <div class="button-wrapper">
            	<p class="button-wrapper" style="margin-top:300px;font-size:16px;"><span class="paper-price" style="margin-left:566px;color:#fff;"><span class="strong">880</span>元/㎡</span> </p>
            	<div class="linkdiv buydiv" style="margin-left: 540px;"><a href="http://www.ibaixiong.com/wallpaper/overview.html#top" class="buynowpaper">了解详情</a></div>
                <!-- <div class="linkdiv seediv" style="margin-left: 0px;"> <a href="/bathroom/overview.html#top" target="_blank" class="seedetailsbath">了解详情</a><span class="seedetailsspanbath"></span></div> -->
        	</div>
        </div>
        <div class="slider slider2">
              <p class="button-wrapper" style="margin-top:450px;font-size:16px;"><span class="bath-price"><span style="color:#ff6200;">￥</span><span class="strong" style="color:#ff6200;">4000元</span>  起</span> </p>
            <div class="button-wrapper">
              <!--    <div class="linkdiv seediv-bath"> <a href="/product/52.html" class="seedetails-bath">立即购买</a><span class="seedetailsspan-bath"></span></div> -->
                 <div class="linkdiv buydiv-bath" style="margin-left:660px"><a href="javascript:" target="_blank" class="buynow-bed">了解详情</a><span class="buynowspan-bath"></span></div>
            </div>
        </div>
        <div class="slider slider3" onclick="document.location='http://www.ibaixiong.com/walldraw/overview_new.html'">
             <div class="button-wrapper" style="margin-top:180px;font-size:16px;">              
            	 <span class="wall-price" style="color:#f00;margin-left:450px;"><span class="strong" style="color:#f00;font-size:50px;">2500</span>  元起</span> 
                 <div class="linkdiv seediv-wall" style="display: block;margin: -10px auto 0 auto ;"> <a href="/walldraw/overview_new.html" class="seedetails-wall" style="color:#0581ff">了解详情></a><span class="seedetailsspan-wall" style="background:transparent;"></span></div>
            </div> 
        </div>
        <div class="slider slider4" onclick="document.location='http://www.ibaixiong.com/papa/overview.html'" >
            <div class="button-wrapper" style="margin-top:315px;font-size:16px;">              
            	 <span class="wall-price" style="margin-left:680px;margin-top:40px;color:#f00"><span class="strong" style="color:#f00;font-size:50px;">300</span>  元/片</span> 
                 <div class="linkdiv seediv-wall" style="margin-left: 680px;margin-top:10px;"> <a href="/papa/overview.html" class="seedetails-wall" style="color:#0581ff">了解详情</a><span class="seedetailsspan-wall" style="background:transparent;border:1px solid #0581ff;border-radius:5px"></span></div>
            </div>
        </div>
    </div>
    <ul class="bullet">
        <li class="icon-circle icon-circle-thin"></li>
        <li class="icon-circle"></li>
        <li class="icon-circle"></li>
        <li class="icon-circle"></li>
    </ul>
    <!--<div class="">-->
        <!--<a href="#" class="prev"><img src="images/prev.png"> </a>-->
        <!--<a href="#" class="next"><img src="images/next.png"> </a>-->
    <!--</div>-->
</div>
	<div class="index_content">
		<div class="content-box">
          <div class="row">
          	    <div class="col-lg-4 col-md-4 col-sm-4 index_text index_title1">
          	    	<a class="index_vertical1 index_font1" href="http://bbs.ibaixiong.com/news.html">白熊资讯<i class="index_icon1 index_vertical1"></i></a>
          	    </div>
          	    <div class="col-lg-4 col-md-4 col-sm-4 index_text index_title1">
          	    	<a class="index_vertical1 index_font1" href="http://bbs.ibaixiong.com/insight.html">行业洞察<i class="index_icon1 index_vertical1"></i></a>
          	    </div>
          	    <div class="col-lg-4 col-md-4 col-sm-4 index_text index_title1">
          	    	<a class="index_vertical1 index_font1" href="###">产品信息<i class="index_icon1 index_vertical1"></i></a>
          	    </div>
          </div>
          <div class="row index_margin1">
	          	<div class="col-lg-4 col-lg-4 col-md-4 col-sm-4 index_text ">
	          		<div class="index_img_box index_text1">
	                  <a href="http://bbs.ibaixiong.com/detail/503.html" target="_blank">
	                  	 <img src="http://baixiong-fe.oss-cn-hangzhou.aliyuncs.com/shop/images/ibx.jpg" class="index_img ">
	                  </a>
                    <span class="index_title2">熊爸爸荣获中国国际石墨烯创新大会金奖</span>
	                </div>
	          	</div>
	          	<div class="col-lg-4 col-lg-4 col-md-4 col-sm-4 index_text ">
	          		<div class="index_img_box index_text1">
	          		<a href="http://bbs.ibaixiong.com/detail/507.html" target="_blank">
	                	<img src="http://baixiong-fe.oss-cn-hangzhou.aliyuncs.com/shop/images/hydc.jpg" class="index_img">
	                </a>
                      <span class="index_title2">煤炭将被限，取暖进入电时代</span>
	                </div>
	          	</div>
	          	<div class="col-lg-4 col-lg-4 col-md-4 col-sm-4 index_text ">
	          		<div class="index_img_box index_text1">
	                  <img src="http://fe.ibaixiong.com/shop/images/20160608.png" class="index_img videoimg videoimg1">
                     <div class="popvideobox popvideobox1">
                        <div class="videobg"></div>
                         <div class="videobox videobox1">
                              <i class="closevideo"></i>
                              <object class="aa" type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTYwMDkwNzYxNg==/v.swf" width="100%" height="100%" id="youku-player0">
                                  <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
                                  <param name="play" value="true">
                                  <param name="movie"  value="http://player.youku.com/player.php/sid/XMTYwMDkwNzYxNg==/v.swf">
                                  <param name="flashvars"  value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
                              </object>
                              <object class="aa" style="display:none" type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTYxMDEzOTQ0MA==/v.swf" width="100%" height="100%" id="youku-player3">
                                  <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
                                  <param name="play" value="true">
                                  <param name="movie"   value="http://player.youku.com/player.php/sid/XMTYxMDEzOTQ0MA==/v.swf">
                                  <param name="flashvars"  value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
                              </object>
                              
                              <object class="aa" style="display:none" type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTYxMDEzNzU0MA==/v.swf" width="100%" height="100%" id="youku-player4">
                                  <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
                                  <param name="play" value="true">
                                  <param name="movie"   value="http://player.youku.com/player.php/sid/XMTYxMDEzNzU0MA==/v.swf">
                                  <param name="flashvars"  value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
                              </object>
                              
                              <object class="aa" style="display:none" type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTYxMDEzNDU2MA==/v.swf" width="100%" height="100%" id="youku-player5">
                                  <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
                                  <param name="play" value="true">
                                  <param name="movie"  value="http://player.youku.com/player.php/sid/XMTYxMDEzNDU2MA==/v.swf">
                                  <param name="flashvars"  value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
                              </object>
                              
                                <object class="aa" style="display:none" type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTY3ODg0MDc4MA==/v.swf" width="100%" height="100%" id="youku-player1">
                                  <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
                                  <param name="play" value="true">
                                  <param name="movie"  value="http://player.youku.com/player.php/sid/XMTY3ODg0MDc4MA==/v.swf">
                                  <param name="flashvars"  value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
                              </object>
                              
                              <object class="aa" style="display:none" type="application/x-shockwave-flash" data="http://player.youku.com/player.php/sid/XMTY4MzE5MTYxMg==/v.swf" width="100%" height="100%" id="youku-player2">
                                  <param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always">
                                  <param name="play" value="true">
                                  <param name="movie"   value="http://player.youku.com/player.php/sid/XMTY4MzE5MTYxMg==/v.swf">
                                  <param name="flashvars"  value="imglogo=&amp;paid=0&amp;partnerId=91a0d45b32079123&amp;styleid=0">
                              </object>
                          </div>
                      </div>
                      <span class="videoState"></span>
                      <span class="index_title2">熊爸爸智能发热墙布宣传片</span>
	                </div>
                 
	          	</div>
          </div>
          <div class="row index_margin1">
          	<div class="col-lg-4 col-lg-4 col-md-4 col-sm-4 index_text_left ">
              <ul class="index_new_content content_ns">
              	 <li></li> 
              </ul>
          	</div>
          	<div class="col-lg-4 col-lg-4 col-md-4 col-sm-4 index_text_left ">
          		<ul class="index_new_content insight_ns">
              </ul>
          	</div>
          	<div class="col-lg-4 col-lg-4 col-md-4 col-sm-4 index_text_left">
          		<ul class="index_new_content product_ns">
              	<li id="third"><a href="###"><span>熊爸爸系列产品体验片 </span><i class="index_time">7.15</i></a></li>
              	<li id="forth"><a href="###"><span>熊爸爸暖魔方产品宣传片</span><i class="index_time">7.01</i></a></li>
              	<li id="fifth"><a href="###"><span>熊爸爸智能发热墙布宣传片 </span><i class="index_time">6.25</i></a></li>
              	<li id="first"><a href="###"><span>石墨烯应用的未来</span><i class="index_time">8.10</i></a></li>
              	<li id="second"><a href="###"><span>6分钟了解辐射_高清</span><i class="index_time">8.02</i></a></li>
              </ul>
          	</div>
          </div>
        </div>
	</div>
	<footer class="bx-footer">
    <div class="footer-wrap">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2">
                <ul class="_text_list">
                    <li><p>关于熊爸爸</p></li>
                    <li><a target="_blank" href="/about.html">了解我们</a> </li>
                    <li><a target="_blank" href="/join.html">加入团队</a> </li>
                    <li><a target="_blank" href="/contact.html">联系我们</a> </li>
                    <li><a target="_blank" href="/attract.html">加盟我们</a> <img src="http://fe.ibaixiong.com/shop/images/hot.png" style="padding-bottom:5px;"></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2">
                <ul class="_text_list">
                    <li><p>熊爸爸渠道</p></li>
                    <li><a target="_blank" href="https://shop130325253.taobao.com/">熊爸爸淘宝店</a> </li>
                    <li><a target="_blank" href="https://nuanhuanrao.tmall.com/">熊爸爸天猫店</a> </li>
                    <!-- li><a href="javascript:;">白熊商城</a> </li> -->
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2">
                <ul class="_text_list">
                    <li><p>关注我们</p></li>
                    <li class="wx">
                      <div class="-box-width">
                        <a href="javascript:;">官方微信</a>
                        <img src="http://fe.ibaixiong.com/shop/images/erweima.png" class="erweima">
                      </div>
                     </li>
                    <li><a target="_blank" href="http://weibo.com/u/5721304254">新浪微博</a> </li>
                    <li class="wx">
                     <div class="-box-width">
                       <a href="javascript:;">客户端下载</a>
                       <img src="http://fe.ibaixiong.com/shop/images/client_download.png" class="erweima">
                     </div>
                     </li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2">
                <ul class="_text_list">
                    <li><p>共建家园</p></li>
                    <li><a href="javascript:;" class="feedback">问题反馈</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 tc">
                <div><i class="mobileicon"></i><span class="mobilenum">400-157-0088</span></div>
                <div style="text-indent: 34px;">周一到周五（9:00-18:00）</div>
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=2175775986&amp;site=qq&amp;menu=yes"><img border="0" src="http://fe.ibaixiong.com/shop/images/qqonline.png" alt="点击这里给我发消息" title="点击这里给我发消息" class="qqonline" style="margin-top:27px;padding-left:26px;"></a>
            </div>
        </div>
        <div class="row">
            <p class="footer-infor">© 2015 ibaixiong.com All rights reserved.    杭州白熊科技有限责任公司    备案号:浙ICP备15024007号-1. <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010402000428" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="http://fe.ibaixiong.com/common/image/ghs.png" style="float:left;">浙公网安备 33010402000428号</a></p>
        </div>
    </div>
</footer>
<!--问题反馈-->
	<div class="pop" style="display:none;">
	    <div class="popbg"></div>
	    <div class="layel">
	        <h3 class="poptitle">问题反馈<i class="closeicon"></i> </h3>
	        <div class="row">
	            <div class="remind">输入您的联系方式，我们会第一时间与您交流<i class="arrow"></i></div>
	        </div>
	        <div class="row">
	            <input type="text" class="yourname" id="callMe" placeholder="怎么称呼您？">
	        </div>
	        <div class="row">
	            <input type="text" class="yournum" id="tel" placeholder="请留下您的手机号码">
	        </div>
	        <div class="row" style="display: none;">
	            <input type="text" class="yzm-input" placeholder="验证码">
	            <img src="http://fe.ibaixiong.com/shop/images/loginbg.png" class="yzm-img">
	        </div>
	        <div class="row">
	            <textarea class="description" id="customersMemo" placeholder="如您有关于产品的任何问题，欢迎反馈我们，我们将在第一时间回复。"></textarea>
	        </div>
	        <div class="row">
	            <input type="button" class="sendinfor" value="发送">
	        </div>
	    </div>
	</div>
 <script type="text/javascript">
  var ajaxFn=function(type,id,fn){
	  $.ajax({  
	  	  type:type,  
	  	  jsonp: 'jsonpCallback',
	  	  dataType:"jsonp",
	  	  url: 'http://bbs.ibaixiong.com/article/api/'+id+'.html',  
	  	  //processData: false, 
	  	  success: function(data){
	  		  fn(data);
	  	  }  	
	});
  }
  //填充数据
  function fillData(data,_obj){
	  var _list='';
	  $.each(data.result,function(i,item){
		_list+='<li><a target="_blank" href="http://bbs.ibaixiong.com/detail/'+item.id+'.html"><span class="_news_in">'+item.title+'</span> <i class="index_time">'+DataTime(item.createDateTime)+'</i></a></li>';
	  });
	_obj.html(_list);
  }
  
  //白熊资讯
  ajaxFn('GET',30,function(data){
	  fillData(data,$(".content_ns"));
  });
  //行业洞察
  ajaxFn('GET',31,function(data){
		fillData(data,$(".insight_ns"));
  });

   function DataTime(milliseconds){
       var datetime = new Date();
       datetime.setTime(milliseconds);
       var year=datetime.getFullYear();
            //月份重0开始，所以要加1，当小于10月时，为了显示2位的月份，所以补0
       var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
       var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    /* var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
       var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
       var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds(); */
       return  month + "." + date;
   }
   $(document).on('click', '.product_ns>li', function() {
	    var $index=$(this).index();
	    console.log($index);
       $(".popvideobox").show().find('.videobox').animate({top:'50%'},500);
       $(".videobox>.aa").eq($index+1).show().siblings(".aa").hide();
	  });
   
/*问题反馈*/
$(".sendinfor").click(function(){
	var callMe=$("#callMe").val();
	var tel=$("#tel").val();
	var customersMemo=$("#customersMemo").val();
	if(!callMe){
		alertLayel('姓名不能为空!');
		return;
	}
    if (!tel.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)) {
    	alertLayel('手机号码格式不正确!')
        return false;
    }
	if(!tel){
		alertLayel('联系方式不能为空!');
		return;
	}
	if(!customersMemo){
		alertLayel('描述内容不能为空！');
		return;
	}
	$.ajax({
        url: "/u/user/question.html",
        type: 'post',
        data:{ "callMe": callMe,"tel":tel,"customersMemo":customersMemo },
        dataType: 'json',
        success: function (data) {
        	if(data.code==1){
        		$('.pop').hide();
        		$("#callMe").val("");
        		$("#tel").val("");
        		$("#customersMemo").val("");
        	}else{
        		alertLayel("对不起，提交失败，请稍后再试！");
        	}
        },
		error: function(XMLHttpRequest) {
			if(XMLHttpRequest.readyState==0&&XMLHttpRequest.responseText==""){
				alertLayel("请登录后重试");
        	}
		}
    });
});
  </script>   
</body>
</html>
