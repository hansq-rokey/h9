<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>付款页面</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/pay.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/area.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/location.js"></script>
<style type="text/css">
.orderinfo-main{
	text-align: center;
	font-size: 18px;
}
.cryimg{
	margin-bottom:30px;
	margin-top: 120px;
}
.submit-btn{
	background: #ff6200;
	border: none;
	color: #ffffff;
	width: 140px;
	height: 40px;
	margin-top: 10px;
	margin-bottom: 180px;
}
.copyright{
	color: #999;
	text-align: center;
	position: absolute;
	top:808px;
	left:0;
	width: 100%;
}
.orderinfo-main{
	text-align:center;
}
</style>
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp" />
			<div class="wrap">
				<div class="pay-head">
					<ul class="pay-nav clearfix">
						<li>
							<img src="http://fe.ibaixiong.com/shop/image/1.png" />
							<span>我的购物车</span>
						</li>
						<li class="on">
							<img src="http://fe.ibaixiong.com/shop/image/2.png" />
							<span>填写订单信息</span>
						</li>
						<li>
							<img src="http://fe.ibaixiong.com/shop/image/3.png" />
							<span>成功提交订单</span>
						</li>
					</ul>
				</div>
				<div class="orderinfo-main">
					<img src="http://fe.ibaixiong.com/shop/image/cry2.png" class="cryimg">
					<p>对不起，您的订单提交失败。</p>
					<a href="/"><input type="button" value="返回首页" class="submit-btn"/></a>
				</div>
				<jsp:include page="../include/footer.jsp"></jsp:include>
			</div>	
		</div>
	</div>
</body>
</html>