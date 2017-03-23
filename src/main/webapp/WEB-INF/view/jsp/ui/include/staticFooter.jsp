<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="pop">
    <div class="popbg"></div>
    <div class="layel">
        <h3 class="poptitle">问题反馈<i class="closeicon"></i> </h3>
        <div class="row">
            <div class="remind">输入您的联系方式，我们会第一时间与您交流<i class="arrow"></i></div>
        </div>
        <div class="row">
            <input type="text" class="yourname" id="callMe" placeholder="怎么称呼您？">
        </div>
        <div class="row">
            <input type="text" class="yournum" id="tel" placeholder="请留下您的手机号码">
        </div>
        <div class="row" style="display: none;">
            <input type="text" class="yzm-input" placeholder="验证码">
            <img src="http://fe.ibaixiong.com/shop/images/loginbg.png" class="yzm-img">
        </div>
        <div class="row">
            <textarea class="description" id="customersMemo" placeholder="如您有关于产品的任何问题，欢迎反馈我们，我们将在第一时间回复。"></textarea>
        </div>
        <div class="row">
            <input type="button" class="sendinfor" value="发送">
        </div>
    </div>
</div>
<footer class="bx-footer">
    <div class="footer-wrap">
        <div class="row">
            <div class="col-lg-2 col-md-2 col-ms-12">
                <ul class="_text_list">
                    <li><p>关于熊爸爸</p></li>
                    <li><a target="_blank" href="/about.html">了解我们</a> </li>
                    <li><a target="_blank" href="/join.html">加入团队</a> </li>
                    <li><a target="_blank" href="/contact.html">联系我们</a> </li>
                    <li><a target="_blank" href="/attract.html">加盟我们</a> <img src="http://fe.ibaixiong.com/shop/images/hot.png" style="padding-bottom:5px;"></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-ms-12">
                <ul>
                    <li><p>熊爸爸渠道</p></li>
                    <li><a target="_blank" href="https://shop130325253.taobao.com/">熊爸爸淘宝店</a> </li>
                    <li><a target="_blank" href="https://nuanhuanrao.tmall.com/">熊爸爸天猫店</a> </li>
                    <!-- li><a href="javascript:;">白熊商城</a> </li> -->
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-ms-12">
                <ul>
                    <li><p>关注我们</p></li>
                    <li class="wx">
                      <div class="-box-width">
                       <a href="javascript:;">官方微信</a>
                       <img src="http://fe.ibaixiong.com/shop/images/erweima.png" class="erweima"> 
                      </div> 
                     </li>
                    <li><a target="_blank" href="http://weibo.com/u/5721304254">新浪微博</a> </li>
                    <li class="wx">
                    <div class="-box-width">
                      <a href="javascript:;">客户端下载</a>
                      <img src="http://fe.ibaixiong.com/shop/images/client_download.png" class="erweima">
                    </div>
                    </li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-2 col-ms-12col-lg-2 col-md-2 col-ms-12">
                <ul>
                    <li><p>共建家园</p></li>
                    <li><a href="javascript:;" class="feedback">问题反馈</a> </li>
                </ul>
            </div>
            <div class="col-lg-4 tc">
                <div><i class="mobileicon"></i><span class="mobilenum">400-157-0088</span></div>
                <div style="text-indent: 34px;">周一到周五（9:00-18:00）</div>
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2175775986&site=qq&menu=yes"><img border="0" src="http://fe.ibaixiong.com/shop/images/qqonline.png" alt="点击这里给我发消息" title="点击这里给我发消息" class="qqonline" style="margin-top:27px;padding-left:26px;"/></a>
            </div>
        </div>

        <div class="row">
            <p class="footer-infor">© 2015 ibaixiong.com All rights reserved.    杭州白熊科技有限责任公司    备案号:浙ICP备15024007号-1. <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33010402000428" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="http://fe.ibaixiong.com/common/image/ghs.png" style="float:left;"/>浙公网安备 33010402000428号</a></p>
        </div>
    </div>
</footer>
<script type="text/javascript">
//问题反馈
$(".sendinfor").click(function(){
	var callMe=$("#callMe").val();
	var tel=$("#tel").val();
	var customersMemo=$("#customersMemo").val();
	if(!callMe){
		alertLayel('姓名不能为空!');
		return;
	}
    if (!tel.match(/^(((13[0-9]{1})|(15[0-3]{1})|(15[5-9]{1})|177|170|176|178|145|147|(18[0-9]{1}))+\d{8})$/)) {
    	alertLayel('手机号码格式不正确!')
        return false;
    }
	if(!tel){
		alertLayel('联系方式不能为空!');
		return;
	}
	if(!customersMemo){
		alertLayel('描述内容不能为空！');
		return;
	}
	$.ajax({
        url: "/u/user/question.html",
        type: 'post',
        data:{ "callMe": callMe,"tel":tel,"customersMemo":customersMemo },
        dataType: 'json',
        success: function (data) {
        	if(data.code==1){
        		$('.pop').hide();
        		$("#callMe").val("");
        		$("#tel").val("");
        		$("#customersMemo").val("");
        	}else{
        		alertLayel("对不起，提交失败，请稍后再试！");
        	}
        },
		error: function(XMLHttpRequest) {
			if(XMLHttpRequest.readyState==0&&XMLHttpRequest.responseText==""){
				alertLayel("请登录后重试");
        	}
		}
    });
});

</script>
