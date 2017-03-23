<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
   	<link rel="stylesheet" type="text/css" href="/css/h5_css/common.css">
	<link rel="stylesheet" type="text/css" href="/css/h5_css/index.css">
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
    <title>扫描查询</title>
</head>
<body>
<!--多次扫描-->
	<div class="mob_box product_false" style="display:none">
		<div class="mob_top mob_bc1 mob_of">
			<h3 class="mob_title mob_fz18">
				<a class="mob_block mob_tc1" href="###"></a>
				白熊科技
			</h3>
			<p class="mob_txt mob_fz25 mob_tx_h1">第${fn:length(listScanRecod)}次扫描</p>
			<p class="mob_tc1 mob_txterr">如果第一次不是您扫描,<br/>请拨打官方电话400-175-0088，<a href="index.html">查询详情 >> </a></p>
			<div class="mob_Picture2"><img src="/image/mob_img/Picture5.png"></div>
		</div>
		<div class="mob_center"></div>
		<div class="mob_footer">
			<ul class="mob_arguments">
				<li>
					<i class="mob_icon mob_icon1"></i>
					<p class="mob_argtxt">
						<span class="mob_fz18 mob_db mob_tc1">白熊光模仿MX5</span>
					    <span class="mob_fz14 mob_db mob_tc2">商品名称</span>
					</p>    
				</li>
				<li>
					<i class="mob_icon mob_icon2"></i>
					<p class="mob_argtxt">
						<span class="mob_fz18 mob_db mob_tc1">蓝色  儿童款  1600W</span>
					    <span class="mob_fz14 mob_db mob_tc2">商品型号</span>
					</p>   
				</li>
				<li>
					<i class="mob_icon mob_icon3"></i>
					<p class="mob_argtxt">
						<span class="mob_fz18 mob_db mob_tc1">2015-06-18</span>
					    <span class="mob_fz14 mob_db mob_tc2">生产日期</span>
					</p>
				</li>
			</ul>
			<div class="mob_Picture3 mob_of"><img src="/image/mob_img/Picture1.jpg"></div>
		</div>
	</div>
	<!--正品-->
	<div class="mob_box product_true">
		<div class="mob_top mob_bc1 mob_of">
			<h3 class="mob_title mob_fz18">
				<a class="mob_block mob_tc1" href="###"></a>
				白熊科技
			</h3>
			<p class="mob_txt mob_fz25 mob_tx_h1">恭喜您<br/>您买到的是熊爸爸正品</p>
			<div class="mob_Picture2"><img src="../image/mob_img/Picture3.png">	</div>
		</div>
		<div class="mob_center"></div>
		<div class="mob_footer">
			<ul class="mob_arguments">
				<li>
					<i class="mob_icon mob_icon1"></i>
					<p class="mob_argtxt">
						<span class="mob_fz18 mob_db mob_tc1">白熊光模仿MX5</span>
					    <span class="mob_fz14 mob_db mob_tc2">商品名称</span>
					</p>    
				</li>
				<li>
					<i class="mob_icon mob_icon2"></i>
					<p class="mob_argtxt">
						<span class="mob_fz18 mob_db mob_tc1">蓝色  儿童款  1600W</span>
					    <span class="mob_fz14 mob_db mob_tc2">商品型号</span>
					</p>   
				</li>
				<li>
					<i class="mob_icon mob_icon3"></i>
					<p class="mob_argtxt">
						<span class="mob_fz18 mob_db mob_tc1">2015-06-18</span>
					    <span class="mob_fz14 mob_db mob_tc2">生产日期</span>
					</p>
				</li>
			</ul>
			<div class="mob_Picture3 mob_of"><img src="../image/mob_img/Picture1.jpg"></div>
		</div>
	</div>
</body>
</html>