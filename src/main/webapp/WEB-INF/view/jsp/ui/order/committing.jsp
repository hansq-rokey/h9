<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>付款页面</title>
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/pay.css" rel="stylesheet" type="text/css">
    <link href="/css/orderinfo.css" rel="stylesheet" type="text/css">
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
    <script src="http://fe.ibaixiong.com/shop/js/area.js"></script>
    <script src="../../js/location.js"></script>
    <script src="http://fe.ibaixiong.com/shop/js/base.js"></script>
</head>
<body>
<input type="hidden" id="showAddress" value="${showAddress}">
<div class="container clearfix">
    <div class="content">
        <jsp:include page="../include/top.jsp" />
        <div class="wrap">
            <div class="pay-head">
                <ul class="pay-nav clearfix">
                    <li>
                        <img src="http://fe.ibaixiong.com/shop/image/1.png" />
                        <span>我的购物车</span>
                    </li>
                    <li class="on">
                        <img src="http://fe.ibaixiong.com/shop/image/2.png" />
                        <span>填写订单信息</span>
                    </li>
                    <li>
                        <img src="http://fe.ibaixiong.com/shop/image/3.png" />
                        <span>成功提交订单</span>
                    </li>
                </ul>
            </div>
            <div class="orderinfo-main">
            	<form action="/u/order/commit.html" method="post" id="commitForm" onsubmit="return address_check();">
                <div class="info info-address clearfix">
                    <h6>收货地址</h6>
                    <div class="info-right">
                        <div class="history-address" id="history">
                        	<div id="addressListDiv">
	                            <c:forEach items="${addressList}" var="address">
	                           		<h5><label>
	                           		<c:if test="${address.isDefault == 1}">
	                           		<input type="radio" name="addressId" value="${address.id}" checked="checked">
	                           		</c:if>
	                           		<c:if test="${address.isDefault == 0}">
	                           		<input type="radio" name="addressId" value="${address.id}">
	                           		</c:if>
	                           		${address.tag}    ${address.provinceName}${address.cityName}${address.districtName}${address.detailAddress}    ${address.userName}(收)    ${address.mobilePhone}</label></h5>
	                            </c:forEach>
                            </div>
                            <h5><a href="javascript:;" onclick="addAddress(this)">添加新地址</a></h5>
                        </div>
                        <div class="add-address address" id="add">
							<p style="margin-bottom:10px;"><span>收件人</span><input type="text" data-txt="name-txt" placeholder="姓名" /></p>
							<p style="margin-bottom:10px;"><span>手机</span><input type="text" data-txt="hone-txt" maxlength="11" placeholder="手机" /></p>
							<div style="margin-bottom:10px;height:30px;" class="addressSelect clearfix">
								<span>地址</span>
								<div class="addressSelect clearfix">
									<div class="sele prov">
										<em class="txt">省份</em>
										<ul class="loc loc_province"></ul>
									</div>
									<div class="sele city">
										<em class="txt">城市</em>
										<ul class="loc loc_city"></ul>
									</div>
									<div class="sele town" style="margin-right:0">
										<em class="txt">区/县</em>
										<ul class="loc loc_town"></ul>
									</div>
									<input type="hidden" name="location_id" />
								</div>
							</div>
							<p style="margin-bottom:10px;"><span></span><input type="text" data-txt="adre-txt" placeholder="详细地址" value></p>
							<p style="margin-bottom:10px;"><span>邮编</span><input type="text" data-txt="post" placeholder="邮编"></p>
							<p style="margin-bottom:10px;"><span>标签</span><input type="text" data-txt="label" placeholder="标签，列如‘家’，'公司'"></p>
							<a href="javascript:;" class="new-orange-btn save" id="addressAdd">保存</a>
							<a href="javascript:;" class="cancel" onclick="cancel()">取消</a>
						</div>
                    </div>
                </div>
                <div class="info info-address clearfix">
                    <h6>送货时间</h6>
                    <div class="info-right">
                        <div class="time on"  data-id="1">
                            <p class="big">不限时间</p>
                            <p class="small">周一到周日</p>
                            <input type="hidden" name="deliverValue" id="deliverValue" value="1"/>
                        </div>
                        <div class="time"  data-id="2">
                            <p class="big">工作日</p>
                            <p class="small">周一到周五</p>
                        </div>
                        <div class="time"  data-id="3">
                            <p class="big">休息日</p>
                            <p class="small">周六到周日</p>
                        </div>
                    </div>
                </div>
                <div class="info info-address clearfix">
                    <h6>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</h6>
                    <div class="info-right">
                        <textarea id="order.remark" name="remark"></textarea>
                    </div>
                </div>
                <c:if test="${fn:length(depositList)>0}">
	                 <div class="info info-address clearfix">
	                    <h6>定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金</h6>
	                    <div class="info-right">
		                    <c:forEach items="${depositList }" var="item" varStatus="vs">
			                    <div style="margin-top: 5px;">
				                	<input type="checkbox" id="checkbox-1-${vs.count }" name="depositId" value="${item.id }" class="regular-checkbox" /><label for="checkbox-1-${vs.count }"></label>
				                	<span style="font-size: 16px;"><fmt:formatNumber value="${item.frontMoney }" pattern="#.##"/> 元定金</span>
				                </div>
		                    </c:forEach>
	                    </div>
	                </div>
                </c:if>
                <div class="info info-address clearfix">
                    <h6>订单详情</h6>
                    <div class="info-right">
                        <table>
                            <tr>
                                <th width="400">商品</th>
                                <th width="200">单价</th>
                                <th>购买数量</th>
                                <th width="200">总计</th>
                            </tr>
                            <c:forEach items="${carItemList}" var="carItem" varStatus="catItemStatus">
                            <tr>
                                <td>
                                    <c:forEach items="${carItem.pics}" var="productPic" varStatus="status">
	                                    <c:if test="${status.first}">
	                                    	<img  class="prodimg" src="${productPic.url}" />
	                                    </c:if>
                                    </c:forEach>
                                   	<p style="text-indent: 42px">${carItem.carItem.productTitle }</p>
									<p style="text-indent: 42px">${carItem.carItem.productModelFormatName }</p>
									<p style="text-indent: 42px">
									<c:forEach items="${carItem.carItemExtList }" var="item">
										${item.propertyName }: ${item.formatExtValue }
					                </c:forEach>
									</p>
					                <!-- 隐藏域 -->
					                <c:forEach items="${exts }" var="item">
										<c:if test="${item.type==1 }">
											<input name="${item.identify}" value="${item.value }" type="hidden"/>
										</c:if>
					                </c:forEach>
                                </td>
                                <td>
                                	<c:if test="${carItem.format.isExtProperties==0}">
                                		<fmt:formatNumber value="${carItem.format.price}" type="currency" maxFractionDigits="2" minFractionDigits="2" />
                                	</c:if>
                                </td>
                                <td>${carItem.carItem.num}</td>
                                <td class="total"><fmt:formatNumber value="${carItem.carItem.totalPrice}" type="currency" maxFractionDigits="2" minFractionDigits="2" /></td>
                            </tr>
