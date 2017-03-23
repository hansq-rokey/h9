<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link href="/css/bath-details.css" rel="stylesheet" type="text/css"><!-- http://fe.ibaixiong.com/shop/ -->
	<link rel="stylesheet" type="text/css" href="../css/comm.css">
	<link rel="stylesheet" type="text/css" href="../css/nav.css">
	<link rel="stylesheet" type="text/css" href="../css/animate.min.css">
	<jsp:include page="../../include/staticHead.jsp"/>
	 <link rel="stylesheet" type="text/css" href="../css/papa.css">
	 <script  type="text/javascript" src="../plug/jQuery/jquery-1.9.1.min.js"></script>
	 <script  type="text/javascript" src="../plug/papaPlug/wow.min.js"></script>
	 <script type="text/javascript" src="../plug/papaPlug/load.js"></script>
	 <script src="http://apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<title>爬爬垫</title>
</head>
<body>
<script>
function myBrowser(){
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    if (isOpera) {
        return "Opera"
    }; //判断是否Opera浏览器
    if (userAgent.indexOf("Firefox") > -1) {
        return "FF";
    } //判断是否Firefox浏览器
    if (userAgent.indexOf("Chrome") > -1){
        return "Chrome";
 }
    if (userAgent.indexOf("Safari") > -1) {
        return "Safari";
    } //判断是否Safari浏览器
    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
        return "IE";
    }; //判断是否IE浏览器
}
	//以下是调用上面的函数
	$(function(){
		var userAgent = myBrowser();
		if ("IE" == userAgent || "FF" ==userAgent) {
			$("#video").css('display','none');
			$(".bg4_1").css('display','block');
		}else{
			$("#video").css("display","block");
			$(".bg4_1").css("display","none");
		}
	})
