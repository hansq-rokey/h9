// 匿名函数
$(function(){
	// 自定义模态窗口
	var score_s = 0;// 临时存储评分
	$(document).off('click').on('click', 'a[data-btn="appr"]', function(){// 评论按钮绑定事件
		var _this = $(this),
			$parent = _this.closest('.appr-item'),// 父级元素
			$productAssess = $parent.find('.product-assess'),// 
			url = $parent.find('.sp-img').find('img').attr('src'),// 产品Url
			dataId = $parent.attr('data-id'),// 商品id
			tempHTLM = ['<div class="marker" id="marker" data-id="'+ dataId +'">',
							'<div class="d-mask"></div>',
						    '<div class="dialogWrap">',
						        '<div class="dialog">',
						            '<h2>商品评价<a href="javascript:;" class="close" data-btn="cancel"></a></h2>',
						            '<div class="dialog-left">',
						            	'<img src="'+ url +'" />',
						            '</div>	',
						            '<div class="dialog-right">',
						            	'<div class="sp-star1">',
											'<div class="sp-star2" style="width:0%;"></div>',
											'<div class="score-box clearfix">',
												'<span data-score="1" title="1"></span>',
												'<span data-score="2" title="2"></span>',
												'<span data-score="3" title="3"></span>',
												'<span data-score="4" title="4"></span>',
												'<span data-score="5" title="5"></span>',
											'</div>',
										'</div>',
										'<textarea id="txtarr"></textarea>',
										'<div class="dialog-btn">',
											'<a href="javascript:;" class="new-orange-btn save" data-btn="submit">提交</a>',
											'<a href="javascript:;" class="cancel" data-btn="cancel">取消</a>',
										'</div>',
						            '</div>',
						        '</div>',
						    '</div>',
						'</div>'].join('');// 弹窗Dom
		
		if (_this.hasClass('disable')) return;// 避免多次点击
		_this.addClass('disable');// 添加标记
		// 判断弹窗是否已创建
		if ($('#marker').length === 0 ) {
			$('body').append(tempHTLM);// 添加弹窗Dom
		}else{
			$('#marker').show();// 显示弹窗
		};
		// 评分盒子Box
		
		$('.score-box').off('mouseover.sover mouseout.sout').on('mouseover.sover mouseout.sout', 'span', function(event){// 事件绑定
			var _this = $(this),// 当前对象
				index = _this.index(),// 当前所引
				w = ((index + 1)*0.2)*100,// 计算分值%比
				_w = (score_s * 0.2) * 100;// 评分后计算分值%比
			if(event.type == "mouseover"){// mouseover 事件
				//鼠标悬浮
				$('#marker .sp-star2').stop(true).animate({"width": w + '%'}, 200);// 动态显示评分 (一颗星25px或20%宽度)
			}else if(event.type == "mouseout"){// mouseout 事件
				//鼠标离开
				$('#marker .sp-star2').stop(true).animate({"width": _w + '%'}, 200);
			};
		});
		// 星级评分事件
		$('.score-box').off('click.clk').on('click.clk', 'span', function(){// 事件绑定			
			var _this = $(this),// 当前点击分数对象
				score = _this.attr('data-score');// 当前点击分数
			score_s = score;
			$('.score-box').off(); // 清除当前绑定事件
		});
		// 关闭窗口
		$('#marker').off('click.cancel').on('click.cancel', 'a[data-btn="cancel"]', function(){// 事件绑定
			$('#marker').hide();// 隐藏弹窗
		});

	});
	// 商品评价列表
	$(document).off('mouseover.over mouseout.out').on('mouseover.over mouseout.out', 'li.appr-item', function(event){// 事件绑定
		var _this = $(this);//当前对象
		if(event.type == "mouseover"){// mouseover 事件
			//鼠标悬浮
			_this.addClass('current').siblings().removeClass('current');// 标记当前和移除同级标记
		}else if(event.type == "mouseout"){// mouseout 事件
			//鼠标离开
			_this.removeClass('current');// 移除标记样式
		};
	});
	// 提交评分
	$(document).off('click.subt').on('click', 'a[data-btn="submit"]', function(){
		var _this = $(this),// 提交按钮
			$parent = _this.closest('#marker'),// 父级元素对象
			$txtarr = $parent.find('#txtarr'),// 评论框
			_val = $.trim($txtarr.val());// 评论内容

		if (0 === score_s || _val == '') {// 是否有评分和评论
			alert('请评分和评论!');
			return false;
		}
		var _data = {// Ajax请求参数
			"id": $parent.attr('data-id'), // 商品Id
			"score": score_s, // 评分
			"comment": _val // 内容
		};

		var callBackFn = function(data){// AJAX 成功回调

				if (1 != data.status) return;// 评论状态失败
				// 查找当前商品
				var $item = $('#appr-list').find('li[data-id="'+ _data.id +'"]'),// 匹配Id
					$tacBox = $item.find('div.tac').attr('class', 'text'),// 修改样式
					$spStar2 = $item.find('.sp-star2'),// 分数Box
					_w = (_data.score * 0.2) * 100;// 评分后计算分值%比

				$spStar2.animate({"width": _w + '%'}, 200);// 显示评分
				$tacBox.html(_data.comment);// 设置内容
				$item.find('.product-assess').removeClass('product-assess-no');// 移除样式
				// 关闭
				$('[data-btn="cancel"]').trigger('click');// 点击关闭
				$('#marker').find('#txtarr').val('');// 重置文本框
				$('#marker').find('.sp-star2').css('width', 0);
			},
			errorFn = function(){// AJAX 失败回调

			};

		settings.submitAssess(_data, callBackFn);// 调用页面接口 (参数，回调方法)

	});
});