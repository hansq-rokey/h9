<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>个人中心-申请售后服务</title>
    <link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
    <link href="http://fe.ibaixiong.com/shop/css/adress.css" rel="stylesheet" type="text/css">
    <link href="/css/sale-service.css" rel="stylesheet" type="text/css">
    <script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
    <script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
    <script src="http://fe.ibaixiong.com/shop/js/area.js"></script>
    <script src="http://fe.ibaixiong.com/shop/js/location.js"></script>
    <script>
 // 匿名函数
    $(function(){

    	// 文本框只能输入数字
    	var $numTxtBox = $('input[data-txt="number"]');// 锁键状态
    	$numTxtBox.keydown(function(e){// 绑定事件
    		var oEvent = e || window.event;// 兼容处理
    		if(!(oEvent.keyCode==46)&&!(oEvent.keyCode==8)&&!(oEvent.keyCode==9)&&!(oEvent.keyCode==37)&&!(oEvent.keyCode==39))// 键值
    		if(!((oEvent.keyCode>=48&&oEvent.keyCode<=57)||(oEvent.keyCode>=96&&oEvent.keyCode<=105))) // 键值
    			return false;
    		//oEvent.returnValue = false; // firefox 兼容问题
    	});
    	// 处理函数
    	$('.numbtn').on('click',function(){
    		var $txtBox = $(this).siblings('input[data-txt="number"]'),// 输入框
			max = parseInt($txtBox.attr('data-max'));// 允许最大值
		var _num = parseInt($txtBox.val());// 计算
		// 是加是减
		if ($(this).hasClass('minusbtn')) {
			if(_num>1){
				_num-= 1;// 计算
				$txtBox.val(_num);// 设置数
			};
		}else{
				if(_num<max){
					_num=_num+1;
		        	$txtBox.val(_num);// 设置数
		        }
			};
    	});
    	$(".number").on("change onpropertychange",function(){
    	 	var max=$(".number").attr("data-max");
    	 	var thisvalue=$(this).val();
    	 	if(thisvalue > max){
    	 		$(this).val(max);
    	 	}
    	});
    });
    </script>
