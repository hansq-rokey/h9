$(function(){
	$(".plus,.minus").on('click', function() {//增加数量
		var thisprice=$("#price").val();
		var value=parseInt($("#num").val());//当前数量
		var  thisprice=$("#price").val();//获取价格
		if(thisprice !=null && thisprice !=''){
			if($(this).hasClass('minus')){
				if(strock(value+1)){
					$(".stock").show();
				}else{
					$(".stock").hide();
					value = value + 1;
					$("#num").val(value);
				}
			}
			if($(this).hasClass('plus')){
				if(!strock(value)){
					value = value - 1;
					if(value<=0){
						$("#num").val(1);
					}else{
						$("#num").val(value);
					}
					$(".stock").hide();
				}
			}
		}else{
			leyal("请先选择产品");
			$(this).attr("disabled","disabled");
			return false;
		}
		 var num=$("#num").val();
		 var sumprice=price(num,thisprice);
		 $(".price").text(sumprice.toFixed(2));
  });
	$(document).on("input propertychange",'#num',function(){//判断库存
		var  thisvalue=parseInt($(this).val());
		var  thisprice=$("#price").val();//获取价格
		if(thisprice !=null && thisprice !=''){
			if(strock(thisvalue)){
				$(".stock").show();
				$("#num").val(1);
			}else{
				$(".stock").hide();
			}
			 var sumprice=price(thisvalue,thisprice);//计算价格
			 $(".price").text(sumprice.toFixed(2));//显示价格
		}else{
			leyal("请先选择产品");
			$(this).attr("disabled","disabled");
			return false;
		}	
	});
	$(document).on('click',"#content_tag p",function() {//选中样式
		var thisindex=$(this).index();
		$("#num").val('1');
		var productId=$(this).children("input[type='radio']").attr("data-id");
		$("#productId").val(productId);
		/*$(".product_box li").each(function(){
			if($(this).hasClass('checked-active')){
				$(this).removeClass("checked-active");
			}
		});*/
		
		$(".price").text($("#startPrice").val());
		$(".product_box li").attr("class","checked-active").removeClass("checked-active");
		$("#product_wrap ul").eq(thisindex).removeClass("indexshow").siblings().addClass("indexshow");
	});
   $(document).on("click",".product_box  li",function(){//选择型号
	    var productId=$(this).children('div').attr("data-productId");//产品ID
	    var thisstock=$(this).children('div').attr("data-stock");//产品数量
	    var thisprice=$(this).children('div').attr("data-price");//价格
	    $("#formatId").val(productId);
	    $(".stock").hide();
	    $("#num").val("1");
	    $("#stock").val(thisstock);
	    $("#price").val(thisprice);//价格
	    $(".price").text(thisprice);
		$(this).addClass('checked-active');
		$(this).siblings().removeClass('checked-active');
	});
	$(document).on("click","#content_tag p",function(){//商品类型切换
		var thisValue=$(this).children('input[type="radio"]').attr("data-id");
		var thisIndex=$(this).index();
		$("#productId").val(thisValue);
	});
	$(document).on("blur","#number",function(){//电话号码判断
		var thisvalue=parseInt($(this).val());
		if(thisvalue == "" || thisvalue ==null){
			$(".validate_number").text("*电话号码不能为空");
			$(this).val('');
			$(".validate_number").css('display','block');
		}else{
			if(!checkPhone(thisvalue)){
				$(".validate_number").text("*电话号码输入有误");
				$(this).val('');
				$(".validate_number").css('display','block');
			}else{
				$(".validate_number").css('display','none');
			}
		}
	});
	var $numTxtBox = $('input[data-txt="num"]');// 锁键状态
	$numTxtBox.keydown(function(e){// 绑定事件
		var oEvent = e || window.event;// 兼容处理
		if(!(oEvent.keyCode==46)&&!(oEvent.keyCode==8)&&!(oEvent.keyCode==9)&&!(oEvent.keyCode==37)&&!(oEvent.keyCode==39))// 键值
		if(!((oEvent.keyCode>=48&&oEvent.keyCode<=57)||(oEvent.keyCode>=96&&oEvent.keyCode<=105))) // 键值
			return false;
		//oEvent.returnValue = false; // firefox 兼容问题
	});

	$.getJSON("../plug/walldraw_plug_new/bh.js",function(data){//提取模拟数据
		$.each(data,function(i,item){
			if(item.productId =="85"){
				$.each(item.formats,function(j,result){
					if(result.stock>0){
						var name=(result.name).split(" ");
						var html="<span style='padding: 0 6px;'>";
						for(var i=0; i<name.length;i++){
							if(i>2&&i%3==0){
								html+='</span><br/><span style="padding: 0 6px;">'+name[i]+'&nbsp;';
							}else{
								html+=''+name[i]+'&nbsp;';
							}
						}
						html+="</span>";
						var htm='<li style="background-image:url('+result.pics[0]+');background-repeat:no-repeat;vertical-align:top;background-size:200px auto;background-position:6px 40px;height: 250px;"><div style="height: 50px; vertical-align: top; display: block;" data-stock="'+result.stock+'" data-price="'+result.price+'" data-productId="'+result.id+'" id="choose_'+j+'" name="formatId">'+html+'</div></li>';
						$(".productitem1").append(htm);
					}
				});
				$(".price").text(item.formats[0].price);
				$("#startPrice").val(item.formats[0].price);
			}
			if(item.productId =="86"){
				$.each(item.formats,function(j,result){
					if(result.stock>0){
						var name=(result.name).split(" ");
						var html="<span style='padding: 0 6px;'>";
						for(var i=0; i<name.length;i++){
							if(i>2&&i%3==0){
								html+='</span><br/><span <span style="padding: 0 6px;">'+name[i]+'&nbsp;';
							}else{
								html+=''+name[i]+'&nbsp;';
							}
						}
						html+="</span>";
						var htm='<li  style="background-image:url('+result.pics[0]+');background-repeat:no-repeat;vertical-align:top;background-size:200px auto;background-position:6px -10px;height: 150px;"><div style="height: 50px; vertical-align: top; display: block;" data-stock="'+result.stock+'" data-price="'+result.price+'"  data-productId="'+result.id+'" id="choose_'+j+'" name="formatId">'+html+'</div></li>';
						$(".productitem2").append(htm);
					}
				});
			}
		});
	});
	$(".submit_t").on('click',function(){//提交数据
		/*alert(getUrlParam("type"));
		var url=window.location.href;
		var typearr=url.split("=");
		console.log(typearr);*/
		var formatId = $("#formatId").val();//规格ID
		var name = $("#name").val();//收货人名字
		var num = $("#num").val();//购买数量
		var countyId = $("#location_id").val();//区ID
		var productId = $("#productId").val();//产品Id
		var mobilePhone = $("#number").val();//手机号
		var address = $("#address").val();//详细地址
		var price = $(".price").text();//商品价格
		console.log(getUrlParam("type"));
		if(getUrlParam("type")=="" || getUrlParam("type")==null){
			var typeValue = "1";
		}else{
			var typeValue = getUrlParam("type");//来源类型
		}
		var remark = $("#remark").val();//备注
		if(formatId == '' || formatId ==null){
			leyal("请添加产品");
			return ;
		}		
		if(name == '' || name ==null){
			leyal("请填写名字");	
			return ;
		}		
		if(num == '' || num ==null){
			leyal("产品数量不能为空");
			return ;
		}		
		if(countyId == '' || countyId ==null){
			leyal("请先选择地址");
			return ;
		}
		if(mobilePhone == '' || mobilePhone ==null){
			leyal("请填写电话号码");
			return ;
		}		
		if(address == '' || address ==null){
			leyal("请先选择收货地址");
			return ;
		}	
		$.ajax({
			url:"/orderSource/save.html",
			type:"POST",
			data:{"formatId":formatId,"productId":productId,"countyId":countyId,"mobilePhone":mobilePhone,"name":name,"address":address,"num":num,"typeValue":typeValue,"price":price,"remark":remark},
			dataType:"JSON",
			success:function(result){
				leyal(result.message);
				setTimeout(function(){window.location.reload();},2000);
			}
		});
	});
})

