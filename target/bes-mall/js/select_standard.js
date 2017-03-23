// 匿名函数
$(function(){

	// 规格选择
	$(document).off('click.sel').on('click.sel', 'div.size-box', function(){// 事件绑定
		var _this = $(this),
			_spec = _this.attr('data-spec');//当前对象
		_this.addClass('on').siblings('.size-box').removeClass('on');
		$('#spec').val(_spec);
		$("#formatId").val(_this.attr('data-id'));
		/*if(event.type == "mouseover"){// mouseover 事件
			//鼠标悬浮
			_this.addClass('current').siblings().removeClass('current');// 标记当前和移除同级标记
		}else if(event.type == "mouseout"){// mouseout 事件
			//鼠标离开
			_this.removeClass('current');// 移除标记样式
		};*/
	});

});