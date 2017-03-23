<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/27 0027
  Time: 下午 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>个人中心-商品评价</title>
	<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="http://fe.ibaixiong.com/shop/css/common.css" rel="stylesheet" type="text/css">
	<link href="/css/adress.css" rel="stylesheet" type="text/css">
	<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.9.1.min.js" type="text/javascript" ></script>
	<script src="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/area.js"></script>
	<script src="../../js/location.js"></script>
	<script type="text/javascript" src="http://fe.ibaixiong.com/shop/js/common.js"></script>
	<script src="http://fe.ibaixiong.com/shop/js/base.js"></script>
	<script type="text/javascript">
	// 模板
	var _temp = ['<div class="marker" id="marker">',
					'<div class="d-mask"></div>',
				    '<div class="dialogWrap">',
				       ' <div class="dialog">',
				            ' <h2>删除地址<a href="javascript:;" class="close" onclick="hideDialog()"></a></h2>',
				            '<div class="tac"><i class="question-mark"></i></div>',
				            '<p class="question-sure-text">是否确认删除该地址？</p>',
				            '<div class="question-dialog-btn tac">',
								'<a data-btn="ok" class="new-orange-btn" href="javascript:;">确认</a>',
								'<a onclick="hideDialog()" class="cancel" href="javascript:;">取消</a>',
							'</div>',
				        '</div>',
				    '</div>',
				'</div>'].join('');
	// 交互接口
	var settings = {
		// 删除地址接口
		delAddressFn: function(data, fn){
			$.ajax({
		 		   url: "/u/address/remove.html",
		 		   data: data,//参数
		 		   type: "POST",
		 		   dataType:"json",
		 		   cache:false,
		 		   success: function(obj){
		 			  if ( !checkCode( obj ) ) {
		 					return;
		 			  }else{
		 			  	fn(obj); //异步处理成功后回调
		 			  }
		 		   }
		 	});
		},
		//设置默认
		defAddressFn: function(data, fn){
			$.ajax({
		 		   url: "/u/address/setdef.html",
		 		   data: data,//参数
		 		   type: "POST",
		 		   dataType:"json",
		 		   cache:false,
		 		   success: function(obj){
		 			  if ( !checkCode( obj ) ) {
		 					return;
		 			  }else{
		 			  	fn(obj); //异步处理成功后回调
		 			  }
		 		   }
		 	});
		},
		// 编辑地址
		editAddressFn: function(data, fn){
			$.ajax({
		 		   url: "/u/address/update.html",
		 		   data: data,//参数
		 		   type: "POST",
		 		   dataType:"json",
		 		   cache:false,
		 		   success: function(obj){
		 			  if ( !checkCode( obj ) ) {
		 					return;
		 			  }else{
		 			  	fn(1);//异步处理成功后回调
		 			  }
		 		   }
		 	});
		},
		// 添加新地址接口
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
		 			  	fn(1);//异步处理成功后回调
		 			  }
		 		   }
		 	});
		}
	};
	// Ready
	$(document).ready(function() {
		showLocation();
		// 删除
		$('#address-mian').off('click.del').on('click.del', '.address-del', function(){
			var _this = $(this),// 当前按钮
				$parent = _this.closest('.address'),// 父级元素
				_id = _this.attr('data-id'),// 数据Id
				$marker = $("#marker");// 弹窗
			if ($marker.length === 0) {
				$('body').append(_temp);// 插入模板
			}else{
				$marker.show();// 显示弹窗
			}
			_data = {
					"id": _id
			};
			$('a[data-btn="ok"]').off('click').on('click', function(){
				settings.delAddressFn(_data, function(data){
					if (data.code == 0) {
						$("#marker").hide();// 隐藏弹窗
						$parent.hide();// 隐藏删除项
					}else{
						alertLayel("删除失败!");// 错误提示
					}
				});
			});
		});
		// 设置默认
		$('#address-mian').off('click.def').on('click.def', '.address-def', function(){
			var _this = $(this),// 当前按钮
			$parent = _this.closest('.address'),// 父级元素
			_id = _this.attr('data-id'),// 数据Id
			_optype = _this.attr('op_type'),// 数据操作值
			_data = {
					"id": _id,
					"isDefault":_optype
			};
			settings.defAddressFn(_data, function(data){
				if (data.code == 0) {
					window.location.reload();//重载页面
				}else{
					alertLayel("设置失败!");// 错误提示
				}
			});
		});
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
			if (_id == null || _id == undefined || _id == '') {
				settings.addAddressFn(_data, function(d){
					if (1 == d){
						window.location.reload();
					};
				});
			}else{
				settings.editAddressFn(_data, function(d){
					if (1 == d){
						_$parent.find('.adree-name').text(_neme);
						_$parent.find('.adree-tele').text(_phone);
						_$parent.find('.adree-tag').text(_label);
						_$parent.find('span[pro]').attr('pro', _regional1).text(pval);
						_$parent.find('.street').text(_street)
						_$parent.find('span[cit]').attr('cit', _regional2).text(cval);
						//_$parent.find('[data-txt="post"]').val(_postCode)
						_$parent.find('span[tow]').attr('tow', _regional3).text(tval);
						//_$parent.find('[data-txt="label"]').val(_label)
						_$parent.find('.editdiv-box').animate({height: 240, opacity: 'hide'}, 100);
					};
				});
			}
		});
		// 添加地址
		$('#address-mian').off('click.adds').on('click.adds', 'div[data-btn="addres-btn"]', function(){
			var _this = $(this),// 当前按钮
				_$parent = _this.closest('.address');// 父级元素
			_$parent.addClass('address-add').find('.editdiv-box').animate({height: 500, opacity: 'show'}, 200);// 动画显示
			_$parent.siblings('.address').removeClass('address-add').find('.editdiv-box').hide();
		});
	});
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
	</script>