/*电话号码验证*/
function checkPhone(number){ 
	 if(!(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/.test(number))){
	    return false; 
	}else{
		return true;
	}
 }
function price(num,price){//计算价格
	return num*price;
}
function getUrlParam(name){  
	//构造一个含有目标参数的正则表达式对象  
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");  
	//匹配目标参数  
	var r = window.location.search.substr(1).match(reg);  
	//返回参数值  
	if (r!=null) return unescape(r[2]);  
	return null;  
}  
//弹窗
function leyal(txt){
	html='<div class="leyal"><div class="leyal_box">  <div class="leyal_txt">'+txt+'</div> <p><a class="leyal_submit" href="javascript:">确定</a></p>	</div></div>';
	$("body").append(html);
}
$(document).on("click",'.leyal',function(){
	$("#num").prop("disabled","");
	$("#num").val("1");
	$(".leyal").hide();
});
//滚动动画
function revealOnScroll(){
	var scrolled = $(window).scrollTop();
	$(".slider").each(function() {
    var current = $(this), // 当前元素
        w_height = $(window).outerHeight(), //视窗高度
     	offsetTop = current.offset().top; //当前元素离顶部的高度
	    if (scrolled + w_height - 50 > offsetTop) {
	      current.addClass("animation");
	    }
  });
}
//判断库存
function strock(value){
	var  strock=$("#stock").val();//库存
	if(parseInt(strock) < value){
		return true;
	}else{
		return false;
	}
}
$(window).on("scroll", revealOnScroll);
$(function(){
	$("#slider1").addClass("animation");
})