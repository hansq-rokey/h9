<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-密码管理</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/psd.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/base.js"></script>
	<script >
		function updatePwd(){
			var oldPwd = $("#oldPwd").val();
			var newPwd1 = $("#newPwd1").val();
			var newPwd2 = $("#newPwd2").val();
			if(oldPwd == null || oldPwd ==undefined || oldPwd == ''){
				alertLayel("原密码不可为空");
				return;
			}
			if(newPwd1 == null || newPwd1 ==undefined || newPwd1 == ''){
				alertLayel("新密码不可为空");
				return;
			}
			if(newPwd2 == null || newPwd2 ==undefined || newPwd2 == ''){
				alertLayel("确认密码不可为空");
				return;
			}
			if(newPwd1 != newPwd2){
				alertLayel("新密码,确认密码不一致");
				return;
			}
			updateForm.submit();
		}
		$(document).ready(function() {
			var flag = $("#flag").val();
			if(flag != null && flag != undefined && flag != ""){
				if(flag == 'error'){
					alertLayel("原密码输入不正确");
				}else if(flag == 'pwderror'){
					alertLayel("密码长度为6-16位");
				}
			}
		});
	</script>
</head>
<body>
<input type="hidden" value="${flag }" id="flag">
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content-left">
				<jsp:include page="../include/left.jsp"><jsp:param value="pwd" name="checkLefr" /></jsp:include>
			</div>
			<div class="content-right">
				<div class="right-title clearfix">
					<a href="/u/user/updatepwd.html" class="on">修改密码</a>
				</div>
				<form action="/u/user/update.html" method="post" id="updateForm">
					<div class="psd-container">
						<p><span>当前账号：</span><em>${user.userName }</em><b><span id="al" style="display: none;">密码与账户不匹配</span></b></p>
						<p><span>原密码：</span><input id="oldPwd" name="userPwd" type="password" ></p>
						<p><span>新密码：</span><input id="newPwd1" name="newPwd" type="password"></p>
						<p><span>确认密码：</span><input id="newPwd2" type="password"></p>
						<div class="sure-btn clearfix">
							<a href="#" class="right new-orange-btn" onclick="updatePwd()">确定</a>
						</div>
					</div>				
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>