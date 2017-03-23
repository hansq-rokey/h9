<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/27 0027
  Time: 下午 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
String checkLefr = request.getParameter("checkLefr");
%>
<input type="hidden" id="checkLefr" value="<%=checkLefr %>"/>
<h3>个人中心</h3>
<ul>
	<li id="orderli"><a href="/u/order/list.html">我的订单</a></li>
	<li id="codeli"><a href="/u/deposit/list.html">定金</a></li>
</ul>
<h3>售后服务</h3>
<ul>
	<li id="thli"><a href="/u/service/list/back.html">退货单</a></li>
	<li id="hhli"><a href="/u/service/list/exchange.html">换货单</a></li>
	<!-- li id="wxli"><a href="/u/service/list/repair.html">维修单</a></li> -->
</ul>
<h3>账户管理</h3>
<ul>
	<li id="addressli"><a href="/u/address/list.html">收货地址</a></li>
	<li id="pwdli"><a href="/u/user/updatepwd.html">密码管理</a></li>
	<!-- <li id="accountli"><a href="/u/user/account.html">账号管理</a></li> -->
</ul>
<script type="text/javascript">
	var leftOn = $("#checkLefr").val();
	if(leftOn == "order"){
		$("#orderli").attr("class","on");
	}
	if(leftOn == "invite"){
		$("#codeli").attr("class","on");
	}
	if(leftOn == "th"){
		$("#thli").attr("class","on");
	}
	if(leftOn == "hh"){
		$("#hhli").attr("class","on");
	}
	if(leftOn == "wx"){
		$("#wxli").attr("class","on");
	}
	if(leftOn == "address"){
		$("#addressli").attr("class","on");
	}
	if(leftOn == "pwd"){
		$("#pwdli").attr("class","on");
	}
	if(leftOn == "account"){
		$("#accountli").attr("class","on");
	}
</script>