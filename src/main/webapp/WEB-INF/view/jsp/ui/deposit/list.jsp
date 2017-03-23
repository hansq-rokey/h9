<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-定金</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/user-orderlist.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/deposit.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="clearfix">
				<div class="content-left">
					<jsp:include page="../include/left.jsp"><jsp:param value="invite" name="checkLefr" /></jsp:include>
				</div>
				<div class="content-right">
					<c:if test="${fn:length(list)==0 }">
						<div class="right-title clearfix">
							<p>定金</p>
						</div>
						<div class="deposit_content">
							<div class="none-deposit">
								<i></i>
							</div>
							<!-- <p class="text">您还没有换货订单哟<a href="#">去看看&gt;&gt;</a></p> -->
						</div>
					</c:if>
					<c:if test="${fn:length(list)>0 }">
						<div class="right-title clearfix">
							<p>定金</p>
						</div>
						<div class="deposit_content">
							<div class="row">
								<c:forEach items="${list }" var="item">
									<div class="col-lg-4">
									  <div class="deposit_box deposit_on">
										<p class="deposit_money"><img src="http://fe.ibaixiong.com/shop/image/deposit.png"><span class="c_content">${item.frontMoney}</span></p>
										<p class="deposit_state"><span>状态:</span>
											<span >
												<c:forEach items="${statusArray }" var="st">
													<c:if test="${st.status==item.status }">
														${st.value }
													</c:if>
												</c:forEach>
											</span>
										</p>
										<p class="deposit_state"><span>日期:</span><span><fmt:formatDate value="${item.createDateTime }" pattern="yyyy.MM.dd    HH:MM"/> </span></p>
										<c:if test="${item.status==20 }"><a href="###" class="apply_for" data-text="${item.frontNumber }">申请退款</a></c:if>
		                              </div>
									</div>								
								</c:forEach>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="0" id="thisnum">
	<div class="deposit_layer">
		<div class="content_layer">
			<h3>申请退款</h3>
<!-- 			<div class="deposit_input">
			  <label>密码</label>
			  <input type="password" class="deposit_password" id="deposit_password">
			</div> -->
			<div class="deposit_btn">
			    <input type="hidden" id="aa_content" value="1">
				<a class="subLink" href="###">立即申请</a>
				<a class="subundo" href="###">取消</a>
			</div>
			<p class="deposit_bottom">申请后会在<b>3-5</b>工作日到达原支付账户</p>
		</div>
	</div>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$(".subLink").click(function(){
			   var number=$("#thisnum").val();
			   console.log(number);
			   $.ajax({
					url:'/u/deposit/refund.html',
					 dataType: 'json',
					  data: {"number":number},
					  success: function(data){
	     				  $(".deposit_layer").hide();
					  }
				});
		  });
		
	});
	</script>
	
</body>
</html>