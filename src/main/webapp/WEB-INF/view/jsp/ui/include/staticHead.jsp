<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link href="http://fe.ibaixiong.com/common/plug/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="http://fe.ibaixiong.com/common/plug/jQuery/jquery-1.8.3.min.js" type="text/javascript" ></script>
<link rel="icon" href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	mce_href="http://fe.ibaixiong.com/shop/image/xLogin.ico"	type="image/x-icon">
<script>
$.ajax({  
	  type:"get",  
	  dataType:"jsonp",
	  jsonp: "jsonpCallback",
	  url: "/u/user/info.html",  
	  crossDomain:true,
	  success: function(obj){  
     if ( obj.result.loginstatus == true ) {
		//获取登陆用户成功之后给值
		$("#userInfo").show();
		$("#loginInfo").hide();
		var nick=obj.result.name;
		if(nick==null)
			nick ="白熊";
		$("#userName").text(nick);
		var ssss = obj.result.ssssTag;
		if(ssss == 1){
			$("#ssssLi").show();
		}
		var merchantTag = obj.result.merchantTag;
		if(merchantTag == 1){
			$("#merchantLi").show();
		}
	}
	          
	  },  
	  beforeSend:function(){
		  
	  },  
	  complete:function(data,status){
		  //alert( JSON.stringify(data));
	  },
  error: function(jqXHR, textStatus, errorThrown) {
    	  
      }
	}); 
</script>
<jsp:include page="tongji.jsp"></jsp:include>
