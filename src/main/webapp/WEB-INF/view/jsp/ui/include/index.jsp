<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/27 0027
  Time: 下午 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>个人中心</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="http://fe.ibaixiong.com/shop/css/apparisal.css" rel="stylesheet" type="text/css"/>
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div class="container clearfix">
    <div class="content">
        <jsp:include page="top.jsp"/>
        <div class="clearfix">
            <jsp:include page="left.jsp" />
        </div>
        <div class="content-right">
        </div>
    </div>
</div>
</body>
</html>