</head>
<body>
	<div class="container clearfix">
		<div class="content">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content-left">
				<jsp:include page="../include/left.jsp"><jsp:param value="address" name="checkLefr" /></jsp:include>
			</div>
			<div class="content-right">
				<div class="right-title clearfix">
					<a>收货地址</a>
				</div>
				<div class="address-mianouter">
					<div id="address-mian" class="address-mian clearfix">
						<c:forEach items="${addressList}" var="address" varStatus="st">
							<div class="address">
								<div class="preview-box">
									<h5><span class="adree-tag">${address.tag }</span></h5>
									<p class="adree-name">${address.userName }</p>
									<p class="adree-tele">${address.mobilePhone }</p>
									<p class="adree-address"><span pro="${address.provinceCode }">${address.provinceName }</span>  <span cit="${address.cityCode }">${address.cityName }</span>   <span tow="${address.districtCode }">${address.districtName }</span> <br><span class="street">${address.detailAddress }</span></p>
									<p class="op">
										<c:if test="${address.isDefault==0}">
											<a class="address-def" data-id="${address.id }" op_type="1" href="javascript:;">设为默认</a>
										</c:if>
										<c:if test="${address.isDefault==1}">
											<span class="address-defed" data-id="${address.id }" op_type="0" href="javascript:;">默认地址</span>
										</c:if>
										<a class="address-edit" data-id="${address.id }" href="javascript:;">编辑</a>
										<a class="address-del" data-id="${address.id }" href="javascript:;">删除</a>
									</p>
								</div>
								<div class="editdiv-box" style="display: none;">
									<h5>修改地址</h5>
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
									<textarea data-txt="adre-txt" placeholder="详细地址" ></textarea>
									<input type="text" maxlength="7" value="${address.zipcode }" data-txt="post" placeholder="邮编">
									<input type="text" data-txt="label" value="${address.tag }" placeholder="标签，列如‘家’，'公司'">
									<a href="javascript:;" data-btn="ok_btn" class="new-orange-btn true">确定</a>
									<a href="javascript:;" class="cancel-edit">取消</a>
								</div>
							</div>
						</c:forEach>
						<div class="address add" data-btn="addres-btn">
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
								<input type="text" maxlength="7" data-txt="post" placeholder="邮编">
								<input type="text" data-txt="label" placeholder="标签，列如‘家’，'公司'">
								<a href="javascript:;" data-btn="ok_btn" class="new-orange-btn true">确定</a>
								<a href="javascript:;" class="cancel-edit">取消</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