</script>
<jsp:include page="../../include/staticTop.jsp" />
	<div class="wrap">
	<!--slider1-->
	<div class="slider slider1" id="slider1">
		<div class="slider-wrapper">
			<div class="desc desc1">
				<h1>熊爸爸爬爬垫</h1>
				<h2 class=" wow text_login text_login" data-wow-duration="1s">给他不一样的礼物，给他不一样的爱</h2>
				<p class="  wow text_login text_login" data-wow-duration="1s">
					<span>B2级阻燃 |</span>
					<span>6种颜色随心搭配 |</span>
					<span>5年使用寿命</span>
				</p>
				<p class="price wow text_login" data-wow-duration="3s">300 <em>元/片</em></p>
			</div>
			<img class="img img_1 wow screena" data-wow-duration="3s" src="../img/img1_1.png">
			<img class="img img_2 wow screena" data-wow-duration="3.5s" src="../img/img1_2.png">
			<img class="img img_3 wow screenared" data-wow-duration="3.5s" src="../img/img1_3.png">
			<img class="img img_4 wow screena" data-wow-duration="3s" src="../img/img1_4.png">
		</div>
	</div>
	<!--slider2-->
	<div class="slider slider2" id="slider2">
		<div class="slider-wrapper">
			<div class="desc desc2">
				<h1 class="wow text_login"  data-wow-duration="1s">史无前例的环保</h1>
				<h3 class="wow text_login"  data-wow-duration="2s">“不可回收再利用”的环保材料</h3>
				<span class=" wow text_login"  data-wow-duration="2s">B2级阻燃/耐高温/无异味/全新材料/高弹性</span>
				<p class=" wow text_login"  data-wow-duration="2s">熊爸爸爬爬垫全部采用国家环保等级较高材料的pu生产，不可进行二次回收利用。环保材料对人体无毒无害。<br>
				通过国家B2级检验，具有不自燃、不助燃的特性。</p>
			</div>
			<div class="bg_box">
				<img class="bg bg1" src="../img/img2_1.png">
				<img class="bg bg2" src="../img/img2_2.png">
				<img class="bg bg3" src="../img/img2_3.png">
			</div>
		</div>
	</div>
	<!--slider3-->
	<div class="slider slider3" id="slider3">
		<div class="slider-wrapper">
			<div class="desc desc3">
				<h1 class="wow text_login" data-wow-duration="1s">阳光浴般的温暖</h1>
				<p class="wow text_login"  data-wow-duration="2s">不是所有的辐射都是有害的，其中人自身就在向外辐射8-15μm波长的远红外，另外太阳光中4-16μm的光波即为人类生长所必须的生命光波，而熊爸爸爬爬垫散发的同样是该波段的生命光波。</p>
			</div>
		</div>
	</div>
	<!--slider4-->
	<div class="slider slider4" id="slider4">
		<div class="slider-wrapper">
			<div class="desc desc4">
				<h1 class="text_login"  >石墨烯远红外发热技术</h1>
				<p class="text_login"  >熊爸爸爬爬垫采用 “新材料之王”石墨烯作为发热源，其散发的远红外光波与人体自身散发的生命光波一致，如同依偎在父亲的怀抱。让宝宝在爬行玩乐中，时刻感受来自父亲的温暖。</p>
				<P class="text_login">熊爸爸以一个父亲的态度用心雕琢爬爬垫的每一个细节。力求运用科技的力量为宝宝的健康成长添砖加瓦。</P>
				<ul class="data">
					<li>
						<p class="data_figure"><span class="timer" data-to="10" data-speed="1000">10</span><em>秒</em></p>
						<p class="data_txt hr">升温</p>
					</li>
					<!-- <li>
						<p class="data_figure"><span class="timer" data-to="200" data-speed="1500">200</span><em>倍</em></p>
						<p class="data_txt">钢铁强度</p>
					</li> -->
				</ul>
			</div>
			<div class="video_box">
				<video class="video" id="video" poster="../img/img4_1.png" loop="loop" autoplay="autoplay" style="height: 900px; width:786px;">
                    <source type="video/mp4" src="../img/video/page2.mp4">
                    <source type="video/webm" src="../img/video/page2.webm">
                    <img src="../img/img4_1.png" alt="">
                </video>
                <div class="bg bg4_1"> <img  src="../img/img4_1.png" ></div>
			</div>
		</div>
	</div>
	<!--slider5-->
	<div class="slider slider5" id="slider5">
		<div class="slider-wrapper">
			<div class="desc desc5">
				<h1 class="wow text_login"  data-wow-duration="1s">质量不是说说而已</h1>
				<p  class="wow text_login"  data-wow-duration="2s">高韧性的材料，使得爬爬垫任意弯曲后，均可恢复正常，并安全工作。</p>
				<ul class="category wow text_login" data-wow-duration="3s">
					<li>
						<i class="category_icon category_icon1"></i>
						<p class="category_tag">任意弯曲</p>
						<p class="category_txt">松开仍可正常工作</p>
					</li>
					<li>
						<i class="category_icon category_icon2"></i>
						<p class="category_tag">超高</p>
						<p class="category_txt">抗压等级</p>
					</li>
					<li>
						<i class="category_icon category_icon3"></i>
						<p class="category_tag">38</p>
						<p class="category_txt">个零部件</p>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!--slider6-->
	<div class="slider slider6" id="slider6">
		<div class="slider-wrapper">
			<div class="desc desc6">
				<h1 class="wow text_login"  data-wow-duration="1s">不惜成本只为给全家更安全的呵护</h1>
				<p class="wow text_login"   data-wow-duration="2s">爬爬垫表面最高温度设定在40°C，而婴儿洗澡最佳水温是42°C。线路全部隐藏在内部，<br/>无法直接触碰到。安全，就在这方寸之间。</p>
			</div>
			<div class="schistose">
				<p class="wow fadeInLeft" data-wow-duration=".5s">
					<img src="../img/img7_1.png">
					<span class="schistose_tag">防滑垫</span>
					<span class="schistose_txt">将安全进行到底</span>
				</p>
				<p class="wow fadeInLeft" data-wow-duration="1s"> 
					<img  class="cc" src="../img/img7_2.png">
					<span  class="schistose_digit">0.8<em>cm</em> </span>
					<span  class="schistose_txt">婴儿手指也无法伸入 </span>
				</p>
				<p class="wow fadeInLeft" data-wow-duration="1.5s">
					<img  class="bb" src="../img/img7_3.png">
					<span  class="schistose_digit">1.7<em>cm</em></span>
					<span  class="schistose_txt">超厚pu垫</span>
				</p>
				<p class="wow fadeInLeft" data-wow-duration="2s">
					<img  class="aa" src="../img/img7_4.png">
					<span  class="schistose_tag">IPX4</span>
					<span  class="schistose_txt">防水</span>
				</p>
			</div>
		</div>
	</div>
	<!--slider7-->
	<div class="slider slider7" id="slider7">
		<div class="slider-wrapper">
			<div class="desc desc7">
				<h1  class="wow text_login"  data-wow-duration="1s">温度随心调    自由随心享</h1>
				<p   class="wow text_login"  data-wow-duration="1.5s">4挡可调，爬爬垫表面温度非常柔和，达到设定温度后他会自动保持恒温</p>
			</div>
			<img class="img img7_1" src="../img/img9_2.png">
		</div>
		<div class="circle"><img class="wow fadebig"  data-wow-duration="3s" src="../img/img9_1.png"></div>
	</div>
	<!--slider8-->
	<div class="slider slider8" id="slider8">
		<div class="slider8_top">
			<div class="slider8_content slider8_color2">
				<div class="slider8_bg1">
					<div class="slider8_bw"></div>
				</div>
			</div>
			<div class="slider8_content slider8_color1">
				<div class="desc8 p_a1">
					<h3 class="wow text_login" data-wow-duration="1s">16颗强力磁铁，秒拼爬爬垫</h3>
					<p  class="wow text_login" data-wow-duration="1.5s">为了让爬爬垫从内到外，从造型到使用都达到极简的设计标准，<br/>在设计上用了全对称设计。</p>	
					<p  class="wow text_login" data-wow-duration="1.5s">高标准的设计使其对工艺和成本的高要求，为此我们在爬爬<br/>垫每个边上设计了4颗（共16颗）吸力超强的磁铁，使用户在拼<br/>接爬爬垫时更快捷。</p>
				</div>
			</div>
		</div>
		<div class="slider8_bottom">
			<div class="slider8_content slider8_color1">
				<div class="desc8 p_a2">
					<h3 class="wow text_login" data-wow-duration="1.5s">对接件全对称设计</h3>
					<p  class="wow text_login" data-wow-duration="1.5s">连接件我们同样采用了全对称设计，使得爬爬垫的连接
