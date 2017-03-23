<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/25 0025
  Time: 下午 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/css/pay.css" rel="stylesheet" type="text/css" />
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div class="container clearfix">
    <div class="content">
        <jsp:include page="../include/top.jsp" />
        <div class="wrap">
            <div class="pay-head">
                <ul class="pay-nav clearfix">
                    <li>
                        <img src="http://fe.ibaixiong.com/shop/image/1.png"/>
                        <span>我的购物车</span>
                    </li>
                    <li>
                        <img src="http://fe.ibaixiong.com/shop/image/2.png"/>
                        <span>填写订单信息</span>
                    </li>
                    <li  class="on">
                        <img src="http://fe.ibaixiong.com/shop/image/3.png"/>
                        <span>成功提交订单</span>
                    </li>
                </ul>
            </div>
            <div class="pay-main">
                <div class="pay-info left">
                    <h2><img src="http://fe.ibaixiong.com/shop/image/true.png"/> 订单提交成功</h2>

                    <p class="ordernum">订单号：${order.orderNumber }</p>
          <input type="hidden" id="orderNumber" value="${order.orderNumber }"/>
          
                    <div class="line"></div>
                    <c:forEach items="${orderItems }" var="item" varStatus="statusItem">
                    <div class="probox">
                    	<p class="clearfix" style="padding-top:12px;">${statusItem.count }.${item.productTitle }<em style="padding-left:10px;">${item.productModelFormatName }</em></p>
			            <div class="information">
			              <%-- <p>
			                <span class="info-name">价格：</span>
			                <fmt:formatNumber value="${item.unitPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" />
			                <c:if test="${item.type==1 }">
			                  <span class="multiple">x${item.num }</span>               
			                </c:if>
			                </p> 单价隐藏--%>
			            </div>
          			</div>
                    </c:forEach>
                    <div class="line"></div>
                    <p style="text-align:right;margin-top:8px;margin-bottom:12px;">
                                                                        合计：<span class='money'><fmt:formatNumber value="${order.shouldPayMoney }" type="currency" maxFractionDigits="2" minFractionDigits="2" />
                      </span>
                      <input type="hidden" id="payMoney" value="${order.shouldPayMoney }"> </p>
          <div class="original">
                      <p class="ordernum   details-no">收货信息</p>
                      <div class="line  details-no"></div>
                      <div class="adressbox">
                        <p class="adress  details-no">${reciver.provinceName }${reciver.cityName }${reciver.districtName }${reciver.detailAddress }${reciver.zipcode }(${reciver.reveiveUserName }收) </p>
  
                        <p class="tele details-no">${reciver.mobilePhone }</p>
            </div>
                      <p class="tcenter details-no">请在12小时内完成支付，否则订单会被自动取消。</p>
                  </div>
                </div>
                <div class="pay-pic right"><a href="/product/53.html" target="_blank"><img src="http://fe.ibaixiong.com/shop/image/pay-picimg.png"/></a></div>
            </div>
             <h2 class="chosepay">选择支付</h2>
            <div class="clearfix">
                <div class="pay-btn">
                   <img class="pay-img select-img"  onclick="setPay('alipay')" src="http://fe.ibaixiong.com/shop/image/alipay.png"/>
                </div>
                <div class="pay-btn">
                   <img class="pay-img" onclick="setPay('wechart')" src="http://fe.ibaixiong.com/shop/image/wechart.png"/>
                </div>
                <div class="pay-btn">
                   <img class="pay-img ylpay" onclick="setPay('ylchart')" src="http://fe.ibaixiong.com/shop/image/cmbchinapay.png"/>
                </div>
            </div>
            <!-- 支付提交 -->
            <form id="fm" name="ylPayForm" style="height:0;overflow:hidden;" action="https://netpay.cmbchina.com/netpayment/basehttp.dll?prepayc2" method="post" target="_blank">
			        分行号：<input name="branchid" id="branchid" type="text" value=""><br>
			        商户号：<input name="cono" id="cono" type="text" value=""><br>
			        日期：<input name="date" id="date" type="text" value="">（必须填写为今天）<br>
			        定单号：<input name="billno" id="billno" type="text" value="">10位数字<br>
			        金额：<input name="amount" id="amount" type="text" value=""><br>
			        商户自定义参数：<input name="MerchantPara" id="MerchantPara" type="text" value=""><br>
			        回调URL：<input type="text" name="MerchantURL" id="MerchantURL" value=""><br>
			        浏览器返回URL：<!-- input type="text" name="MerchantRetUrl" id="MerchantRetUrl" value=""--><br>
		        <input name="MerchantCode" id="MerchantCode"><br>
		        <input type="submit" value="支付"><br>
        </form>
            <ul class="bankList">
              <li class="bankli01" data-id="" data-title="招商银行"></li>
              <li class="bankli02" data-id="0309" data-title="兴业银行"></li>
              <li class="bankli03" data-id="0305" data-title="中国民生银行"></li>
              <li class="bankli04" data-id="0304" data-title="华夏银行"></li>
              <li class="bankli06" data-id="0403" data-title="北京银行"></li>
              <li class="bankli07" data-id="0310" data-title="上海浦东发展银行"></li>
              <!-- li class="bankli08" data-id="0306" data-title="广东发展银行"></li-->
              <li class="bankli09" data-id="0301" data-title="上海交通银行"></li>
              <li class="bankli10" data-id="0102" data-title="中国工商银行"></li>
              <li class="bankli11" data-id="0105" data-title="中国建设银行"></li>
              <li class="bankli12" data-id="0103" data-title="中国农业银行"></li>
              <!--li class="bankli13" data-id="0318" data-title="渤海银行"></li-->
              <!--li class="bankli14" data-id="0313" data-title="上海银行"></li-->
              <li class="bankli15" data-id="0302" data-title="中信银行"></li>
              <li class="bankli16" data-id="0303" data-title="光大银行"></li>
        <!--li class="bankli17" data-title="北京农村商业银行"></li-->             
        <li class="bankli18" data-id="0104" data-title="中国银行"></li>
              <li class="bankli19" data-id="0100" data-title="中国邮政储蓄银行"></li>
        <!--<li class="bankli20" data-title="东亚银行"></li>
              <li class="bankli21" data-title="南京银行"></li>-->             
              <li class="bankli22" data-id="0410" data-title="平安银行"></li>
              <li class="bankli23" data-id="0423" data-title="杭州银行"></li>
              <!--li class="bankli24" data-id="0408" data-title="宁波银行"></li-->
              <li class="bankli25" data-id="0316" data-title="浙商银行"></li>
              <li class="bankli26" data-id="0402" data-title="上海农村商业银行"></li>
            </ul>
            <div class="bankItemList">
              <table data-name="招商银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="4">招商银行</td>    
                    <td class="center" rowspan="2">储蓄卡</td>        
                    <td class="center">大众版</td>    
                    <td class="center">500</td>        
                    <td class="center">5000</td>    
                    <td rowspan="4">95555</td>    
                  </tr>        
                  <tr>            
                    <td class="center">专业版</td>            
                    <td class="center">无限额</td>            
                    <td class="center">无限额</td>        
                  </tr>        
                  <tr>            
                    <td rowspan="2">信用卡</td>            
                    <td class="center">大额信用卡网银支付</td>            
                    <td class="center">信用卡本身透支额度</td>            
                    <td class="center">信用卡本身透支额度</td>        
                  </tr>        
                  <tr>            
                    <td class="center">小额信用卡网银支付</td>            
                    <td class="center">2000</td>            
                    <td class="center">信用卡本身透支额度</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="兴业银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td class="center" rowspan="2">兴业银行</td>    
                    <td rowspan="2" class="center">所有卡</td>        
                    <td class="center">手机动态密码版</td>    
                    <td class="center">日累积范围内无限额</td>        
                    <td class="center">初始5000可至网点加大</td>    
                    <td rowspan="2" class="center">95561</td>    
                  </tr>        
                  <tr>            
                    <td class="center">U盾</td>            
                    <td class="center">100万</td>            
                    <td class="center">100万</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="中国民生银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="4">民生银行</td>    
                    <td class="center" rowspan="4">所有卡</td>        
                    <td class="center">大众版</td>    
                    <td class="center">300</td>        
                    <td class="center">300</td>    
                    <td rowspan="4">95568</td>    
                  </tr>        
                  <tr>            
                    <td class="center">贵宾版</td>            
                    <td class="center">5000</td>            
                    <td class="center">5000</td>        
                  </tr>        
                  <tr>            
                    <td class="center">U宝用户</td>            
                    <td class="center">50万</td>            
                    <td class="center">50万</td>        
                  </tr>        
                  <tr>            
                    <td class="center">信用卡用户</td>            
                    <td class="center">同柜面对外转账限额</td>            
                    <td class="center">同柜面对外转账限额</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="华夏银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td class="center" rowspan="3">华夏银行</td>    
                    <td rowspan="3" class="center">储蓄卡</td>        
                    <td class="center">大众版</td>    
                    <td class="center">300</td>        
                    <td class="center">1000</td>    
                    <td rowspan="3" class="center">95577</td>    
                  </tr>        
                  <tr>            
                    <td class="center">手机动态</td>            
                    <td class="center">1000</td>            
                    <td class="center">5000</td>        
                  </tr>        
                  <tr>            
                    <td class="center">数字证书</td>            
                    <td class="center">50000</td>            
                    <td class="center">10万</td>        
                  </tr>
                </tbody>
              </table>
              <!-- 待修改 -->
              <table data-name="深圳发展银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td class="center" rowspan="3">华夏银行</td>    
                    <td rowspan="3" class="center">储蓄卡</td>        
                    <td class="center">大众版</td>    
                    <td class="center">300</td>        
                    <td class="center">1000</td>    
                    <td rowspan="3" class="center">95577</td>    
                  </tr>        
                  <tr>            
                    <td class="center">手机动态</td>            
                    <td class="center">1000</td>            
                    <td class="center">5000</td>        
                  </tr>        
                  <tr>            
                    <td class="center">数字证书</td>            
                    <td class="center">50000</td>            
                    <td class="center">10万</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="北京银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="4">北京银行</td>    
                    <td class="center" rowspan="3">借记卡</td>        
                    <td class="center">普通版</td>    
                    <td class="center">/</td>        
                    <td class="center">总累计限额为300元</td>    
                    <td rowspan="3">95526</td>        
                  </tr>            
                  <tr>                
                    <td class="center">动态密码版</td>                
                    <td class="center">1000</td>                
                    <td class="center">5000</td>            
                  </tr>            
                  <tr>                
                  
                    <td class="center">证书版</td>                
                    <td class="center">100万</td>                
                    <td class="center">100万</td>            
                  </tr>            
                  <tr>                
                    <td class="center">信用卡</td>                
                    <td class="center">/</td>                
                    <td class="center">无限额</td>                
                    <td class="center">无限额</td>                
                    <td>4006601169</td>            
                  </tr>
                </tbody>
              </table>
              <!-- 待修改 -->
              <table data-name="上海浦东发展银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="2">浦东发展银行</td>    
                    <td class="center" rowspan="2">所有卡</td>        
                    <td class="center">手机动态密码</td>    
                    <td class="center">20万</td>        
                    <td class="center">20万</td>    
                    <td rowspan="2">95528</td>    
                  </tr>        
                  <tr>            
                    <td class="center">数字证书<br>            （浏览器证书或U盾）</td>            
                    <td class="center">无限额，自行设置</td>            
                    <td class="center">无限额，自行设置</td>        
                  </tr>
                </tbody>
              </table>
              <!-- table data-name="广东发展银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="3">广发银行</td>    
                    <td rowspan="3" class="center">所有卡</td>        
                    <td class="center">手机动态密码版</td>    
                    <td class="center">5000</td>        
                    <td class="center">5000</td>    
                    <td rowspan="3">400-830-8003</td>    
                  </tr>        
                  <tr>            
                    <td class="center">key盾</td>            
                    <td class="center">100万</td>            
                    <td class="center">100万</td>        
                  </tr>        
                  <tr>            
                    <td class="center">key令</td>            
                    <td class="center">5万</td>            
                    <td class="center">5万</td>        
                  </tr>
                </tbody>
              </table-->
              <!-- 待修改 -->
              <table data-name="上海交通银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="4">北京银行</td>    
                    <td class="center" rowspan="3">借记卡</td>        
                    <td class="center">普通版</td>    
                    <td class="center">/</td>        
                    <td class="center">总累计限额为300元</td>    
                    <td rowspan="3">95526</td>        
                  </tr>            
                  <tr>                
                    <td class="center">动态密码版</td>                
                    <td class="center">1000</td>                
                    <td class="center">5000</td>            
                  </tr>            
                  <tr>                
                  
                    <td class="center">证书版</td>                
                    <td class="center">100万</td>                
                    <td class="center">100万</td>            
                  </tr>            
                  <tr>                
                    <td class="center">信用卡</td>                
                    <td class="center">/</td>                
                    <td class="center">无限额</td>                
                    <td class="center">无限额</td>                
                    <td>4006601169</td>            
                  </tr>
                </tbody>
              </table>
              <table data-name="中国工商银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>                
                    <td class="center" rowspan="10">工商银行</td>                
                    <td rowspan="4" class="center">储蓄卡</td>                
                    <td class="center">电子口令卡</td>                
                    <td class="center">500</td>                
                    <td class="center">1000</td>                
                    <td rowspan="10">95588</td>            
                  </tr>            
                  <tr>                
                    <td class="center">短信认证</td>                
                    <td class="center">2000</td>                
                    <td class="center">5000</td>            
                  </tr>            
                  <tr>                
                    <td class="center">电子密码</td>                
                    <td class="center">50万</td>                
                    <td class="center">100万</td>            
                  </tr>            
                  <tr>                
                    <td class="center">u盾</td>                
                    <td class="center">100万</td>                
                    <td class="center">100万</td>            
                  </tr>            
                  <tr>                
                    <td rowspan="6" class="center">信用卡</td>                
                    <td class="center">大额信用卡电子口令卡</td>                
                    <td class="center">500</td>                
                    <td class="center">1000</td>            
                  </tr>            
                  <tr>                
                    <td class="center">大额信用卡短信认证</td>                
                    <td class="center">2000</td>                
                    <td class="center">5000</td>            
                  </tr>            
                  <tr>                
                    <td class="center">u盾</td>                
                    <td class="center">信用卡本身透支额度</td>                
                    <td class="center">信用卡本身透支额度</td>            
                  </tr>            
                  <tr>                
                    <td class="center">小额信用卡电子口令</td>                
                    <td class="center">500</td>                
                    <td class="center">1000</td>            
                  </tr>            
                  <tr>                
                    <td class="center">小大额信用卡短信认证</td>                
                    <td class="center">1000</td>                
                    <td class="center">5000</td>            
                  </tr>            
                  <tr>                
                    <td class="center">u盾</td>                
                    <td class="center">1000</td>                
                    <td class="center">信用卡本身透支额度</td>            
                  </tr>
                </tbody>
              </table>
              <table data-name="中国建设银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>            
                    <td class="center" rowspan="8">建设银行</td>            
                    <td class="center" rowspan="4">储蓄卡</td>            
                    <td class="center">账号直接支付</td>            
                    <td class="center">5000</td>            
                    <td class="center">5000</td>            
                    <td rowspan="8">95533</td>        
                  </tr>        
                  <tr>        
                    <td class="center">动态口令</td>    
                    <td class="center">5000</td>        
                    <td class="center">5000</td>    
                  </tr>        
                  <tr>            
                    <td class="center">网银盾1代</td>            
                    <td class="center">5万</td>            
                    <td class="center">10万</td>        
                  </tr>        
                  <tr>        
                    <td class="center">网银盾2代</td>    
                    <td class="center">50万</td>        
                    <td class="center">50万</td>    
                  </tr>        
                  <tr>            
                    <td rowspan="2" class="center">信用卡</td>            
                    <td class="center">账号直接支付</td>            
                    <td class="center">5000</td>            
                    <td class="center">5000</td>        
                  </tr>        
                  <tr>        
                    <td class="center">签约支付</td>    
                    <td class="center">5万</td>        
                    <td class="center">5万</td>    
                  </tr>        
                  <tr>            
                    <td rowspan="2" class="center">准贷记卡</td>            
                    <td class="center">动态口令</td>            
                    <td class="center">5万</td>            
                    <td class="center">5万</td>        
                  </tr>        
                  <tr>        
                    <td class="center">网银盾</td>    
                    <td class="center">50万</td>        
                    <td class="center">50万</td>    
                  </tr>
                </tbody>
              </table>
              <table data-name="中国农业银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>                
                    <td class="center" rowspan="3">中国农业银行</td>                
                    <td class="center" rowspan="3">所有卡</td>                    
                    <td class="center">动态口令</td>                
                    <td class="center">1000</td>                    
                    <td class="center">3000</td>                
                    <td rowspan="3">95599</td>            
                  </tr>                
                  <tr>                    
                    <td class="center">移动证书（一代k宝）</td>                    
                    <td class="center">50万</td>                    
                    <td class="center">100万</td>            
                  </tr>            
                  <tr>               
                    <td class="center">移动证书（二代k宝）</td>                
                    <td class="center">100万</td>                
                    <td class="center">500万</td>            
                  </tr>
                </tbody>
              </table>
              <table data-name="渤海银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                      <td width="13%">渤海银行</td>
                      <td width="13%">借记卡</td>
                      <td width="14%">&nbsp;</td>
                      <td width="14%">2万</td>
                      <td width="9%">10万</td>
                      <td width="12%">4008888811</td>
                    </tr>
                </tbody>
              </table>
              <table data-name="上海银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="4">上海银行</td>    
                    <td class="center" rowspan="2">储蓄卡</td>        
                    <td width="14%">办理E盾证书版个人网银，开通网上支付功能</td>    
                    <td class="center">50万元</td>        
                    <td class="center">100万元</td>    
                    <td rowspan="4">021-962888</td>    
                  </tr>        
                  <tr>            
                    <td width="14%">办理动态密码版个人网银（含文件证书）,开通网上支付功能</td>            
                    <td>6000元</td>            
                    <td>1万元</td>        
                  </tr>        
                  <tr>            
                    <td rowspan="2" class="center">信用卡</td>            
                    <td>办理E盾证书版个人网银，开通网上支付功能</td>            
                    <td>5万元</td>            
                    <td>信用卡本身透支额度</td>        
                  </tr>        
                  <tr>            
                    <td>办理动态密码版个人网银（含文件证书）,开通网上支付功能</td>            
                    <td>6000元</td>            
                    <td>1万元</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="中信银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="4">中信银行</td>    
                    <td rowspan="2">储蓄卡</td>        
                    <td class="center">手机动态密码</td>    
                    <td class="center">1000</td>        
                    <td class="center">5000</td>    
                    <td rowspan="4">95558</td>    
                  </tr>        
                  <tr>            
                    <td>U盾</td>            
                    <td>100万</td>            
                    <td>100万</td>        
                  </tr>        
                  <tr>            
                    <td rowspan="2">信用卡</td>            
                    <td>手机动态密码</td>            
                    <td>500</td>            
                    <td>20次/1万</td>        
                  </tr>
                  <tr>
                    <td>U盾</td>            
                    <td>500</td>            
                    <td>20次/1万</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="光大银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="2">光大银行</td>    
                    <td rowspan="2">所有卡</td>        
                    <td>手机动态密码版</td>        
                    <td>1万</td>        
                    <td>1万</td>    
                    <td rowspan="2">95595</td>    
                  </tr>        
                  <tr>            
                    <td>令牌动态密码及<br>阳光网盾验证方式 </td>            
                    <td>50万 </td>            
                    <td>50万 </td>        
                  </tr>
                </tbody>
              </table>
              <!-- 待修改 -->
              <!-- <table data-name="北京农村商业银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="2">光大银行</td>    
                    <td rowspan="2">所有卡</td>        
                    <td>手机动态密码版</td>        
                    <td>1万</td>        
                    <td>1万</td>    
                    <td rowspan="2">95595</td>    
                  </tr>        
                  <tr>            
                    <td>令牌动态密码及<br>阳光网盾验证方式 </td>            
                    <td>50万 </td>            
                    <td>50万 </td>        
                  </tr>
                </tbody>
              </table> -->
              <table data-name="中国银行">
                <thead>
                  <tr>
                      <th width="15%">银行</th>
		              <th width="18%">开通范围</th>    
		              <th width="18%">客户类型</th>        
		              <th width="18%">单笔限额（元）</th>    
		              <th width="18%">每日限额（元）</th>        
		              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td>中国银行</td>        
                    <td> 储蓄卡<br>        信用卡</td>        
                    <td>USBKey证书认证、<br>        令牌+动态口令</td>        
                    <td>无限额，自行设置</td>        
                    <td>无限额，自行设置</td>        
                    <td>95566</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="中国邮政储蓄银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="3">中国邮政储蓄银行</td>    
                    <td rowspan="3">所有卡</td>        
                    <td>手机短信客户</td>        
                    <td>1万</td>        
                    <td>1万</td>    
                    <td rowspan="3">95580</td>    
                  </tr>        
                  <tr>            
                    <td>电子令牌+短信客户 </td>            
                    <td>20万</td>            
                    <td>20万</td>        
                  </tr>        
                  <tr>            
                    <td>Ukey+短信客户 </td>            
                    <td>200万</td>            
                    <td>200万</td>        
                  </tr>
                </tbody>
              </table>
              <!-- 待修改 -->
              <!-- <table data-name="东亚银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="3">中国邮政储蓄银行</td>    
                    <td rowspan="3">所有卡</td>        
                    <td>手机短信客户</td>        
                    <td>1万</td>        
                    <td>1万</td>    
                    <td rowspan="3">95580</td>    
                  </tr>        
                  <tr>            
                    <td>电子令牌+短信客户 </td>            
                    <td>20万</td>            
                    <td>20万</td>        
                  </tr>        
                  <tr>            
                    <td>Ukey+短信客户 </td>            
                    <td>200万</td>            
                    <td>200万</td>        
                  </tr>
                </tbody>
              </table> -->
              <!-- 待修改 -->
              <!-- <table data-name="南京银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="3">中国邮政储蓄银行</td>    
                    <td rowspan="3">所有卡</td>        
                    <td>手机短信客户</td>        
                    <td>1万</td>        
                    <td>1万</td>    
                    <td rowspan="3">95580</td>    
                  </tr>        
                  <tr>            
                    <td>电子令牌+短信客户 </td>            
                    <td>20万</td>            
                    <td>20万</td>        
                  </tr>        
                  <tr>            
                    <td>Ukey+短信客户 </td>            
                    <td>200万</td>            
                    <td>200万</td>        
                  </tr>
                </tbody>
              </table> -->
              <table data-name="平安银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td class="center" rowspan="4">平安银行</td>    
                    <td rowspan="2" class="center">借记卡</td>        
                    <td class="center">网银普通用户</td>    
                    <td class="center">0</td>        
                    <td class="center">0</td>    
                    <td rowspan="4" class="center">40066-99999</td>    
                  </tr>        
                  <tr>            
                    <td class="center">网银高级用户（手机动态码）</td>            
                    <td class="center">5万</td>            
                    <td class="center">5万</td>        
                  </tr>
                  <tr>     
                    <td rowspan="2" class="center">信用卡</td>         
                    <td class="center">网银普通用户</td>            
                    <td class="center">2000</td>            
                    <td class="center">2000</td>        
                  </tr>
                  <tr>            
                    <td class="center">网银高级用户（手机动态码）</td>            
                    <td class="center">不支持</td>            
                    <td class="center">不支持</td>        
                  </tr>
                </tbody>
              </table>
              <table data-name="杭州银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
              <td rowspan="2">杭州银行</td>
              <td class="center">西湖卡</td>
              <td class="center">证书客户(usbkey版)</td>
              <td class="center">无限额</td>
              <td class="center">无限额</td>
              <td rowspan="2">96523（浙江）、4008888508（全国）</td>
            </tr>
                  <tr>
              <td class="center">信用卡</td>
              <td class="center">证书客户(usbkey版)</td>
              <td class="center">500元</td>
              <td class="center">500元</td>
            </tr>
                </tbody>
              </table>
              <table data-name="宁波银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
              <td rowspan="4">
                宁波银行</td>
              <td class="center" rowspan="4">
                借记卡</td>
              <td class="center">
                电子支付密码</td>
              <td class="center" rowspan="4">
                无限额</td>
              <td class="center">
                300</td>
              <td rowspan="4">
                96528（宁波/杭州/南京/深圳/苏州/温州）<br>
                962528（上海/北京）</td>
            </tr>
            <tr>
              <td class="center">
                动态密码令牌</td>
              <td class="center">
                5万</td>
            </tr>
            <tr>
              <td class="center">
                短信动态密码</td>
              <td class="center">
                5万</td>
            </tr>
            <tr>
              <td class="center">
                USBkey证书</td>
              <td class="center">
                无限额</td>
            </tr>
                </tbody>
              </table>
              <!-- 待修改 -->
              <table data-name="浙商银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td rowspan="2">平安银行</td>    
                    <td rowspan="2" class="center">所有卡</td>        
                    <td class="center">手机动态密码版</td>    
                    <td class="center">200元</td>        
                    <td class="center">1000元</td>        
                    <td rowspan="2">95105665</td>    
                  </tr>
                  <tr>     
                    <td class="center">USBKEY客户</td>    
                    <td class="center">无限额</td>        
                    <td class="center">无限额</td>   
                  </tr>
                </tbody>
              </table>
              <table data-name="上海农村商业银行">
                <thead>
                  <tr>
                    <th width="15%">银行</th>
              <th width="18%">开通范围</th>    
              <th width="18%">客户类型</th>        
              <th width="18%">单笔限额（元）</th>    
              <th width="18%">每日限额（元）</th>        
              <th width="13%">客服热线</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>        
                    <td class="center" rowspan="2">上海农商银行</td>    
                    <td rowspan="2" class="center">储蓄卡</td>        
                    <td class="center">短信专业版</td>    
                    <td class="center">1000</td>        
                    <td class="center">5000</td>    
                    <td rowspan="2" class="center">021-962999</td>    
                  </tr>        
                  <tr>            
                    <td class="center">证书专业版</td>            
                    <td class="center">10000</td>            
                    <td class="center">100万元</td>        
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="payNow">
              <div id="payDivs">
                <a href="#" class="new-orange-btn">立即支付</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/base.js"></script>
