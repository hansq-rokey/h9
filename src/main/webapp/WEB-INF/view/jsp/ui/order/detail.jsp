<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-订单详情</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="/css/common.css" rel="stylesheet" type="text/css">
	<link href="/css/order.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
    <script src="http://fe.ibaixiong.com/shop/js/common.js"></script>
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="clearfix">
				<div class="content-left">
					<jsp:include page="../include/left.jsp"><jsp:param value="order" name="checkLefr" /></jsp:include>
				</div>
				<div class="content-right">
					<div class="right-title clearfix">
						<span>订单号：<span class="orderNumber">${order.orderNumber}</span></span>
					</div>
					<div class="order-container">
						<c:if test="${order.status!=60}">
							<ul class="order-status clearfix">
								<c:forEach items="${orderStatusList }" var="item">
								<c:if test="${item.dictCodeValue!=80 }">
									<li class="${item.flow ? 'on':'' }">
										<span>${item.dictCodeName }</span>
										<c:if test="${item.flow }">
											<em class="dateTime"><fmt:formatDate value="${item.orderHistory.createDateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></em>									
										</c:if>
									</li>
									</c:if>
								</c:forEach>
							</ul>
						<div class="sline"></div>
						<div class="sline sline2"></div>
						</c:if>
						<div class="order">
							<h4 class="clearfix"><c:if test="${order.status==10 }"><span class="fr order-close">12小时后订单将关闭</span></c:if><span class="fl"><c:if test="${logistics!=null&&logistics.expressNo!=null }"> 运单号：${logistics.expressNo}</c:if></span></h4>
							<div class="order-sp">
								<c:forEach items="${orderItems }" var="item" varStatus="statusItem">
									<div class="sp ${statusItem.index==0?"bt0":""} clearfix">
										<c:forEach items="${item.pics }" var="pic" varStatus="statusPic">
											<c:if test="${statusPic.first }"><img src="${pic.url }" /></c:if>
										</c:forEach>
										<span class="sp-name">${item.productModelFormatName }
											<span class="sp-name" style="margin-top:-36px;">
												<c:forEach items="${item.orderItemExts }" var="extItem">
													${extItem.propertyName }: ${extItem.formatExtValue }
												</c:forEach>
											</span>
										</span>

										<span class="sp-price"><fmt:formatNumber value="${item.unitPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span>
										<span class="sp-count">${item.num } (${item.unit })</span>
									</div>
								</c:forEach>
								<div class="sp-right">
									<c:if test="${order.status==50 }"><a href="/u/service/apply.html?number=${order.orderNumber }" class="after-sale">申请售后</a></c:if>
									<div class='logistics-info'>
										<div class="detail detail_on" style="position:relative;display:inline-block;"><a  href="javascript:void(0)" style="color: #ff6200;display:block;">物流信息</a>
										
										<%-- <div class="logistics-box">										
											<div class="logistics">
												<span class="arrow"></span>
												<c:if test="${logistics!=null&&logistics.expressNo!=null }"><h5>${logistics.expressName}  快递单号：${logistics.expressNo}</h5></c:if>
												<c:if test="${logistics==null||logistics.expressNo==null }"><h5>暂无物流信息</h5></c:if>
												<ul class="logistics-list">
													
												</ul>
											</div>
										</div> --%>
											<div class="logistics-box">										
												<div class="logistics">
													<span class="arrow"></span>
													<c:if test="${logistics!=null&&logistics.expressNo!=null }"><h5>${logistics.expressName}  快递单号：${logistics.expressNo}</h5></c:if>
													<c:if test="${logistics==null||logistics.expressNo==null }"><h5>暂无物流信息</h5></c:if>
													<ul class="logistics-list">
														
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${fn:length(bomList)>0 }">
						    <div class="order-Details order-boxborder2">
							  <ul class="order-tag">
							    <li>物料名称</li>
							    <li>规格</li>
							    <li>编号</li>
							    <li>数量</li>
							  </ul>
							  <c:forEach items="${bomList }" var="item">
							  	<div class="order-mian">
							     	<span>${item.materialName }</span>
							     	<span>${item.materialModel}</span>
							     	<span>${item.serialNumber }</span>
							     	<span>${item.num }</span>
							  	</div>
							  </c:forEach>
							</div>
							</c:if>
							<div class="order-info clearfix">
								<div class="order-info-money fl">
									<h6>实付：<span class="priceSpan"><fmt:formatNumber value="${order.shouldPayMoney }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></h6>
									<p><em>商品总额</em>：<span class="priceSpan"><fmt:formatNumber value="${order.totalPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
									<!-- p><em>积分优惠</em>：<span>-￥199.00</span></p> -->
									<p><em>定金支付</em>：<span  class="priceSpan">-<fmt:formatNumber value="${order.frontMoney }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
