<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link rel="icon" href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	mce_href="http://fe.ibaixiong.com/shop/image/xLogin.ico" type="image/x-icon">
<div class="head clearfix">
	<div class="logo"><a href="http://www.ibaixiong.com"><img src="http://fe.ibaixiong.com/common/image/logo02.png" class="indexlogo" /></a></div>
	
	<ul class="login clearfix">
		<li id="loginLi"><a href="http://login.ibaixiong.com/?service=http://www.ibaixiong.com">登录/注册</a></li>
		<li id="infoLi" style="display: none;"><a href="/u/order/list.html" id="userInfo">个人中心<img src="http://fe.ibaixiong.com/shop/images/jiantou.png" style="margin-left:5px;"></a>
				<span class="sanjiao"></span>
				<div class="person">
					<p><a href="/u/order/list.html" id="userName" style="width:118px;text-overflow: ellipsis;white-space:nowrap;overflow:hidden;display:inline-block"></a></p>
					<p><a href="/u/order/list.html">我的订单</a></p>
					<p><a href="/u/address/list.html">收货地址</a></p>
					<p><a href="/u/user/updatepwd.html">密码管理</a></p>
					<p id="ssssLi" style="display: none;"><a href="http://4s.ibaixiong.com">4s店</a></p>
					<p id="merchantLi" style="display: none;"><a href="http://merchant.ibaixiong.com">代理商</a></p>
					<p style="border-bottom:none;"><a href="/logout.html">退出</a></p>
				</div>
		</li>
	</ul>
	<ul class="menus clearfix">
		<li><a href="http://www.ibaixiong.com">首页</a></li>
		<li><a href="http://www.ibaixiong.com/attract.html">合作伙伴</a> </li>
		<li><a href="http://bbs.ibaixiong.com/news.html">白熊资讯</a> </li>
		<li><a href="http://bbs.ibaixiong.com/insight.html">行业洞察</a> </li>
        <!--  <li><a href="/wallpaper/overview.html#top">发热墙纸</a> </li> -->
		<!-- <li><a href="/bathroom/overview.html#top">暖魔方·浴室款</a> </li> -->
        <!-- <li><a href="/bedroom/overview.html#top">暖魔方·壁挂款</a> </li> -->
		<!-- <li><a href="http://bbs.ibaixiong.com">社区</a></li> -->
		<li><a href="/u/car/list.html">购物车</a></li> 
	</ul>
</div>
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
				$("#userName").text(nick);
				//4s店，代理商链接显示
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
});
</script>