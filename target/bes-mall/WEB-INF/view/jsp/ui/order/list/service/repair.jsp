<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-维修单</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/goods.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="content">
			<jsp:include page="../../../include/top.jsp"></jsp:include>
			<div class="clearfix">
				<div class="content-left">
					<jsp:include page="../../../include/left.jsp"><jsp:param value="wx" name="checkLefr" /></jsp:include>
				</div>
				<div class="content-right">
					<div class="right-title clearfix">
						<a>维修单</a>
					</div>
					<c:if test="${fn:length(serviceList)>0}">
						<div class="back-container">
							<ul class="back-list">
								<c:forEach items="${serviceList }" var="service">
									<li>
										<ul class="status clearfix">
											<li class="${service.status>=10?"on":"" } serviceli">
												<span class="servicelispan">提交申请</span>
												<!-- em><fmt:formatDate value="${service.createDateTime }" pattern="yyyy-MM-dd HH:mm"/></em> -->
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.status>=20?"on":"" } serviceli">
												<span class="servicelispan">已签收</span>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.status>=30?"on":"" } serviceli">
												<span class="servicelispan">审核中</span>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.status>=40?"on":"" } serviceli">
												<c:if test="${service.status>=41}"><span class="servicelispan">同意</span></c:if>
												<c:if test="${service.status==42}"><span class="servicelispan">拒绝</span></c:if>
												<c:if test="${service.status<40}"><span class="servicelispan">同意/拒绝</span></c:if>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.status>=50?"on":"" } serviceli">
												<span class="servicelispan">维修中</span>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.status>=60?"on":"" } serviceli">
												<span class="servicelispan">已发货</span>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.status>=70?"on":"" } last serviceli">
												<span class="servicelispan">已签收</span>
												<i class="status-lion servicelion"></i>
											</li>
										</ul>
										<div class="sline"></div>
										<c:forEach items="${service.serviceItems }" var="serviceItem">
											<div class="status-box">
												<c:forEach items="${serviceItem.format.productPics }" var="pic" varStatus="statusPic">
													<c:if test="${statusPic.index==0 }"><img width="96px" height="96px" src="${pic.url }" /></c:if>
												</c:forEach>
												<p class="sp-name">${serviceItem.format.name }</p>
												<p class="sp-status">已提交申请，请耐心等待</p>
												<!-- 
												<p class="sp-logistics"><span>快递：圆通</span><span>单号：33040050664</span></p>
												<div class='logistics-info'style="color:#999;"  data-number="33040050664">
													<span>物流信息</span>
												</div>
												<p class="sp-logistics"><span>维修内容：更换电源线</span><span style="margin-left:20px;">维修价格：￥121</span></p>
												<div class='logistics-info'>
													<span class="payed">已支付</span>
												</div>
												 -->
											</div>
										</c:forEach>
										
									</li>
								</c:forEach>
								</ul>
						<div class="list-page">
							<c:if test="${pager.hasPreviousPage }">
								<a class="prev" href="${url }${pager.pageNumber-1}"></a>
							</c:if>
							<c:if test="${pager.start-1>0 }">
								<a href="${url }1">1</a>
							</c:if>
							<c:if test="${pager.hasBeforPoint }">
								...
							</c:if>
							<div class="list-page-num">
								<c:forEach items="${pager.navigatePageNumbers }" var="item">
									<a class="${item==pager.pageNumber?'current':'' }" href="${url }${item }">${item }</a>
								
								</c:forEach>
							</div>
							<c:if test="${pager.hasAfterPoint }">
								...
							</c:if>
							<c:if test="${ pager.hasNextPage}">
								<a class="next" href="${url }${pager.pageNumber+1}"></a>						
							</c:if>
						</div>
					</div>
				</c:if>
						
				<c:if test="${fn:length(serviceList)==0}">
					<div class="none-container">
						<div class="tac none-container-pic">
							<i></i>
						</div>
						<p class="text">您当前没有维修单哟</p>
					</div>
				</c:if>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
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
	<jsp:include page="../../../include/footer.jsp"></jsp:include>
</body>
</html>