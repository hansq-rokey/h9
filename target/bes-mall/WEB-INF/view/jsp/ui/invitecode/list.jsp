<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>邀请码</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/user-orderlist.css" rel="stylesheet" type="text/css">
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
					<jsp:include page="../include/left.jsp"><jsp:param value="invite" name="checkLefr" /></jsp:include>
				</div>
				<c:if test="${fn:length(codes)!=0}">
					<div class="content-right">
					<div class="right-title clearfix">
                    	<a>邀请码</a>
                	</div>
						<table class="user-invitelist-table">
							<thead>
								<tr>
									<td style="width:120px;">金额</td>
									<td style="width:120px;">状态</td>
									<td style="width:180px;">截止日期</td>
									<td style="width:180px;">来源</td>
									<td>适用产品</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${codes }" var="item">
								<tr>
									<td class="red"><fmt:formatNumber value="${item.money }" minFractionDigits="0" maxFractionDigits="0" type="currency" /> </td>
									<td>
										<c:choose>
											<c:when test="${item.status==-1 }">已失效</c:when>
											<c:when test="${item.status==0 }">未付款</c:when>
											<c:when test="${item.status==1 }">未使用</c:when>
											<c:when test="${item.status==2 }">使用中</c:when>
											<c:when test="${item.status==3 }">已使用</c:when>
											<c:otherwise>未知</c:otherwise>
										</c:choose>
									</td>
									<td><fmt:formatDate value="${item.validTime }" pattern="yyyy.MM.dd" /> </td>
									<td>${item.receiveUserName }</td>
									<td><a href="javascript:;" class="link showProduct" data-id="<c:forEach items="${ item.allowProducts }" var="allowProduct">${ allowProduct.productId },</c:forEach>">查看<span class="looktit" style="display:none;"><i class="linearrow"></i><div></div></span></a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					<c:if test="${pager.pages>1 }">
		
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
					</c:if>
				</div>
				</c:if>
				<c:if test="${fn:length(codes)==0}">
				<div class="content-right">
					<div class="right-title clearfix">
						<a>邀请码</a>
					</div>
					<div class="none-container">
						<div class="tac none-invite-pic">
							<i></i>
						</div>
						<p class="text">您还没有邀请码哟</p>
					</div>

				</div>
				</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
    	//查看产品
    	$('.showProduct').mouseover(function(){
    		//$('.showPop').show();
    		$('.looktit').hide();
    		var id=$(this).attr('data-id');
    		var html='';
    		$.ajax({
				type : "POST",
				url : "/u/invite/getallowproduct.html",
				async:false,
				data : {
					id : id
				},
				dataType : "json",
				success : function(data) {
					if(data){
						for(i=0;i<data.length;i++){
							html+='<p><a href="'+data[i].detailUrl+'" target="_blank">'+data[i].title+'</a></p>';
						}  
					}else{
						html='<p>没有可使用产品</p>';
					}
				}
			});
    		$(this).find('.looktit').show().find('div').html(html);
    	}).mouseleave(function(){
    		$(this).find('.looktit').hide();
    	});
	});
</script>
</body>
</html>