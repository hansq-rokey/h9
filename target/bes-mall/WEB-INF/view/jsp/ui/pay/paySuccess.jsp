<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
 <head>
  <title>支付</title>
  <meta name="keywords" content="白熊支付">
  <meta name="description" content="白熊扫码支付">
  <meta name="content-type" content="text/html;charset=gbk">
  <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
  <link href="http://fe.ibaixiong.com/shop/css/wx-pay.css" rel="stylesheet" type="text/css">
  <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
 </head>

 <body>
	<div class="container clearfix">
    <div class="content">
        <jsp:include page="../include/top.jsp"></jsp:include>
        <c:if test="${payType == '2' }">
        <div class="wrap">
            <div class="pay-head">
                <p>
                    <img src="http://fe.ibaixiong.com/shop/image/wx-logo.png" class="wx-logo">
                    <span class="strong">微信支付</span>
                   	金额：<span class="money">￥${discountPrice }</span>元
                    <span class="fr" style="margin-right:20px;"><a href="http://www.ibaixiong.com/u/order/list.html"> 订单详情</a></span>
                </p>
            </div>
            <div class="pay-main" style="text-align: center;margin-top:200px;">
                <img src="http://fe.ibaixiong.com/shop/image/wx-pay-success.png" class="wx-pay-success">
            </div>
        </div>
        </c:if>
        <c:if test="${payType == '1' }">
        <div class="wrap">
            <div class="pay-head">
                <p>
                    <img src="http://fe.ibaixiong.com/shop/image/alipay-logo.png" class="wx-logo">
                    <span class="strong"></span>
                    	金额：<span class="money">￥${discountPrice }</span>元
                    <span class="fr" style="margin-right:20px;"><a href="http://www.ibaixiong.com/u/order/list.html"> 订单详情</a></span>
                </p>
            </div>
            <div class="pay-main" style="text-align: center;margin-top:200px;">
                <img src="http://fe.ibaixiong.com/shop/image/alipay-success.png" class="alipay-success">
            </div>
        </div>
        </c:if>
        <c:if test="${payType == '5' }">
        <div class="wrap">
            <div class="pay-head">
                <p>
                    <img src="http://fe.ibaixiong.com/shop/image/cmbchinapay-logo.png" class="wx-logo">
                    <span class="strong"></span>
                    	金额：<span class="money">￥${ amount }</span>元
                    <span class="fr" style="margin-right:20px;"><a href="http://www.ibaixiong.com/u/order/list.html"> 订单详情</a></span>
                </p>
            </div>
            <div class="pay-main" style="text-align: center;margin-top:200px;">               
                <img src="${ payResultImg }" class="alipay-success">
                ${ msg }
            </div>
        </div>
        </c:if>
    </div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
 </body>
</html>
