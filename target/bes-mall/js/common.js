// 匿名函数
$(function(){
	var txtBox = null;// 数值文本框
	// 规格选择 添加和减少数量   商品列表减少数量
	$(document).on('click', '[data-btn="minus"]', function(){// 事件绑定 减
		var _this = $(this);//当前点击对象
		OperationFn(_this, 0);// 处理减的方法
	});
	// ++商品列表增加数量
	$(document).on('click', '[data-btn="add"]', function(){// 事件绑定 加
		var _this = $(this);//当前点击对象
		OperationFn(_this, 1);// 处理加的方法
	});
	
	// 文本框只能输入数字
	var $numTxtBox = $('input[data-txt="num"]');// 锁键状态
	$numTxtBox.keydown(function(e){// 绑定事件
		var oEvent = e || window.event;// 兼容处理
		if(!(oEvent.keyCode==46)&&!(oEvent.keyCode==8)&&!(oEvent.keyCode==9)&&!(oEvent.keyCode==37)&&!(oEvent.keyCode==39))// 键值
		if(!((oEvent.keyCode>=48&&oEvent.keyCode<=57)||(oEvent.keyCode>=96&&oEvent.keyCode<=105))) // 键值
			return false;
		//oEvent.returnValue = false; // firefox 兼容问题
	});
	// 个人中心导航
	$contentLeft = $('.content-left'),// 左侧Dom
	$li = $contentLeft.find('li');// 导航项
	$contentLeft.append('<div class="line"></div>');// 插入标记
	$li.off('mouseover.overli mouseout.outli').on('mouseover.overli mouseout.outli', function(event){// 事件绑定
		var _this = $(this);//当前对象
		if(event.type == "mouseover"){// mouseover 事件
			var _top = _this.position().top;// 取对应top值
			//鼠标悬浮
			$contentLeft.find('.line').stop().animate({'top': _top}, 100);// 跟随滑动
		}else if(event.type == "mouseout"){// mouseout 事件
			var _top = $contentLeft.find('li.on').position().top;// 获取当前选中top值
			//鼠标离开还原
			$contentLeft.find('.line').stop().animate({'top': _top}, 200);// 离开滑动还原
		};
	}).trigger('mouseout');// 初始化
	// 物流弹窗
	var showlogisticsFn = function(data, number){
		var _listHTML= '';
		for (var i = 0; i < data.length; i++) {
			if (1 == data[i].sign) {
				_listHTML += '<li class="now"><p>'+ data[i].content +'</p><p class="time"> '+ data[i].time +'</p></li>';
			}else{
				_listHTML += '<li><p>'+ data[i].content +'</p><p class="time"> '+ data[i].time +'</p></li>';
			}
		};
		var _tempHTML = ['<div class="logistics">',
						'<span class="arrow"></span>',
						'<h5>申通快递  快递单号：'+ number +'</h5>',
						'<ul class="logistics-list">'+ _listHTML +'</ul>',
					'</div>'].join('');
		$('div[data-number="'+ number +'"]').append(_tempHTML);

	};
	// 查看物流
	var timedtl = null;// 
	/*$(document).off('mouseover.overdetai mouseout.outdetai').on('mouseover.overdetai mouseout.outdetai','div[data-number]', function(event){// 事件绑定
		var _this = $(this);
		if(event.type == "mouseover"){// mouseover 事件
			var number = _this.attr('data-number');
			if (_this.find('.logistics').length != 0) {
				_this.find('.logistics').show();// 显示
			}else{
				timedtl = setTimeout(function(){
					//_this.find('.logistics').show();// 显示
					settings.getLogistics(number, showlogisticsFn);
				}, 500);
			};
		}else if(event.type == "mouseout"){
			if (null != timedtl) {				
				clearTimeout(timedtl);
			}
			_this.find('.logistics').hide();// 隐藏
		};
	});*/
	/*$('div[data-number]').hover(function(){
		var _this = $(this);
		var number = _this.attr('data-number');
			if (_this.find('.logistics').length != 0) {
				_this.find('.logistics').show();// 显示
			}else{
				timedtl = setTimeout(function(){
					//_this.find('.logistics').show();// 显示
					settings.getLogistics(number, showlogisticsFn);
				}, 500);
			};
	},function(){
		var _this = $(this);
		if (null != timedtl) {				
				clearTimeout(timedtl);
			}
			_this.find('.logistics').hide();// 隐藏
	});*/
	// 处理函数
	var OperationFn = function(_this, type){
		var $txtBox = _this.siblings('input[data-txt="num"]'),// 输入框
			max = parseInt($txtBox.attr('data-max')),// 允许最大值
			min = parseInt($txtBox.attr('data-min')),// 允许最小值 默认 1
			price = $txtBox.attr('data-price'),// 单价  文本框的值
			statusValue=_this.attr('data-select'),//
		    thisExt=parseInt($(".plus").data("ext")),
		    formatId=_this.data("format-id");//产品ID
		var stock=false;
		var id=_this.attr("data-id");
		var _num = parseInt($txtBox.val());// 计算
		// 是加是减
			if (type === 0 ) {
				if(parseInt($txtBox.val())>1){
					_num=_num-1;// 计算
					$.ajax({
						url: "/u/car/update.html",
						data:{carId:id,num:_num},
						dataType:"json",
						success: function(data){
						if(!data.success){
				        	_this.parent().parent().find('.stockbox').show();//数据提交不成功
				        }else{//数据提交成功
				        	_this.parent().parent().find('.stockbox').hide();
				        	_this.parents(".operate-box"). siblings(".protuct-sale").children("span").text('￥'+data.result.toFixed(2));
				        	var stocked=true;
				    		$('.stockbox').each(function(){
				    			if($(this).css('display')=='block'){
				    				stocked=false;
				    			}
				    		})
				    		if(stocked==true){
				    			$('.continue-shopping-btns').find('.new-orange-btn').removeClass('ashen');
				    		}
				          }
				        }
		             });
					$txtBox.val(_num);// 设置数			
				}
			}else if(type === 1){
					_num=_num+1;
					$.ajax({
						url: "/u/car/update.html",
						data:{carId:id,num:_num},
						dataType:"json",
						success: function(data){
						if(!data.success){
				        	_this.parent().parent().find('.stockbox').show().fadeOut(1000);
				        	//$txtBox.val(_num);// 设置数
				        }else{
				        	_this.parent().parent().find('.stockbox').hide();
				        	$txtBox.val(_num);// 设置数
				        	_this.parents(".operate-box"). siblings(".protuct-sale").children("span").text('￥'+data.result.toFixed(2));
				        }
				     }
				});
			}
	};
		$('input[data-txt="num"]').bind('input propertychange', function() {
		var _this = $(this);//当前点击对象
		var thisarae=_this.val();
		var formatId=_this.prev("a").data('format-id');//获取当前dormatId
		var thisExt=_this.prev("a").data('ext')//获取当前ext
		/*console.log(formatId+":"+thisExt+":"+thisarae)*/
		//var $txtBox = _this.siblings('input[data-txt="num"]'),// 输入框
		if($(this).attr('data-type')=='1'){//data-type判断订单页 还是订单列表页
			var price = $('.price').attr('data-value');// 单价
		}
		if($(this).attr('data-type')=='2'){
			var price = $(this).attr('data-price');// 单价
		}
		if($(this).val()==''){
			$(this).val(1);
		}if(parseFloat(thisarae)>100000){
		  var errhtml='<div class="alertpop" style="display: block;position: fixed;width: 100%;height:100%;top:0;left:0;z-index: 9999;"><div class="popbg" style="    width: 100%;height:100%;position: absolute;top:0;left:0;z-index: 989;background: #000;opacity: 0.5;"></div><div class="alertLayel" style="width:400px;height:200px;padding-top:10px;background:#fff;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;z-index:9999;"><h3 style="height:30px;position:relative;"><i class="closeicon" style="margin-right:12px;margin-top:0;"></i> </h3><p class="alertContent" style="line-height:30px;font-size:14px;text-align:center;height:100px;">亲 商品已经超出了范围</p><div class="row tc"><input type="submit" value="确定" class="submitSure" style="height:30px;border:none;width:80px;background:#ff6200;color:#fff;margin-right:20px;"></div></div></div>';
			$("body").append(errhtml);
			$(this).blur();
		}else{
			var _num=parseFloat($(this).val());
			var id=$(this).attr("data-id");//获取当前产品id
			if(_num){
				$.ajax({ url: "/u/car/update.html", async: false, data: "carId="+id+"&num="+_num,dataType:"json", success: function(data){
					if(!data.success){
			        	_this.parent().parent().find('.stockbox').show();
						$('.continue-shopping-btns').find('.new-orange-btn').addClass('ashen');
						/*CalculatePriceFn(_this, price, _num);*/
						stock=false;
			        }else{
			        	_this.parent().next('.stockbox').hide();
			        	$('.continue-shopping-btns').find('.new-orange-btn').removeClass('ashen');
			        	_this.parents(".operate-box"). siblings(".protuct-sale").children("span").text('￥'+data.result.toFixed(2));			        	
			        	stock=true;
			        }
			      }});
				$(this).val(_num);
			}else{
				$(this).val(1);
			}
			
			$('.buyprice').text('￥'+(_num*price).toFixed(2))
		}
	})
	var OperateionNum=function(_this,num,stock){
		var id=_this.attr("data-id");
		$.ajax({ url: "/u/car/update.html", data: "carId="+id+"&num="+num,dataType:"json", success: function(data){
			if(!data.success){
	        	//_this.parent().next('.stockbox').show();
				stock=false;
	        }else{
	        	//_this.parent().next('.stockbox').hide();
	        	stock=true;
	        }
	      }});
	};
	
	// 价格
	var CalculatePriceFn = function(_this, price, _num){// 参数
		//var _num = parseInt($txtBox.val());
		var $protuctSale = _this.closest('.product-assess').find('.protuct-sale')    // 查找对应对象
			prict = (price * _num);// 单价格
		$protuctSale.find('span').html('￥'+prict.toFixed(2));// 计算值
	};
	
    //弹窗
    $(document).on('click','.alertBtn',function(){
    	$(this).parent().parent().parent('.alertpop').remove();
    	$('.modal-backdrop').remove();
    });
});
function alertLayel(e){
	var html='<div class="alertpop" style="display: block;position: fixed;width: 100%;height:100%;top:0;left:0;z-index: 9999;"><div class="popbg" style="    width: 100%;height:100%;position: absolute;top:0;left:0;z-index: 989;background: #000;opacity: 0.5;"></div><div class="alertLayel" style="width:400px;height:200px;padding-top:10px;background:#fff;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;z-index:9999;"><h3 style="height:30px;position:relative;"><i class="closeicon" style="margin-right:12px;margin-top:0;"></i> </h3><p class="alertContent" style="line-height:30px;font-size:14px;text-align:center;height:100px;">'+e+'</p><div class="row tc"><input type="button" value="确定" class="alertBtn" style="height:30px;border:none;width:80px;background:#ff6200;color:#fff;"></div></div></div>';
	$("body").append(html);
}

//选择当前场景
$(document).on('click', '.list_top>.d_box', function() {
		var col=$(this).children('a').data("i");
	    $(this).children('a').children('i').removeClass('icon-yuanshixin').addClass('icon-duihao');
		$(this).children('a').children('span,i,p').css('color', '#ff6200'); 
		$(this).siblings().children('a').children('i').removeClass('icon-duihao').addClass('icon-yuanshixin');
		$(this).siblings().children('a').children('span,i,p').css('color', '#9EACBB');
		$("#area").val(col);
	});	

//定申请弹窗
$(document).on('click', '.apply_for', function() {
	var cc=$(this).siblings('.deposit_money').children('.c_content').text();
	var aa=$(this).data("text");
	/*console.log(aa);*/
	$("#aa_content").text(cc)
	$(".deposit_layer").fadeIn(400);
	$("#thisnum").val(aa);
}); 

$(document).on('click', '.submitSure', function() {
	 $(".alertpop").fadeOut(200);
});