<%--                             <c:if test="${carItem.invitationCodes!=null and fn:length(carItem.invitationCodes)>0 }">
	                            <tr>
		                            <td colspan="4">
						                <!-- 邀请码 -->
						                <div class="codebox">
						                    <h6 style="line-height:47px;margin-top: 15px;">邀请码</h6>
						                    <input type="hidden" name="carItems[${catItemStatus.index }].productModelFormatId" value="${carItem.format.id}" />
						                    <input type="hidden" class="inviteCodes" name="carItems[${catItemStatus.index }].inviteCodeId" value="" />
						                    <div class="codelist">
						                    	<c:forEach items="${carItem.invitationCodes }" var="inviteCode">
						                    		<div class="codeItem" data-id="${inviteCode.id}">
							                        	<p class="code-sum">￥<span><fmt:formatNumber value="${inviteCode.money}"/></span></p>
							                        </div>
						                    	</c:forEach>
						                    </div>
						                </div>
						                <!-- 邀请码结束 -->
						            </td>
					            </tr>
				            </c:if> --%>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div class="info-money">
                    <!-- p class="score"><label><input type="checkbox" value="order." />使用白熊积分</label><span style="display:none">-￥19</span></p> -->
                    <p class="total-money">商品总额：<span><fmt:formatNumber value="${totalMoney }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
                    <p class="coupon">定金：<span>-<fmt:formatNumber value="0" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
                    <%-- <p class="invitecode">邀请码：<span>-<fmt:formatNumber value="${yhPrice }" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p> --%>
                    <p class="pay">应付：<span><fmt:formatNumber value="${totalMoney}" type="currency" maxFractionDigits="2" minFractionDigits="2" /></span></p>
                    <span class="info-money-line"></span>
                    <div class="info-money-btn">
                        <!-- a class="go-continue mr10" href="javascript:void(0)">继续购物</a> -->
                        <a class="new-orange-btn" id="nextBtn" href="javascript:void(0)">下一步</a>
                    </div>
                </div>
                <input type="hidden" value="${totalMoney }" id="total">
                <input type="hidden" name="token" value="${token }" />
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
function address_check(){
	if($('input[name="addressId"]').length==0){
		alertLayel('地址不能为空！');
		return false;
	}
}
    $(document).ready(function() {
    	$(".time").click(function() { 
			$(this).parent().parent().find('.on').removeClass('on');
			$(this).addClass('on');
			$('#deliverValue').val($(this).attr('data-id'));
		});
        showLocation();
        $('.score label').on('click',function(){
            if($(this).find('input').prop('checked')){
                $(this).siblings('span').show();
            }else{
                $(this).siblings('span').hide();
            }
        });
      //选择邀请码
    	$('.codeItem').on('click',function(){
    		if(!$(this).hasClass('code-past')){
	    		$(this).addClass('code-on').siblings().removeClass('code-on');
	    		var ids=[];
	    		$(this).parent().prev('.inviteCodes').val($(this).attr("data-id"));
	    		var num=0,
	    			total=parseInt($('#total').val());
	    		$('.code-on').each(function(){
	    			var num2=parseInt($(this).find('.code-sum').find('span').text().replace(",", ""));
	    			var price=parseInt($(this).parent().parent().parent().prev('tr').find('.total').text());
	    			var id=$(this).attr("data-id");
	    			ids.push(id);
	    			if(num2>price){
	    				num2=price;
	    			}
	    			num+=num2;
	    		})
	    		//console.log(ids);
	    		$('.codeItem').each(function(){
	    			if(!$(this).hasClass('code-on')){
	    				$(this).removeClass('code-past');
	    				var id2=$(this).attr("data-id");
	    				for(i=0;i<ids.length;i++){
	    					if(id2==ids[i]){
		    					$(this).addClass('code-past');
		    				}else{
		    					//$(this).removeClass('code-past');
		    				}
	    				}
	    			}
	    		})
	    		$('.invitecode').find('span').text("-"+num);
	    		if(num>total){
	    			num=total;
	    		}
	    		var pay=total-num;
	    		if(pay<0){
	    			pay=0;
	    		}
	    		$('.pay').find('span').text("￥"+pay);
    		}
    	})
      //设置如果无地址直接写地址，如果有地址直接显示出来
        $("#history").hide();
        $('#add').hide();
        var showAddress = $("#showAddress").val();
        if(showAddress == 1){
        	$("#history").show();
        }
        if(showAddress == 0){
        	$("#add").show();
        }
        if(showAddress == 1){
        	var t = $("input[name='addressId']:checked").val();
        	if(t == undefined){
        		$("input[name='addressId']").eq(0).attr("checked",true);
        	}
        }
    });
    function addAddress() {
        $("#history").hide();
        $('#add').show();

    }
    function cancel(){
        $("#history").show();
        $('#add').hide();

    }
    
    $("#nextBtn").click(function(){
    	$("#commitForm").submit();
    });
    $("#addressAdd").click(function(){
    	var _this = $(this),
		_$parent = _this.closest('.address'),
		_neme = _$parent.find('[data-txt="name-txt"]').val() || '',
		_phone = _$parent.find('[data-txt="hone-txt"]').val() || '',
		_regional1 = _$parent.find('em.txt').eq(0).attr('value') || '',
		_regional2 = _$parent.find('em.txt').eq(1).attr('value') || '',
		_regional3 = _$parent.find('em.txt').eq(2).attr('value') || '',
		pval = _$parent.find('em.txt').eq(0).text() || '',
		cval = _$parent.find('em.txt').eq(1).text() || '',
		tval = _$parent.find('em.txt').eq(2).text() || '',
		_street = _$parent.find('[data-txt="adre-txt"]').val() || '',
		_postCode = _$parent.find('[data-txt="post"]').val() || '',
		_label = _$parent.find('[data-txt="label"]').val() || '',
		_id = _$parent.find('a.address-edit').attr('data-id') || '',
		_data = {
			"id": _id,
			"userName": _neme,
			"mobilePhone": _phone,
			"regional": _regional1 + '-' + _regional2 + '-' + _regional3,
			"regionalName": pval + '-' + cval + '-' + tval,
			"detailAddress": _street,
			"zipcode": _postCode,
			"tag": _label
		};
    	//验证在页面上出现的值都不允许为空
		if(_neme == null || _neme ==undefined || _neme == ''){
			alertLayel("名称不可为空");
			return;
		}
		if(_phone == null || _phone ==undefined || _phone == ''){
			alertLayel("手机不可为空");
			return;
		}
		if (!_phone.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)) {
			alertLayel("手机格式不正确");
			return;
		}
		if(_regional3 == null || _regional3 ==undefined || _regional3 == ''){
			alertLayel("请选择省,市，区");
			return;
		}
		if(_street == null || _street ==undefined || _street == ''){
			alertLayel("详细地址不可为空");
			return;
		}
		if(_postCode == null || _postCode ==undefined || _postCode == ''){
			alertLayel("邮编不可为空");
			return;
		}
		settings.addAddressFn(_data, function(d){
			//追加刚添加的地址到地址列表DIV中
			var address =_label   + pval  + cval  + tval+_street + _neme +"(收)    " + _phone; 
			var html = "<h5><label><input type='radio' name='addressId' checked='checked' value='"+d+"'>"+address+"</label></h5>";
			$("#addressListDiv").append(html);
			$("#history").show();
	        $('#add').hide();
		});
    });
    var settings = {// 添加新地址接口
   		addAddressFn: function(data, fn){
   			$.ajax({
   		 		   url: "/u/address/add.html",
   		 		   data: data,//参数
   		 		   type: "POST",
   		 		   dataType:"json",
   		 		   cache:false,
   		 		   success: function(obj){
   		 			  if ( !checkCode( obj ) ) {
   		 					return;
   		 			  }else{
   		 			  	fn(obj.result.id);//异步处理成功后回调
   		 			  }
   		 		   }
   		 	});
   		}
    };
</script>
</html>