<script type="text/javascript">
 $(document).ready(function (){
   var ylPayCheck=false;
   setPay('alipay');
   //选择支付方式
   $('.pay-img').on('click',function(){
     $('.select-img').removeClass('select-img');
     $(this).addClass('select-img');
     if($(this).hasClass('ylpay')){
       $('.bankList').show();
       $('.proxyA').hide();  
     }else{
       $('.bankList,.bankItemList').hide();
       $('.proxyA').show();
       ylPayCheck=false;
     }
   })
   $('.new-orange-btn').on('click',function(){
     if($(this).hasClass('payed')){
       alertLayel('对不起该订单被支付过或已过期');
       return false;
     }
     if($('.bankList').find('.select-bank').length==0){
       alertLayel('请选择支付银行');
       return false;
     }
     if(ylPayCheck==true){
       if($('#fm').find('input').val()==''){
         alertLayel('该银行不能支付');
       }
       ylPayForm.submit();       
       checkPay=setInterval(timing,3000);
     }
   })
   //判断是否支付完成
   var checkPay;
   var paySuccessed=false;
   function timing(){
     if(paySuccessed==true){
       clearInterval(checkPay);
     }else{
       var orderNumber = $('#orderNumber').val();
       $.ajax({
         url: "/u/order/checkOrderPay.html?number="+orderNumber,
         type: "POST",
         dataType:"json",
         cache:false,
         success: function(obj){
          if(obj.code==2){
            paySuccessed=true;
            alertLayel("订单支付成功");
           }
           return;
        }
      })
     }
   }
  $(document).on('click','.proxyA',function(){
    checkPay=setInterval(timing,3000);
  })
   $(document).on('click','.alertBtn',function(){
     if(paySuccessed){
       location.href="/u/order/list.html";
       
     }
   })
   $('.bankList li').on('click',function(){
     $('.select-bank').removeClass('select-bank');
     $(this).addClass('select-bank');
     ylPayCheck=false;
     var bankName=$(this).attr('data-title');
     $('.bankItemList table').each(function(){
       var name=$(this).attr('data-name');
       if(bankName==name){
         $('.bankItemList').show().find('table').hide();
         $(this).show();
         return;
       }
     })
     var bankId=$(this).attr('data-id');
     var orderNumber=$('#orderNumber').val();
     var fee = $('#payMoney').val();
     $.ajax({
         url: "http://www.ibaixiong.com/u/pay/cmbchina/getpaydata.html?orderNumber="+orderNumber+"&thirdBankNo="+bankId+"&fee="+fee,
         type: "POST",
         dataType:"json",
         success: function(data){
           if(data.code!=-1){
             $('#branchid').val(data.branchid);
             $('#MerchantCode').val(data.merchantCode);
             $('#MerchantPara').val(data.merchantPara);
             $('#MerchantURL').val(data.merchantURL);
             //$('#MerchantRetUrl').val(data.merchantRetURL);
             $('#amount').val(data.amount);
             $('#billno').val(data.billno);
             $('#cono').val(data.cono);
             $('#date').val(data.date);
             $('#fm').attr('action',data.payUrl);
             ylPayCheck=true;
           }else{
             $('#branchid').val("");
             $('#MerchantCode').val("");
             $('#MerchantPara').val("");
             $('#MerchantURL').val("");
             //$('#MerchantRetUrl').val("");
             $('#amount').val("");
             $('#billno').val("");
             $('#cono').val("");
             $('#date').val("");
             $('#fm').attr('action',"");
             ylPayCheck=false;
             $('.new-orange-btn').addClass('payed');
           }
         }
     });
   })
 });
 var payType = "";
