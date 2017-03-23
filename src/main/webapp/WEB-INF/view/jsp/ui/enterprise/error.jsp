<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
 <head>
  <title>访问错误页面</title>
  <meta name="keywords" content="白熊支付">
  <meta name="description" content="白熊扫码支付">
  <meta name="content-type" content="text/html;charset=gbk">
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"  />
    <!--
        telephone=no：禁止自动将页面中的数字识别为电话号码
        address=no：禁止自动地址转为链接
        email=no：禁止自动将email转为链接
    -->
    <meta name="format-detection" content="telephone=no,address=no,email=no" />
    <!-- 强制将页面布局为一列 -->
    <meta name="mobileOptimized" content="width" />
    <!-- 申明页面是移动友好的 -->
    <meta name="handheldFriendly" content="true" />
    <!-- 允许用户使用全屏模式浏览 -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- 当用户使用全屏浏览时，将状态条设置为黑色 -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="keyword" content="熊爸爸，暖魔方，浴室款，健康，智能，省电"/>
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <title>访问错误页面</title>
    <style>
    header{
        height:140px;
    }
    .container{
        width: 100%;
        padding:0 16px;
        margin-top:-55px;
    }
    .content{
    	width:100%;
    	background:#fff;
    	overflow:hidden;
        -webkit-border-radius: 3px;
        -moz-border-radius:3px ;
        border-radius: 3px;
        box-shadow: 0px 0px 10px 0px rgba(4, 0, 0, 0.3);
        padding-bottom:20px;
    }
    .pay-error-icon{
    	width:80px;
    	height:auto;
        display:block;
    	margin:35px auto;
    }
    .error-text{
    	text-align:center;
    	color:#858585;
    	margin-bottom:30px;
    }
    .pay-link{
    	text-align:right;
    	color:#858585;
    }
    .pay-link a{
    	display:inline-block;
    	padding:10px 16px;
    }
    .pay-link a.pay-again{
    	color:#fb0035;
    }
    </style>
 </head>

 <body>
 <header>
</header>
	<div align="center" id="">
		<p >
		访问失败，路径中包含非法字符
		<br><br>
		</p>
	</div>
 </body>
</html>
