<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>  
	<link rel="stylesheet" type="text/css" href="/css/partner.css">
	<script type="text/javascript" src="/plug/jQuery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/plug/layer/layer.js"></script>
	<title>熊爸爸温暖屋-消费升级风口下的赚钱项目</title>
</head>
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?b155bb8a2112cbe4da4f6b9f8a912de0";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
<body>
	<div class="partnerPC-mian partner-mian" id="partnerPC">
		<p><img src="../../img_new/PcbImg1/partnerPC01.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC02.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC03.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC04.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC05.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC06.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC07.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC08.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC09.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC10.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC11.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC12.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC13.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC14.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC15.jpg"></p>
		<p><img src="../../img_new/PcbImg1/partnerPC16.jpg"></p>
		<div class="partner-Pc-Submit">
			<img class="subimg" src="../../img_new/PcbImg1/subming.png"> 
			<div class="partner-Pc-form">
				<ul class="partner-input">
					<li>
						<label class="partner-color">姓名:</label>
						<input class="i-height name" type="text"  id="user_name" name="">
					</li>
					<li>
						<label class="partner-color">意向城市:</label>
						<input class="i-height city" type="text" id="user_city" name="">
					</li>
					<li>
						<label class="partner-color">电话:</label>
						<input class="i-height number" id="user_telephone" type="text" name="">
					</li>
					<li>
						<label class="partner-color">投资金额:</label>
						<select class="i-height investment-amount"  id="investmentValue">
							<option>10~20万</option>
							<option>20~50万</option>
							<option>50~100万</option>
							<option>100万以上</option>
						</select>
					</li>
					<li>
						<label class="partner-color">&nbsp&nbsp&nbsp&nbsp备注:</label>
						<textarea class="remark" id="comment"></textarea>
					</li>
				</ul>
					<a class="partner-sub" id="footer_submit" href="###">提交</a>
					<input type="hidden" id="investMoney" />
					<input type="hidden" id="type" value="${type }" />
					<input type="hidden" id="pageValue" value="${pageValue }" />
					<input type="hidden" id="advertValue" value="${advertValue }" />
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#user_telephone").on('change', function(e) {
			var mycalls=/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|171|145|147|(18[0-9]{1}))+\d{8})$/;
			var content=$(this);
			var tell=content.val();
			if(!mycalls.test(tell)){ 
				content.val('');
				layer.msg('号码输入有误');
			    return false;
			}
		});
		
		$("#investmentValue").on('change',function(e){
			
			var investMoney = $("#investMoney");
			var thisValue =$(this).val();
		
			investMoney.val(thisValue);
		});
		$("#user_city").on('change', function(e) {
			
			var that = $(this);
			var tell = $(this).val();
			checkStr(tell,that);
		});
	});

	function checkStr(str,that){
		var myReg = /^[\u4e00-\u9fa5][\u4e00-\u9fa5]+$/;
	    
	    if(!myReg.test(str) ) {
	      layer.msg('意向城市输入有误');
	      that.val("");
	      return false;
	    }
		return true;
	  }
	  
	$("#footer_submit").on("click",function() {
	    
		var name=$('#user_name').val();
	    var tel=$('#user_telephone').val();
	    var cities=$('#user_city').val();
	    var comment=$('#comment').val();
	    var type=$('#type').val();
	    var pageValue=$('#pageValue').val();
	    var advertValue=$('#advertValue').val();
	    var investMoney = $("#investMoney").val();
	    //默认值
	   	if(investMoney==""){
	   		investMoney = "10~20万";
	   	}
	    if(name==''||tel==''||cities==''){
	    	return false;
	    }
	    
	    $.ajax({
			type: "POST",
			data:{name:name,tel:tel,cities:cities,remark:comment,adType:type,pageValue:pageValue,advertValue:advertValue,investMoney:investMoney},
			url: "/join/add.html",
			dataType:'text',
			success: function(data) {
				if(data=='success'){
				    $('#user_name').val('');
				    $('#user_telephone').val('');
				    $('#user_city').val('');
				    $('#comment').val('');
					/* alert('恭喜信息提交成功，稍后工作人员会与您取得联系！'); */
				    layer.alert('恭喜信息提交成功，稍后工作人员会与您取得联系！')
				}else{
					layer.msg('出错啦！');
				}
			}
		})
	}); 
	</script>
</body>
</html>