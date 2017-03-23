<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <link href="http://fe.ibaixiong.com/shop/css/scan-record.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--
width=device-width：让文档的宽度与设备的宽度保持一致，且文档最大的宽度比例是1.0
initial-scale=1：初始的缩放比例
maximum-scale=1：允许用户缩放到的最大比例（对应还有个minimum-scale）
user-scalable=no：不允许用户手动缩放
-->
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
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery.mobile-1.4.5.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jgestures.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/touch.js" type="text/javascript" ></script>
    <title>扫描记录</title>
</head>
<style>
    body{
        background-image: url("http://fe.ibaixiong.com/shop/images/scanbg.png");
        background-position: top center;
        background-repeat: no-repeat;
        background-size:100% 260px;
        background-color: #fff;
    }
    .row{
        margin: 0;
    }
    .title{
        font-size:1.8rem;
        text-align:center;
        color:#fff;
    }
    .content{
        width: 100%;
        padding:0 15px;
        overflow: hidden;
        padding-top:30px;
    }
    .type-title{
        text-align: center;
        display: none;
        color:#fff;
    }
    .yellow{
        color:#ff6200
    }
    .prod-img{
        width: 120px;
        height:120px;
        float: right;
        margin-right:20px;
    }
    .switch-row{
        text-align: center;
        border-bottom:1px solid #dcdcdc;
        padding-bottom:30px;
        margin-top:30px;
    }
    .switch{
        display: inline-block;
        margin:0px 20px;
        font-size:1.8rem;
    }
    .switch-row span.on{
        border-bottom:4px solid #ff6200;
    }
    h3.on,.infor-row div.on{
        display: block;
    }
    .infor-li{
        border-bottom:1px solid #dcdcdc;
        padding:10px 0;
    }
    .infor-li p{
        text-align: center;
    }
    .light{
        color:#999;
        font-size:1.0rem;
    }
    .dark{
        color:#333;
        font-size:1.6rem;
    }
    .col-lg-6{
        width: 50%;
        padding:18px 10px;
        float: left;
    }
    .record{
        display: block;
        height:60px;
        line-height:60px;
        background:#e3e3e3;
        color:#333;
        text-align:center;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        padding:0 10px;
    }
    .infor-box{
        overflow: hidden;
        display: none;
    }
    .ui-loader{
        display:none;
    }
</style>
<script>
    $(document).ready(function(){
        //切换模块
        $(document).on("tap",'.switch',function(){
            var x=$(this).index();
            $('.on').removeClass('on');
            $('.type-title').eq(x).addClass('on')
            $('.switch').eq(x).addClass('on')
            $('.infor-box').eq(x).addClass('on')
        });
    })
</script>
<body>
<header>
    <h2 class="title">白熊科技</h2>
</header>
<div class="content">
    <div class="row">
        <h3 class="type-title on">${ scanResult }</h3>
        <h3 class="type-title">第<span class="yellow">${fn:length(listScanRecod)}</span>次扫描</h3>
    </div>
    <div class="row">
        <img src="${pic}" class="prod-img">
    </div>
    <div class="row switch-row">
        <span class="switch on">商品信息</span>
        <span class="switch">扫描记录</span>
    </div>
    <div class="row infor-row">
        <div class="infor-box on">
            <div class="infor-li">
                <p class="light">商品名称</p>
                <p class="dark">${ productName }</p>
            </div>
            <div class="infor-li">
                <p class="light">商品型号</p>
                <p class="dark">${ productFormat }</p>
            </div>
            <div class="infor-li">
                <p class="light">生产日期</p>
                <p class="dark"><fmt:formatDate value="${ productMfgDate }" pattern="YYYY-MM-dd" /></p>
            </div>
            <div class="infor-li prompt-li">
                <p class="yellow prompt">此二维码第${fn:length(listScanRecod)}次被扫描</p>
            </div>
        </div>
        <!-- 扫描记录-->
        <div class="infor-box">
            <div class="row">
            <c:forEach items="${listScanRecod}" var="item" varStatus="itemStatus">
                <div class="col-lg-6">
                    <span class="record">${itemStatus.count}、<fmt:formatDate value="${ item.createDateTime }" pattern="YYYY-MM-dd HH:MM:SS" /></span>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="bot">
	<div class="leftbox">
    <div class="left">
    	<a href="http://html.ibaixiong.com/html/app_download_scan.html"><img src="http://fe.ibaixiong.com/shop/images/app_download_scan.png"></a>
    	<span class="line"></span>
    	<span class="word">
	    	<span>手机遥控<br/>APP下载</span>
	    </span>
    </div>
    </div>
    <div class="rightbox">
    <div class="right">
    	<img src="http://fe.ibaixiong.com/shop/images/how-smart-link.png">
    	<span class="line"></span>
    	<span class="word">
	    	<span>手机如何<br/>连接设备</span>
	    </div>
    </div>
    </div>
</div>
</body>
</html>