件可以闭眼连接。</p>
				</div>
			</div>
			<div class="slider8_content slider8_color2 slider8-ba">
				<!--  <div class="slider8_bg2 "> -->
				 	<img class="img img8_5" data-wow-duration="0s" src="../img/img8_1.png">
				 	<img class="img img8_6 wow bw" data-wow-duration="0s" src="../img/img8_3.png">
				<!--  </div>	 -->
 			</div>
		</div>
	</div>
	<!--slider9-->
	<div class="slider slider9" id="slider9">
		<div class="slider-wrapper">
			<div class="desc desc9">
				<P>拖动滑块，变换颜色，变换心情</P>
				<div class="sliding_block " id="slider"></div>
			</div>
		</div>
		<div class="circle">
			<img class="img img_color " style="opacity:1" src="../img/color_img/img9_1.png">
			<img class="img img_color " src="../img/color_img/img9_5.png">
			<img class="img img_color " src="../img/color_img/img9_7.png">
			<img class="img img_color " src="../img/color_img/img9_8.png">
			<img class="img img_color " src="../img/color_img/img9_9.png">
			<img class="img img_color " src="../img/color_img/img9_10.png">
		</div>	
	</div>

	<!--slider10-->
	<div class="slider slider10" id="slider10">
		<div class="slider-wrapper">
			<div class="desc desc10">
				<h1 class="wow text_login"  data-wow-duration="0.5s">超强节能    省了不止一点点</h1>
				<P  class="wow text_login"  data-wow-duration="1.5s">每片连续使用10小时还不到1度电！</P>
			</div>
			<img class="img img10_1" src="../img/img10_1.png">
			<img class="img img10_2 wow fadelogin"  data-wow-duration="3s" src="../img/img10_2.png">
		</div>
	</div>

	<!--slider11-->
	<div class="slider slider11" id="slider11">
		<div class="slider-wrapper">
			<div class="desc desc11">
				<h1 class="wow text_login"  data-wow-duration="0.5s">风格随意搭   样式随心配</h1>
				<p class="wow text_login"   data-wow-duration="1.5s">模块化拼接，想怎么摆就怎么摆，最大化利用空间。</p>
			</div>
		</div>
		<div class="circle wow text_login" data-wow-duration="3s">
			<img class="img img11_1" src="../img/img11_1.png">
		</div>
	</div>
</div>	
 <script type="text/javascript">
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};
/*进度条*/
$( "#slider" ).slider();
 $(function() {
    $( "#slider" ).slider({
      range: "min",
      value:1,
      min: 1,
      max: 700,
      slide: function( event, ui ) {
      	var value=ui.value;
      	console.log(value / 116.666);
      	switch(Math.floor(value /(700/6))){
      		case 0:
      		$(".circle img").eq(0).addClass('addIndex').siblings('img').removeClass('addIndex');
      		break;
      		case 1:
      		$(".circle img").eq(1).addClass('addIndex').siblings('img').removeClass('addIndex');
      		break;
      		case 2:
      		$(".circle img").eq(2).addClass('addIndex').siblings('img').removeClass('addIndex');
      		break;
      		case 3:
      		$(".circle img").eq(3).addClass('addIndex').siblings('img').removeClass('addIndex');
      		break;
      		case 4:
      		$(".circle img").eq(4).addClass('addIndex').siblings('img').removeClass('addIndex');
      		break;
      		case 5:
      		$(".circle img").eq(5).addClass('addIndex').siblings('img').removeClass('addIndex');
      		break;
      	}
      }
    });
  });
</script>
</script>
</body>
</html>



