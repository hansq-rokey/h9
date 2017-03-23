<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>支付成功</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/pay.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/adress.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/paysucc.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/area.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/location.js"></script>
	<script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp" />
			<div class="wrap">
				<h3 class="title_mo">发热墙纸定金<b><fmt:formatNumber value="${money }" maxFractionDigits="2" minFractionDigits="2"/></b></h3>
				<div class="box-a">
                  <div class="boxa-list boxa-lista">
                  	<i class="lista-i"></i>
                  	<div class="wrap_a">
                  		<h3>注意事项请</h3>
                  		<ul>
                  			<li>缴纳定金后，熊爸爸将安排专业人员上门实地测量，设计方案，精准报价。请保持联系方式畅通；</li>
                  			<li>定金在最终客户选择购买产品时，可以全额抵现使用；</li>
                  			<li>如果客户最终放弃购买产品，熊爸爸将定金全额退还，客户进入<br>后台订单中心操作自助退款；</li>
                  		</ul>
                  	</div>
                  </div>
                  <div class="boxa-list boxa-listb">
                  
                  	<h3>预约测量信息：</h3>
                  	<div class="wrap_xx">
                  		<div class="wrap_inputa">
                  		 <div class="wrap_aa">
                  		 	<span>姓名</span>
                  		 	<input type="text" name="u_s" id="u_s">
                  		 </div>
                  		</div>
                  		<div class="wrap_inputb">
                  			<div class="wrap_aa">
                  		 	<span>电话</span>
                  		 	<input type="text" name="u_m" id="u_m">
                  		 </div>
                  		</div>
                  	</div>
                  	<div class="wrap_xx">
                  		<div class="wrap_inputa">
                  		  <div class="addressSelect clearfix">
            							<div class="sele prov">
            								<em class="txt" id="province_id">省份</em>
                             <input type="hidden"  name="x_province" />
            								<ul class="loc loc_province"></ul>
            							</div>
            							<div class="sele city">
            								<em class="txt" id="city_id">城市</em>
                            <input type="hidden" name="x_city" /> 
            								<ul class="loc loc_city"></ul>
                           
            							</div>
            							<div class="sele town">
            								<em class="txt" id="county_id">区/县</em>
                            <input type="hidden" name="x_town" />
            								<ul class="loc loc_town"></ul>                          
            							</div>
						            </div>
                  		</div>
                  		<div class="wrap_inputb">
                  		  <div class="wrap_aa" style="margin-top:35px;">
                  		 	<span>详细地址</span>
                  		 	<input type="text" name="" id="u_d">
                  		 </div>
                  		</div>
                  	</div>
                  	<div class="pay_a">
                  		<a href="###" class="pay_color" id="payb" data-pay="1"><img src="http://fe.ibaixiong.com/shop/image/alipay.png"></a>
                  		<a href="###" id="payc" data-pay="2"><img src="http://fe.ibaixiong.com/shop/image/wechart.png"></a>
                  		<a href="###" id="paya" class="pay_bk" style="display:none"><img src="http://fe.ibaixiong.com/shop/image/cmbchinapay.png"></a>
                  	</div>
                  	<div class="pay_bank">
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
	                 </div>    
	                 <input type="hidden" value="${productId }" id="productId" />
	                 <input type="hidden" value="1" id="x_paya" />
                	<div class="pay_b">
                     <input type="button" id="u_pay" value="立即支付">
                	</div>
                  </div>
				</div>
			</div>	
		</div>
	</div>
  <div class="alertpop" style="display:none">
     <div class="popbg"></div>
     <div class="alertLayel">
      <h3 style="height:30px;position:relative;">
        <i class="closeicon" style="margin-right:12px;margin-top:0;"></i> 
      </h3>
      <p class="alertContent">请选择支付银行</p>
      <div class="row tc">
        <input type="button" value="确定" class="alertBtn">
      </div>
    </div>
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript">
	$(function(){
		showLocation();
	})
 $(document).on('focus', '#u_s,#u_m,#u_d', function() {
 	$(this).prev("span").css({bottom: '25px',color: '#2CA3E5'});
 	$(this).css("border-bottom","1px solid #2CA3E5");
 });
 $(document).on('blur', '#u_s,#u_d', function() {
 	var _htmlc=$(this).val();
 	/*console.log(_htmlc);*/
    if (_htmlc=="") {
        $(this).prev("span").css({bottom: '5px',color: '#8c98a6'});
        $(this).css("border-bottom","1px solid #f00");
    }else{
          $(this).prev("span").css({bottom: '25px',color: '#2CA3E5'});
          $(this).css("border-bottom","1px solid #2CA3E5");
    }
 });
 $(document).on('click', '#paya', function() {
   $(".bankList").css('display', 'block');
 });
  /*银行选择*/
  $(document).on('click', '.bankList>li', function() {
   var indexs=$(this).data("title");
   $(".bankItemList>table").hide();
   $(".bankItemList>table[data-name='"+indexs+"']").show();
  });
  
//选中
  $(".pay_a>a").on('click', function() {
    $(this).addClass('pay_color').siblings().removeClass('pay_color');
    var x_content=$(this).data("pay");
    $("#x_paya").val(x_content);
    if ($(this).hasClass('pay_bk')) {
        $(".pay_bank").show();
      }else{
    	$(".pay_bank").hide(); 
      }
  });
//银行选中效果
 $(".bankList>li").on('click', function() {
    $(this).addClass('pay_color').siblings().removeClass('pay_color');
  });
//提交
$("#u_pay").on('click', function(event) {
  var name=$("#u_s").val();
  var u_m=$("#u_m").val();
  var u_d=$("#u_d").val();
  var provinceId=$("#province_id").attr("value");
  var cityId=$("#city_id").attr("value");
  var countyId=$("#county_id").attr("value");
  var provinceVal=$("input[name='x_province']").val();
  var cityIVal=$("input[name='x_city']").val();
  var countyVal=$("input[name='x_town']").val();
  var productId=$('#productId').val();
  var pay_a=$('#x_paya').val();
  var pay_b;
  /* console.log(pay_a); */
  if(pay_a==1){
	 pay_b="alipay";
  }else{
	 pay_b="weixinpay";
  }
  console.log(pay_b);
  var data={
		"provinceId":provinceId,
		"provinceName":provinceVal,
		"cityId":cityId,
		"cityName":cityIVal,
		"countyId":countyId,
		"countyName":countyVal,
		"address":u_d,
		"name":name,
		"tel":u_m,
		"payType":pay_b,
		"productId":productId
  };
  console.dir(data);
  if (name==''||u_m==''||u_d=='') {
    return false;
  }
  $.ajax({
    url: '/u/deposit/add.html',
    type: 'post',
    dataType: 'json',
    data: data,
    success:function(data){
    	console.dir(data);
      if (data.success) {
        $("#u_s").val('');
        $("#u_m").val('');
        $("#u_d").val('');
        window.location.href=data.result.url;
      }else{
        alert('出错啦！');
      }
    }
  })


//地区验证
/* $(document).on('click', '#province_id,#city_id,#county_id', function() {
    if (!($(this).val()=="")) {
      alert(请选择地区);
    }
 }); */
});
/*验证电话号码*/
function CheckStr(str){
     var myReg =/^1[34578]\d{9}$/;
     if(myReg.test(str)) {
       return true;
     }else{ 
         $("#u_m").val(" ");
         $("#u_m").css("border-bottom","1px solid  #f00");
		 return false;
     }
   } 
 //电话验证
  $(document).on('blur', '#u_m', function() {
       var x_mian=$(this).val();
       CheckStr(x_mian)
    });  
</script>
</body>
</html>
