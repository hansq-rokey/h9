<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-退货单</title>
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
					<jsp:include page="../../../include/left.jsp"><jsp:param value="th" name="checkLefr" /></jsp:include>
				</div>
				<div class="content-right">
					<div class="right-title clearfix">
						<a>退货单</a>
					</div>
					<c:if test="${fn:length(serviceList)>0}">
						<div class="back-container">
							<ul class="back-list">
								<c:forEach items="${serviceList }" var="service">
									<li>
										<ul class="status clearfix">
											<li class="${service.afterSalesService.status>=10?"on":"" } serviceli">
												<span class="servicelispan">提交申请</span>
												<!-- em><fmt:formatDate value="${service.afterSalesService.createDateTime }" pattern="yyyy-MM-dd HH:mm"/></em> -->
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.afterSalesService.status>=20?"on":"" } serviceli">
												<c:if test="${service.afterSalesService.status>=20 }"><span class="servicelispan">已签收</span></c:if>
												<c:if test="${service.afterSalesService.status<20 }"><span class="servicelispan">待签收</span></c:if>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.afterSalesService.status>=30?"on":"" } serviceli">
												<span class="servicelispan">审核中</span>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.afterSalesService.status>=40?"on":"" } serviceli">
												<c:if test="${service.afterSalesService.status>=41 && service.afterSalesService.status!=42}"><span class="servicelispan">同意</span></c:if>
												<c:if test="${service.afterSalesService.status==42}"><span class="servicelispan">拒绝</span></c:if>
												<c:if test="${service.afterSalesService.status<40}"><span class="servicelispan">同意/拒绝</span></c:if>
												
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.afterSalesService.status>=50?"on":"" } serviceli">
												<span class="servicelispan">等待退款</span>
												<i class="status-lion servicelion"></i>
											</li>
											<li class="${service.afterSalesService.status>=60?"on":"" } last serviceli">
												<span class="servicelispan">已退款</span>
												<i class="status-lion servicelion"></i>
											</li>
										</ul>
										<div class="sline"></div>
										<c:forEach items="${service.afterSalesServiceItems}" var="serviceItem">
											<div class="status-box">
												<c:forEach items="${serviceItem.pics }" var="pic" varStatus="statusPic">
													<c:if test="${statusPic.first }"><img width="96px" height="96px" src="${pic.url }" /></c:if>
												</c:forEach>
												<p class="sp-name">${serviceItem.format.name }</p>
												<p class="sp-status">已提交申请，请耐心等待</p>
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
						<p class="text">您当前没有退货单哟</p>
					</div>
				</c:if>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
	<jsp:include page="../../../include/footer.jsp"></jsp:include>
</body>
</html>