<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
   	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/pay.css" rel="stylesheet" type="text/css">
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-migrate-1.2.1.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jPages.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/unslider.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/shop/js/prods.js" type="text/javascript" ></script>
    <title>白熊学院</title>
<style type="text/css">
.bigsize{
	font-size: 20px;
}
.cryimg{
	margin-top:60px;
	width:104px;
}
.wordbox{
	display:inline-block;
	vertical-align:middle;
	text-align: left;
	width:450px;
	margin-top:50px;
	margin-left:20px;
}
.wordbox a{
	color: #0099FF;
}
.losebgimg{
	margin-top: 85px;
	width:100%;
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
					<img src="http://fe.ibaixiong.com/shop/image/cry.png" class="cryimg">
    				<div class="wordbox">
    					<p class="bigsize">很抱歉，您查看的商品找不到了！</p>
    					<p>请检查您输入的网址，或去<a href="/" class="blueword">白熊首页</a> | <a href="/" class="blueword">在线商城</a> 逛逛。</p>
   					</div>
   					<img src="http://fe.ibaixiong.com/shop/image/losebg.png" class="losebgimg">
				</div>
				<jsp:include page="../include/footer.jsp"></jsp:include>
			</div>	
		</div>
	</div>
</body>
</html>