<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-账号绑定</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/account.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/base.js"></script>
	
	<script>
	$(document).ready(function(){
		//倒计时
		$('.yzm').click(function () {
			if(!ver()){
				return false;
			}
			var yzmText = $('.yzm').text();
			if(yzmText != "重新获取"){
				if(yzmText != "获取验证码"){
					alertLayel("请稍后重试");
					return false;
				}
			}
			var count = 20;
			var countdown = setInterval(CountDown, 1000);
			function CountDown() {
				$('.yzm').text(  count + " 秒");
				if (count == 0) {
					$('.yzm').text("重新获取");
					clearInterval(countdown);
				}
				count--;
			}
			sendVer();
		})
		//关闭弹窗
		$('.closeicon').on('click',function(){
			$(this).parent().parent().parent('.pop').hide();
		});
		$('.bind').on('click',function(){
			$('.pop').show();
		})
		//账号格式
		$(document).on('blur',".addmodulename",function(){
			ver();
		});
		//获取验证码
		$(".yzm").on('click',function(){
			var name=$('.addmodulename').val();
			//邮箱格式
			if(name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
				$('.yzmremind').show();
			}
		})
		//
		$('.addmodulename,.urlvalue').focus(function(){
			$('.prompt').hide();
		})
		$('.nextstep').on('click',function(){
			if(!ver()){
				return false;
			}
			var _data = null;
			var upType=$('#upType').val();
			var v = $('.addmodulename').val();
			var code = $('.urlvalue').val();
			if(upType == 1){
				_data = {
					"phone":v,
					"verCode":code
				}
			}
			if(upType == 2){
				_data = {
					"email":v,
					"verCode":code
				}
			}
			//点击了绑定
			$.ajax({
		 		   url: "/u/user/binder.html",
		 		   data: _data,//参数
		 		   type: "POST",
		 		   dataType:"json",
		 		   cache:false,
		 		   success: function(obj){
		 			  if ( !checkCode( obj ) ) {
		 				 alertLayel("验证码错误");
	 	 				return;
	 	 			  }else{
	 	 				$('#accountV').text(v);
	 	 				alertLayel("修改成功");
	 	 			  	$('.pop').hide();
	 	 			  }
		 		   }
		 	});
		})
	})
	function ver(){
		var name=$(".addmodulename").val();
		//看看操作种类
		var upType=$('#upType').val();
		if(upType == 1){
			//手机
			if(! name.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)){
				$('#accountError').text("格式错误请输入手机号");
				$('.nameremind').show();
				return false;
			}
		}
		if(upType == 2){
			//邮箱
			if(!name.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
				$('#accountError').text("格式错误请输入邮箱");
				$('.nameremind').show();
				return false;
			}
		}
		return true;
	}
	function sendVer(){
		//发送验证码到手机或邮箱
		var _data = null;
		var upType=$('#upType').val();
		var v = $('.addmodulename').val();
		if(upType == 1){
			_data = {
				"phone":v
				
			}
		}
		if(upType == 2){
			_data = {
				"email":v
			}
		}
		$.ajax({
 		   url: "/u/user/sendVer.html",
 		   data: _data,//参数
 		   type: "POST",
 		   dataType:"json",
 		   cache:false,
 		   success: function(obj){
 			  if ( !checkCode( obj ) ) {
 				 alertLayel("发送失败");
 				return;
 			  }else{
 				 alertLayel("发送成功");
 			  }
 		   }
	 	});
	}
</script>
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content-left">
				<jsp:include page="../include/left.jsp"><jsp:param value="account" name="checkLefr" /></jsp:include>
			</div>
			<div class="content-right">
				<div class="right-title clearfix">
					<a  href="/u/user/account.html" class="on">账号绑定</a>
					<a href="/u/user/updatepwd.html">修改密码</a>
				</div>
				<div class="account-container">
					<p><span>账号：</span><em>${user.userName }</em></p>
					<!-- 分两种走，如果账号跟手机一致说明是需要绑定的为邮箱，相反一样 -->
					<c:if test="${user.userName == user.email }">
						<c:if test="${empty user.phone}">
							<!-- 手机号为空 -->
							<p><span id="accountV"></span><a href="javascript:;" class="bind">绑定</a>手机，体验更方便的服务</p>
						</c:if>
						<c:if test="${not empty user.phone}">
							<!-- 手机号为空 -->
							<p class="mt30">手机：<span id="accountV">${user.phone }</span> <a href="javascript:;" class="bind">修改</a></p>
						</c:if>
						<input type="hidden" id="upType" value="1">
					</c:if>
					<c:if test="${user.userName == user.phone }">
						<c:if test="${empty user.email}">
							<!-- email为空 -->
							<p><span id="accountV"></span><a href="javascript:;" class="bind">绑定</a>邮箱，体验更方便的服务</p>
						</c:if>
						<c:if test="${not empty user.email}">
							<!-- email不为空 -->
							<p class="mt30">邮箱：<span id="accountV">${user.email }</span> <a href="javascript:;" class="bind">修改</a></p>
						</c:if>
						<input type="hidden" id="upType" value="2">
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="pop" style="display: none;">
		<div class="popbg"></div>
		<div class="layel bindlayel">
			<h3 class="poptitle">绑定账号<i class="closeicon"></i> </h3>
			<div class="row">
				<span class="addtypename">账号：</span>
				<input type="text" class="addmodulename" value="">
				<p class="prompt nameremind" style="text-align: left;text-indent: 167px;"><span id="accountError">账号格式错误</span></p>
			</div>
			<div class="row">
				<span class="addtypename">验证码：</span>
				<input type="text" class="urlvalue" value="">
				<span class="yzm">获取验证码</span>
				<p class="prompt yzmremind" style="text-align: left;text-indent: 167px;">如果未收到，请查看垃圾邮件</p>
			</div>
			<div class="row tc">
				<input type="button" value="确认绑定" class="nextstep">
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>