function setPay(v){
  payType = v;
  var orderNumber = $('#orderNumber').val();
  var fee = $('#payMoney').val();
  //跳支付之前检查该订单是否被支付过
  $.ajax({
       url: "/u/order/checkOrderPay.html?number="+orderNumber,
       type: "POST",
       dataType:"json",
       cache:false,
       success: function(obj){
        if ( !checkCode( obj ) ) {
         if(obj.code==1){
           alertLayel("当前用户下未找到该订单");
            $('.new-orange-btn').addClass('payed');
         }
        if(obj.code==2){
          alertLayel("对不起该订单被支付过或已过期");
          $('.new-orange-btn').addClass('payed');
         }
         return;
        }else{
         if(payType == 'alipay'){
          //跳到支付宝支付
          //alipay(orderNumber,"测试","0.01");
          
          //var WIDshow_url = "http://www.ibaixiong.com/index.jsp?imgUrl=123";
          //var url = "http://www.ibaixiong.com/alipayapi.jsp?WIDout_trade_no="+orderNumber+"&WIDsubject=熊爸爸&WIDtotal_fee="+fee+"&WIDbody=123&WIDshow_url="+WIDshow_url;
          var url = "http://www.ibaixiong.com/u/ali/pay.html?WIDout_trade_no="+orderNumber+"&WIDtotal_fee="+fee;
          //var url = "http://www.ibaixiong.com/alipayapi.jsp?WIDout_trade_no="+orderNumber+"&WIDsubject=熊爸爸&WIDtotal_fee=0.01&WIDbody=123&WIDshow_url="+WIDshow_url;
          clickOpenWin(url, '#payDivs');
        }else if(payType == 'wechart'){
          //跳到微信支付
          //alertLayel("微信支付未开通请持续关注谢谢!");
          //weixinpay(orderNumber,"测试","0.01");
          var url = "http://www.ibaixiong.com/u/weixin/pay.html?order_Number="+orderNumber+"&fee="+fee+"&orderText=papabear";
          //var url = "http://www.ibaixiong.com/u/weixin/pay.html?order_Number="+orderNumber+"&fee=0.01&orderText=熊爸爸";
          
          clickOpenWin(url, '#payDivs');
        }else{
          var url= "javascript:;";
          clickOpenWin(url, '#payDivs');
        }
        }
       }
  });
}
 var clickOpenWin = function(f, self){ 
      var dataKey = "clickOpenWin.dataKey"  
      var me = $(self);  
      var A = me.data(dataKey);
      var returnData = null;  
      var fee = $('#payMoney').val();
        var orderNumber = $('#orderNumber').val();
      if(!A){  
          A = $("<A target='_blank' class='proxyA'>");  
          me.data(dataKey, A); 
          A.click(function(e){  
              if(returnData){  
                //var payType = $('input:radio:checked').val();
                if(payType == 'alipay'){
                  //var WIDshow_url = "http://www.ibaixiong.com/index.jsp?imgUrl=123";
                  //var url = "http://www.ibaixiong.com/alipayapi.jsp?WIDout_trade_no="+orderNumber+"&WIDsubject=熊爸爸&WIDtotal_fee="+fee+"&WIDbody=123&WIDshow_url="+WIDshow_url;
                  var url = "http://www.ibaixiong.com/u/ali/pay.html?WIDout_trade_no="+orderNumber+"&WIDtotal_fee="+fee;
                  //var url = "http://www.ibaixiong.com/alipayapi.jsp?WIDout_trade_no="+orderNumber+"&WIDsubject=熊爸爸&WIDtotal_fee=0.01&WIDbody=123&WIDshow_url="+WIDshow_url;
                  returnData = url;
                }else if(payType == 'wechart'){
                  var url = "http://www.ibaixiong.com/u/weixin/pay.html?order_Number="+orderNumber+"&fee="+fee+"&orderText=papabear";
                  //var url = "http://www.ibaixiong.com/u/weixin/pay.html?order_Number="+orderNumber+"&fee=0.01&orderText=熊爸爸";
                  returnData = url;
                }else{
                  var url="javascript:;";
                  returnData = url;
                }
                  A.attr("href", returnData);  
              }else {  
                  A.before(me);  
                  e.stop();  
              }  
          });  

        $(self).before(A).appendTo(A);
        A.before($(self));
        A.attr("href", "#|");  
          returnData = f;//.apply(this, arguments);
      }  
  }
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>