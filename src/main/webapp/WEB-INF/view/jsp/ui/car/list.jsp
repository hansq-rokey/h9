<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>购物车</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/pay.css" rel="stylesheet" type="text/css">
	<link href="/css/shopping-car.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
    <script src="/js/common.js"></script>
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="wrap">
				<div class="pay-head">
					<ul class="pay-nav clearfix">
						<li class="on">
							<img src="http://fe.ibaixiong.com/shop/image/1.png" />
							<span>我的购物车</span>
						</li>
						<li>
							<img src="http://fe.ibaixiong.com/shop/image/2.png" />
							<span>填写订单信息</span>
						</li>
						<li>
							<img src="http://fe.ibaixiong.com/shop/image/3.png" />
							<span>成功提交订单</span>
						</li>
					</ul>
				</div>
				<c:if test="${fn:length(carItemList)>0}">
				<div class="shopping-main">
					<form action="/u/order/confirm.html" method="post" id="confirm">
						<ul class="clearfix list">
							<c:forEach items="${carItemList }" var="item" varStatus="statusItem">
								<li class='carItemLi'>
									<div class="sp-img">
									<c:forEach items="${item.format.pics }" var="pic" varStatus="statusPic">
										<c:if test="${statusPic.first }"><img src="${pic.url }"/></c:if>
									</c:forEach>
									<i class="close" data-id="${item.carItem.id }"></i>
									</div>
									<div class="sp-intro">
										<h2>${item.carItem.productTitle }</h2>
										<p>${item.carItem.productModelFormatName }</p>
										<%-- <p style="font-size: 14px;"><fmt:formatNumber value="${item.carItem.unitPrice}" type="currency" maxFractionDigits="2" minFractionDigits="2" /> --%>											
										<c:if test="${item.format.isExtProperties==1 }">
										<span class="area-text">
											${item.carItemExtend.length }*${item.carItemExtend.width }*${item.carItemExtend.height }
										(m)</span>
										</c:if>
										</p>
									</div>
									<div class="line-dashed"></div>
									<div class="clearfix product-assess">
										<p class="right protuct-sale">
											商品总价：<span><fmt:formatNumber value="${item.carItem.totalPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span>
										</p>
										<div class="left operate-box">
											<a class="minus fl" data-select="${item.format.cDisplay}"  data-id="${item.carItem.id }" data-format-id="${item.format.id }" data-ext="${item.format.isExtProperties }" data-btn="minus" href="javascript:void(0)"></a>
											<input type="text" data-id="${item.carItem.id }" name="carItemNumList" value="${item.carItem.num }" data-type="2" data-txt="num"  data-min="1" data-price="${item.format.price }" class="operate-text fl">
											<input type="hidden" value="${item.carItem.id }"  name="carItemIdList" />
											<span class="area-unit">${item.format.unit }</span>
											<a class="plus fl" data-select="${item.format.cDisplay}"  data-id="${item.carItem.id }" data-format-id="${item.format.id }" data-ext="${item.format.isExtProperties }" data-btn="add" href="javascript:void(0)"></a>
											<!--<c:if test="${item.format.stock<item.carItem.num }">库存不足</c:if>-->
										</div>
										<c:if test="${item.format.cDisplay!=1}">
											<div class="stockbox" style="display:block">
												<p>库存不足</p>
												<div class="transparency"></div>
											</div>
										</c:if>
										<c:if test="${item.format.stock>=item.carItem.num }">
										<div class="stockbox" style="display:none">
											<p>库存不足</p>
											<div class="transparency"></div>
										</div>
										</c:if>
										<c:if test="${item.format.stock<item.carItem.num }">
										<div class="stockbox" style="display:block">
											<p>库存不足</p>
											<div class="transparency"></div>
										</div>
										</c:if>
										<i class="orange-linebottom"></i>
									</div>
								</li>
							</c:forEach>
						</ul>
					</form>
				</div>
				<div class="tac continue-shopping-btns">
					<!--  a class="go-continue mr10" href="javascript:void(0)">继续购物</a>-->
					<a class="new-orange-btn" href="javascript:void(0)">下一步</a>
					<input type="hidden" value="1" name="carItemIdList" id="thisExt"><!-- 存放isExt -->
				</div>
				</c:if>
				<c:if test="${fn:length(carItemList)==0}">
				<div class="no-shopping">
					<div class="no-part1 clearfix" style="margin: 120px auto; margin-left: 350px;">
						<img src="http://fe.ibaixiong.com/shop/image/noshopping1.png">
						<div class="fl">
							<p><b>购物车空空如也</b></p>
							<p class="clearfix">
								<span>去了解</span>
							</p>
							<!-- <p class="clearfix"><a href="/product/52.html"><b>暖魔方壁挂款</b></a></p> -->
							
							<p class="clearfix"><a href="/product/53.html"><b>暖魔方浴室款</b></a></p>
						</div>
					</div>
					<div class="no-part2" style="height: 80px">
						<!-- <a href="/product/52.html"><img src="http://fe.ibaixiong.com/shop/image/noshopping2.png"></a> -->
					</div>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(".new-orange-btn").click(function(){
		if(!$(this).hasClass('ashen')){
			$("#confirm").submit();
		}
	});
	function stockMian(){
		var stock=true;
		$('.stockbox').each(function(){
			if($(this).css('display')=='block'){
				$('.continue-shopping-btns').find('.new-orange-btn').addClass('ashen');
				stock=false;
			}
		})
		if(stock==true){
			$('.continue-shopping-btns').find('.new-orange-btn').removeClass('ashen');
		}
	}
	$(function(){
		    stockMian();
		$('a[data-btn="minus"]').on('click',function(){
			stockMian();
		})
		$('.list').find('li').mouseover(function(){
			$('.current').removeClass('current');
			$(this).addClass('current');
		}).mouseout(function(){
			$(this).removeClass('current');
		});
		$(document).on('click','.close',function(){
			$(this).parent().parent('li').remove();
			var data_id=$(this).attr('data-id');
			settings.delAddressFn(data_id, function(data){
				if (data.success == true) {
					$("#marker").hide();// 隐藏弹窗
					//$(this)parent.hide();// 隐藏删除项
					if($('.carItemLi').length==0){
						var html='<div class="no-shopping"><div class="no-part1 clearfix"><img src="http://fe.ibaixiong.com/shop/image/noshopping1.png"><div class="fl"><p><b>购物车空空如也</b></p><p class="clearfix"><span>去了解</span><p class="clearfix"><a href="/product/53.html"><b>暖魔方浴室款</b></a></p></p></div></div><div class="no-part2" style="height: 80px"></div></div>'
						$('.pay-head').after(html);
						$('.new-orange-btn').hide();
					}
				}else{
					alertLayel("删除失败!");// 错误提示
				}
				stockMian();
			});
		})
		var settings = {
			// 删除地址接口
			delAddressFn: function (_data, fn) {
				$.ajax({
				 type: "POST",//请求方式
				 url: "/u/car/remove.html",//请求地址
				 data: "carId="+_data,//参数
				 dataType: "json",// 接收数据的格式
				 success: function (data) {
				 fn(data);
				 },//成功后启动的回调函数
				 error: function () {
				 fn(data);
				 },
				 cache: false//缓存
				 });
			},
		}
	})

	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