</head>
<body>
<div class="container">
    <div class="content">
        <jsp:include page="../../include/top.jsp"></jsp:include>
        <div class="clearfix">
            <div class="content-left">
                <jsp:include page="../../include/left.jsp"><jsp:param value="order" name="checkLefr" /></jsp:include>
            </div>
            <div class="content-right">
                <div class="right-title clearfix">
                    <a>申请售后服务</a>
                </div>
                <div class="row">
                    <p>请选择所需服务，信息提交后我们会尽快安排客服人员与您联系！产品在七天之内可<a href="/u/service/back.html?number=${order.orderNumber }" class="link">申请退货</a> </p>
                </div>
                <div class="row linkbox" style="display: none;">
                    <a href="#" class="servicelink select">维修</a>
                    <a href="#" class="exchangelink">换货</a>
                </div>
               
                <form action="/u/service/commit.html" method="post" id="submit_form">
                <input type="hidden" id="serviceType" name="serviceType" value="2"/>
                <div class="servicebox">
                    <div class="row">
                        <p class="servicetext none">请选择维修产品<span class="light">保修期内质量问题免费维修，保修期外有偿维修</span></p>                        
                        <p class="exchangetext">请选择换货商品<span class="light" ${isAfter? '':'style="color: red;"' }>收到商品15天内免费换货</span></p>
                    </div>
                    <div class="row">
                        <table class="prodtable">
                       	<c:forEach items="${orderItems }" varStatus="statusItem" var="orderItem">
                       		<tr>
                                <td>
                                    <div class="">
                                        <input type="checkbox" checked="checked" isCheck="true" class="checked" name="items[${statusItem.index}].id" class="" value="${orderItem.id }">
                                        <c:forEach items="${orderItem.pics }" var="pic" varStatus="statusPic">
											<c:if test="${statusPic.index==0 }"><img src="${pic.url }" /></c:if>
										</c:forEach>
                                        <div class="inforlist">
                                            <h4>${orderItem.productTitle}</h4>
                                            <div><span class="attr">${orderItem.productModelFormatName}</span></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
									<div class="change">
										<span class="minusbtn numbtn"></span>
										<input type="text" name="items[${statusItem.index}].num" data-txt="number" data-max="${orderItem.num }" class="number" value="1"/>
										<span class="plusbtn numbtn"></span>
										
									</div>
                                </td>
	                            <td class="tc" width="110">${isAfter?'可换货':'不可换货' }</td>
                            </tr>
                       	</c:forEach>
                        </table>
                    </div>
                    <c:if test="${isAfter }">
                    <div class="row">
                        <p>问题描述</p>
                        <textarea name="description" class="problem"></textarea>
                    </div>
                    <div class="row">
                        <p class="servicetext none">收货地址<span class="light">维修后的商品将送到该地址</span></p>
                        <p class="exchangetext">收货地址<span class="light">新商品将送到该地址</span></p>
                        <div class="address-mianouter">
                            <div id="address-mian" class="address-mian clearfix">
                                <div class="address">
                                    <div class="preview-box">
                                        <!-- h5>白熊科技有限公司1</h5> -->
                                        <p class="adree-name addressp">${receiver.reveiveUserName}</p>
                                        <p class="adree-tele addressp">${receiver.mobilePhone }</p>
                                        <p class="adree-address addressp"><span class="address-city"><span pro="${receiver.provinceCode }">${receiver.provinceName }</span>  <span cit="${receiver.cityCode}">${receiver.cityName }</span>   <span tow="${receiver.districtCode }">${receiver.districtName }</span></span> <br><span class="street">${receiver.detailAddress }</span></p>
                                        <p class="op addressp"><a class="address-edit" data-id="01" href="javascript:;">编辑</a></p>
                                    </div>
                                    <div class="editdiv-box" style="display: none;">
                                        <h5>添加地址</h5>
                                        <input type="text" data-txt="name-txt" placeholder="姓名" />
                                        <input type="text" data-txt="hone-txt" maxlength="11" placeholder="手机" />
                                        <div class="addressSelect clearfix">
                                            <div class="sele prov">
                                                <em class="txt">省份</em>
                                                <ul class="loc loc_province"></ul>
                                            </div>
                                            <div class="sele city">
                                                <em class="txt">城市</em>
                                                <ul class="loc loc_city"></ul>
                                            </div>
                                            <div class="sele town">
                                                <em class="txt">区/县</em>
                                                <ul class="loc loc_town"></ul>
                                            </div>
                                            <input type="hidden" name="location_id" />
                                        </div>
                                        <textarea data-txt="adre-txt" placeholder="详细地址"></textarea>
                                        <input type="text" maxlength="7" data-txt="post" value="${receiver.zipcode }" placeholder="邮编">
                                        <input type="hidden" id="userName" value="${receiver.reveiveUserName}" name="userName" />
                                        <input type="hidden" name="orderNumber" value="${order.orderNumber }"/>
                                        <input type="hidden" id="mobilePhone" value="${receiver.mobilePhone }" name="mobilePhone" />
                                        <input type="hidden" id="regional" value="${receiver.provinceCode }-${receiver.cityCode }-${receiver.districtCode }" name="regional" />
                                        <input type="hidden" id="regionalName" value="${receiver.provinceName }-${receiver.cityName }-${receiver.districtName }" name="regionalName" />
                                        <input type="hidden" id="detailAddress" value="${receiver.detailAddress }" name="detailAddress" />
                                        <input type="hidden" id="zipcode" value="${receiver.zipcode }" name="zipcode" />
                                        <input type="text" data-txt="label" placeholder="标签，列如‘家’，'公司'">
                                        <a href="javascript:;" data-btn="ok_btn" class="new-orange-btn true">确定</a>
                                        <a href="javascript:;" class="cancel-edit">取消</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <input type="checkbox" checked="checked" isCheck="true" class="agreebtn">我已阅读并同意<span class="hoverlink">《售后政策》</span>
                            </div>
                            <div class="row">
                                <a class="submit_form" href="###">立即提交</a>
                            </div>
                        </div>
                    </div>
                	</c:if>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	$(".submit_form").on("click",function(){
		var mun=$('.prodtable input[type="checkbox"]');
		var a=0;//计数器
		mun.each(function(i,item){
		 if($(this).attr("isCheck")=="true"){//判断是否选中
			 a++;
		 }
		});
		if(a == 0){
			alertLayel("产品不能为空！");
			return ;
		}
		if($('.number').val()==''||$('.number').val()=='0'){
			alertLayel("产品数量不能为空！");
			return ;
		}
		if($(".problem").val() == ''){
			alertLayel("退货理由不能为空！");
			return ;
		}
		if($('.address').length==0){
			alertLayel('地址不能为空!');
			return false;
		}
		if($('.agreebtn').attr('isCheck')!='true'){
			alertLayel("请接受售后政策！");
			return ;
		}
		$("#submit_form").submit();
	})
})
	$('input[type=checkbox]').on('click',function(){
		$(this).each(function(){
			if($(this).attr('isCheck')=='true'){
				$(this).removeAttr("isCheck")
			}else{
				$(this).attr('isCheck',true);
			}
		})
	})
	
    //换货维修切换
    $('.exchangelink').on('click',function(){
        $('.select').removeClass('select');
        $(this).addClass('select');
        $('.exchangetext').show();
        $('.servicetext').hide();
        $('#serviceType').val(2);
    });
    $('.servicelink').on('click',function(){
        $('.select').removeClass('select');
        $(this).addClass('select');
        $('.servicetext').show();
        $('.exchangetext').hide();
        $('#serviceType').val(3);
    });
	// Ready
	$(document).ready(function() {
		showLocation();
		// 编辑
		$('#address-mian').off('click.edit').on('click.edit', '.address-edit', function(){
			var _this = $(this),// 当前按钮
				_id = _this.attr('data-id'),// 数据Id
				_$parent = _this.closest('.address'),// 父级元素
				adreeName = _$parent.find('.adree-name').text(),// 名称
				pro = _$parent.find('span[pro]').attr('pro'),//
				cit = _$parent.find('span[cit]').attr('cit'),//
				tow = _$parent.find('span[tow]').attr('tow'),//
				adreeTele = _$parent.find('.adree-tele').text(),//电话
				street = _$parent.find('.street').text();// 详细
			_$parent.find('[value="'+ pro +'"]').trigger('click');// 模拟触发
			_$parent.find('[data-txt="name-txt"]').val(adreeName);// 姓名
			_$parent.find('[value="'+ cit +'"]').trigger('click');// 模拟触发
			_$parent.find('[data-txt="hone-txt"]').val(adreeTele);// 电话
			_$parent.find('[value="'+ tow +'"]').trigger('click');// 模拟触发
			_$parent.find('[data-txt="adre-txt"]').val(street);// 地址
			_$parent.addClass('address-add');// 添加标记
			_$parent.find('.editdiv-box').animate({height: 500, opacity: 'show'}, 200);// 动画显示
			_$parent.siblings('.address').removeClass('address-add').find('.editdiv-box').hide();
		});
		// 取消编辑
		$('#address-mian').off('click.qedit').on('click.qedit', '.cancel-edit', function(){
			var _this = $(this),
				_$parent = _this.closest('.address');
			_$parent.removeClass('address-add').find('.editdiv-box').animate({height: 240, opacity: 'hide'}, 100);// 动画显示
			return false;
		});
		// 提交编辑
		$('#address-mian').off('click.submit').on('click.submit', 'a[data-btn="ok_btn"]', function(){
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
					//"id": _id,
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
			$("#userName").val(_neme);
			$('.adree-name').text(_neme);
			$("#mobilePhone").val(_phone);
			$(".adree-tele").text(_phone);
			$("#regional").val( _regional1 + '-' + _regional2 + '-' + _regional3);
			$(".address-city").text(pval + '-' + cval + '-' + tval);
			$("#regionalName").val(pval + '-' + cval + '-' + tval);
			$("#detailAddress").val(_street);
			$('.street').text(_street);
			$("#zipcode").val(_postCode);
			_$parent.find('.editdiv-box').animate({height: 240, opacity: 'hide'}, 100);
			
		});
	});
	$(document).on("click",".alertBtn,.closeicon",function(){
		$(".alertpop").fadeOut(200);
	})
	// 文本框只能输入数字// 数字锁键
		var $numTxtBox = $('input[data-txt="hone-txt"], input[data-txt="post"]');// 锁键状态
		$numTxtBox.keydown(function(e){// 绑定事件
			var oEvent = e || window.event;// 兼容处理
			if(!(oEvent.keyCode==46)&&!(oEvent.keyCode==8)&&!(oEvent.keyCode==9)&&!(oEvent.keyCode==37)&&!(oEvent.keyCode==39))// 键值
			if(!((oEvent.keyCode>=48&&oEvent.keyCode<=57)||(oEvent.keyCode>=96&&oEvent.keyCode<=105))) // 键值
				return false;
			//oEvent.returnValue = false; // firefox 兼容问题
		});
	function hideDialog(){
		$("#marker").hide();
	};
	function alertLayel(e){
		var html='<div class="alertpop" style="display: block;position: fixed;width: 100%;height:100%;top:0;left:0;z-index: 9999;"><div class="popbg" style="    width: 100%;height:100%;position: absolute;top:0;left:0;z-index: 989;background: #000;opacity: 0.5;"></div><div class="alertLayel" style="width:400px;height:200px;padding-top:10px;background:#fff;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;z-index:9999;"><h3 style="height:30px;position:relative;"><i class="closeicon" style="margin-right:12px;margin-top:0;"></i> </h3><p class="alertContent" style="line-height:30px;font-size:14px;text-align:center;height:100px;">'+e+'</p><div class="row tc"><input type="button" value="确定" class="alertBtn" style="height:30px;border:none;width:80px;background:#ff6200;color:#fff;"></div></div></div>';
		$("body").append(html);
	}
</script>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>
