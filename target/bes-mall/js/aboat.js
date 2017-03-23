/**
 * Created by Administrator on 2015/9/2.
 */
$(document).ready(function(){
    /*$('.leftnavlist li').on('click',function(){
        $('.selectli').removeClass('selectli');
        $(this).addClass('selectli');
        $('.currentbox').removeClass('currentbox');
        $('.rightbox').eq($(this).index()).addClass('currentbox');
    })*/
    // 个人中心导航
	$contentLeft = $('.leftnavlist'),// 左侧Dom
	$li = $contentLeft.find('li');// 导航项
	$contentLeft.append('<div class="line"></div>');// 插入标记
	$li.off('mouseover.overli mouseout.outli').on('mouseover.overli mouseout.outli', function(event){// 事件绑定
		var _this = $(this);//当前对象
		if(event.type == "mouseover"){// mouseover 事件
			var _top = _this.position().top;// 取对应top值
			//鼠标悬浮
			$contentLeft.find('.line').stop().animate({'top': _top}, 100);// 跟随滑动
		}else if(event.type == "mouseout"){// mouseout 事件
			var _top = $contentLeft.find('li.selectli').position().top;// 获取当前选中top值
			//鼠标离开还原
			$contentLeft.find('.line').stop().animate({'top': _top}, 200);// 离开滑动还原
		};
	}).trigger('mouseout');// 初始化
});