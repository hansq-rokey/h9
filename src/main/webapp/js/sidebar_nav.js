// 匿名函数
$(function(){
	// 商品评价列表
	$contentLeft = $('.content-left'),
	$li = $contentLeft.find('li');
	
	$(document).off('mouseover.overli mouseout.outli').on('mouseover.overli mouseout.outli', $li, function(event){// 事件绑定
		var _this = $(this);//当前对象
		if(event.type == "mouseover"){// mouseover 事件
			//鼠标悬浮
			_this.addClass('current').siblings().removeClass('current');// 标记当前和移除同级标记
		}else if(event.type == "mouseout"){// mouseout 事件
			//鼠标离开
			_this.removeClass('current');// 移除标记样式
		};
	});
});