<%-- 									<p><em>其他优惠</em>：<span  class="priceSpan">-<fmt:formatNumber value="${order.totalPrice-order.discountPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p> --%>
									<p><em class="yf">运费</em>：<span>0</span></p>
								</div>
								<div class="order-info-log fl">
									<h6>收货信息</h6>
									<p><em class="yf">姓名</em>：${reciver.reveiveUserName }</p>
									<p><em>收货地址</em>：${reciver.provinceName }${reciver.cityName }${reciver.districtName }${reciver.detailAddress }</p>
									<p><em class="yf">电话</em>：${reciver.mobilePhone }</p>
									<p><em>送货时间</em>：${reciver.deliverTimeName }</p>
								</div>
							</div>
				    	</div>
				    	<!-- <div class="order_total">
								<div class="row order_color">
									<div class="col-lg-3">  &nbsp</div>
									<div class="col-lg-3">发热墙纸</div>
									<div class="col-lg-3">普通墙纸</div>
									<div class="col-lg-3">小计</div>
								</div>
								<div class="row order_mian">
									<div class="col-lg-3 x_margin"> 主卧</div>
									<div class="col-lg-3">
										<p class="x_money">￥1000</p>
									    <p>12㎡</p>
									</div>
									<div class="col-lg-3">
	                                    <p class="x_money">￥1000</p>
									    <p>12㎡</p>
									</div>
									<div class="col-lg-3">
										<p class="x_money">￥2000</p>
									    <p>24㎡</p>
									</div>
								</div>
								<div class="row order_mian order_hr">
									<div class="col-lg-3 x_margin"> 次卧</div>
									<div class="col-lg-3">
										<p class="x_money">￥1000</p>
									    <p>12㎡</p>
									</div>
									<div class="col-lg-3">
										<p class="x_money">￥1000</p>
									    <p>12㎡</p>
									</div>
									<div class="col-lg-3">
	                                    <p class="x_money">￥2000</p>
									    <p>24㎡</p>
									</div>
								</div>
					        </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var JsonData = [// 模拟数据
				{
					"content": "由【深圳福田西丽大学城】发往 【广东深圳中转部】3",
					"time": "2015-05-16 10:22:08",
					"sign": "1"// 当前所以位置 1为在
				},
				{
					"content": "由【深圳福田西丽大学城】发往 【广东深圳中转部】2",
					"time": "2015-05-17 10:22:08",
					"sign": "0"
				},
				{
					"content": "由【深圳福田西丽大学城】发往 【广东深圳中转部】1",
					"time": "2015-05-18 10:22:08",
					"sign": "0"
				},
				{
					"content": "由【深圳福田西丽大学城】发往 【广东深圳中转部】0",
					"time": "2015-05-18 10:22:08",
					"sign": "0"
				}
			];
		// 获取物流接口
		var settings = {
			getLogistics: function(number, fn){
				fn(JsonData, number);// 模拟动态请求后的回调
				/*$.ajax({
                    type: "POST",//请求方式
                    url: "",//请求地址
                    data: d,//参数
                    dataType: "json",// 接收数据的格式
                    success: function (data) {
                        fn(data);// 数据回调
                    },//成功后启动的回调函数
                    error: function () {
                        flg = 3;//错误，提示信息！
                    },
                    cache: false,//缓存
                    async: false//锁定用户操作
                });*/

			}
		};
	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script>
		var html='';
		function dateTime(){
			$('.order-close').each(function(){
					var startDate=$('.dateTime').text().toString().replace(/-/g,"/");
					var newDate=new Date();
					newDate=newDate++;
					startDate=new Date(Date.parse(startDate));
					var time=43200000-(newDate-startDate);
					//if(time>0){
						var seconds = time/1000;
				        var minutes = Math.floor(seconds/60);
				        var hours = Math.floor(minutes/60);
				        var CHour= hours % 24;
				        var CMinute= minutes % 60;
				        var CSecond= seconds % 60;
				        html=''+CHour+'时'+CMinute+'分'+parseFloat(CSecond).toFixed(0)+'秒后订单关闭';
				        $(this).text(html);
					//}
			})
		}
		window.onload=function(){
	        setInterval("dateTime()",1000);
	    }
		$(document).ready(function(){		
		/* 	$('.detail_on').mouseenter(function(event){//鼠标移入
				$('.logistics-box').show();
				event.stopPropagation();
			});
			$('.detail_on').mouseleave(function(event){//鼠标移出
				$('.logistics-box').hide();
			}); */
			$(".detail_on a").on("click",function(event){
				var order_number=$('.orderNumber').text();
				var arr01=[];
					$.ajax({
						type: "POST",
						url: "/u/order/trace.html?orderNumber="+order_number,
						cache: false,
						dataType:"json",
						success: function(data) {
							var testJson = $.parseJSON(data.logistics); 
							var expressNo=testJson.sn_responseContent.sn_body.getLogisticsDetail.expressNo;//订单号
							var wayBillStatus=testJson.sn_responseContent.sn_body.getLogisticsDetail.wayBillStatus;//订单状态
							var step=(testJson.sn_responseContent.sn_body.getLogisticsDetail.step).reverse();//快递地址
							var html="";
							for(var i =0 ; i < step.length; i++){
								html+='<li><p class="order-address">'+step[i].statusContent+'</p><p class="order-time">'+step[i].statusTime+'</p></li>'
							}
							$('.logistics-list').html(html);
							$(".logistics-box").fadeToggle(200);
						/* 	var html="";
							var steps=data.responseParam.orders[0].steps;
							if(data.code==0){
								html='<li><p>'+data.message+'</p></li>';
							}else{
								for(i=steps.length-1;i>0;i--){
									var time=steps[i].acceptTime;
									time=JSON.stringify(time);
									time=time.substr(0,20);
									time=time.replace('T',' ');
										html+='<li><p>'+steps[i].remark+'</p><p class="time"> '+time+'</p></li>';
								}
							}
							$('.logistics-list').html(html); *///德邦物流
						}
					});
			});
			
			if($('.order-status>li').length>8){
				$('.sline2').show();
				//$('.order-status>li').css('width','150px')
				$('.order').css('marginTop','166px');
			}
			if($('.order-status').length==0){
				$('.order').css('marginTop','0');
			}
		})
	</script>
</body>
</html>
