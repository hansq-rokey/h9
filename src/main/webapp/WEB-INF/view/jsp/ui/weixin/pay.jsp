<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
 <head>
  <title>微信支付</title>
  <meta name="keywords" content="白熊微信支付">
  <meta name="description" content="白熊微信扫码支付">
  <meta name="content-type" content="text/html;charset=gbk">
  <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
  <link href="http://fe.ibaixiong.com/shop/css/wx-pay.css" rel="stylesheet" type="text/css">
  <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
  <script src="http://fe.ibaixiong.com/shop/js/qrcode.js"></script>
  <script src="http://fe.ibaixiong.com/shop/js/base.js"></script>
  <script>
    $(document).ready(function(){
        $('.order-infor').mouseover(function(){
            $('.pay-infor-box').show().mouseout(function(){
                $('.pay-infor-box').hide();
            })
        })
    })
</script>
 </head>
 <body onload="queryStatus()">
	<div class="container clearfix">
	    <div class="content">
	        <jsp:include page="../include/top.jsp"></jsp:include>
	        <div class="wrap">
	            <div class="pay-head">
	                <p>
	                    <img src="http://fe.ibaixiong.com/shop/image/wx-logo.png" class="wx-logo">
	                    <span class="strong">微信支付</span>应付金额：<span class="money"><fmt:formatNumber value="${ discountPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span>元
	                    <span class="fr" style="margin-right:20px;"><a href="#" class="order-infor"> 订单详情</a></span>
	                </p>
	            </div>
	            <div class="pay-main">
	                <div class="erweima-box left">
                        <img src="http://fe.ibaixiong.com/shop/image/logo-bg.png" style="margin-top:10px" class="logo-bg">
                        <div align="center" id="qrcode">
						</div>
	                </div>
	                <div class="pay-info right">
	                    <div class="pay-infor-box">
	                        <p class="ordernum">订单号：${ orderNumber }</p>
	                        <div class="line"></div>
	                        <c:forEach items="${orderItems }" var="item" varStatus="statusItem">
	                        <p class="clearfix">${statusItem.count }.${item.productTitle }<em style="padding-left:10px;"></em></p>
	                        <p class="clearfix"><em class='fr' style="padding-left:10px;">X${item.num }</em><span class='fr money prices'> <fmt:formatNumber value="${item.discountUnitPrice}" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
	                        </c:forEach>
	                        <div class="line"></div>
	                        <p style="text-align:right;">合计：<span class='money'><fmt:formatNumber value="${ discountPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
	                        <p class="ordernum">收货信息</p>
	                        <div class="line"></div>
	                        <p class="adress">${receiver.provinceName }${receiver.cityName }${receiver.districtName }${receiver.detailAddress }${receiver.zipcode }(${receiver.reveiveUserName }收)    </p>
	                        <p class="tele">${receiver.mobilePhone }</p>
	                        <p class="tcenter">请在<span class="money">12</span>小时内完成支付，否则订单会被自动取消。</p>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	</div>
	<input type="hidden" id="payUrl" value="${ payUrl }">
	<input type="hidden" id="orderNumber" value="${ orderNumber }">
	<jsp:include page="../include/footer.jsp"></jsp:include>
 </body>
 <script>
 	//生成的code_url,这个很关键
	//var url = "weixin://wxpay/bizpayurl?pr=IrbYjQm";
	var url = $("#payUrl").val();
	//参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
	var qr = qrcode(10, 'M');
	qr.addData(url);
	qr.make();
	var dom=document.createElement('DIV');
	dom.innerHTML = qr.createImgTag();
	var element=document.getElementById("qrcode");
	element.appendChild(dom);
	//设置二维码大小显示
	$("#qrcode img").css("width","280px");
	$("#qrcode img").css("height","280px");
	
	var timer;//声明一个定时器
	var count=0;
	var orderNumber = $("#orderNumber").val();
	function queryStatus(){
		//每隔5秒执行一次check()方法
		timer = window.setInterval("check()",5000);
	}
	function check(){
		$.ajax({
	 		   url: "/u/weixin/checkOrderPay.html?orderNumber="+orderNumber,
	 		   type: "POST",
	 		   dataType:"json",
	 		   cache:false,
	 		   success: function(obj){
	 			  if ( !checkCode( obj ) ) {
	 				window.clearInterval(timer);
 					 //跳页面
	 				var baseUrl = "http://www.ibaixiong.com";
	 				window.location.href= baseUrl+"/u/weixin/payEnd.html?payType=2&orderNumber="+orderNumber;
	 			  }
	 		   }
	 	});
		++count;
		//12次为一分钟*60就是一个小时*2就是两个小时（这也是二维码显示的最大有效连接值）1440
		if (count == 1440){
			//如果count值达到5，清空定时器
			window.clearInterval(timer);
		}
	} 
 </script>
</html>
