<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="../plug/walldraw_plug/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../plug/walldraw_plug/scroll.js"></script>
	<jsp:include page="../../include/staticHead.jsp"/>
	<link rel="stylesheet" type="text/css" href="/css/walldraw/index.css">
	<link rel="stylesheet" type="text/css" href="/css/walldraw/comm.css">
	<title>暖魔方·壁画款</title>
</head>
<body>
<jsp:include page="../../include/staticTop.jsp" />
	<div class="wrap">
		 <div class="slider slider1" id="slider1">
			<div class="slider-wrapper">
				<div class="desc desc1">
					<h1>暖魔方·壁画款</h1>
					<p>新一代石墨烯智能取暖器<br>科技与艺术完美结合，打造个性化的温暖</p>
					<ul class="list1 ">
						<li>
							<span class="list_color">3年</span>
							<span>研发历程</span>
						</li>
						<li class="list_on">
							<span class="list_color">8-15μm</span>
							<span>生命光波</span>
						</li>
						<!-- <li>
							<span class="list_color">IPX4</span>
							<span>防水等级</span>
						</li> -->
					</ul>
				</div>
				<div class="circle">
					<img class="img img1_1" src="../images/walldraw_img/1.1_02.png">
					<img class="img img1_2" src="../images/walldraw_img/1_02.png">
					<img class="img img1_3" src="../images/walldraw_img/1_03.png">
				</div>
			</div>
		 </div>	
		  <div class="slider slider2"  id="slider2">
			<div class="slider-wrapper">
				<div class="desc desc2">
					<h1 class="">核心发热技术与材料  石墨烯</h1>
					<p>石墨烯（Graphene）是由碳原子构成的只有一层原子厚度的二维晶体。2004年，英国曼彻斯特大学物理学家安德烈·盖姆和康斯坦丁·诺沃
					肖洛夫，成功从石墨中分离出石墨烯，证实它可以单独存在，两人也因此共同获得2010年诺贝尔物理学奖。石墨烯被称为“黑金”，是“新材料之王”，科学家甚至预言石墨烯将“彻底改变21世纪”。</p>
				</div>
				<div class="circle">
				  <img class="bg bg1_1" src="../images/walldraw_img/2_01_02.png">
				  <img class="bg bg1_2" src="../images/walldraw_img/2.1_02.png">
				</div>
			</div>
		 </div>	
		   <div class="slider slider3"  id="slider3">
			<div class="slider-wrapper">
				<div class="desc desc3">
					<h1 >给您N个理由，<br>选择熊爸爸取暖器</h1>
					<h2 class=" ">价值认同来源于品质</h2>
					<p  class="1 ">3年多潜心研发，35道工序，268道工艺，356<br>3次测试，匠心锤炼，智能家居，健康采暖，<br>泫然上市！</p>
				</div>
				<ul class="append_desc3">
					<li>
						<span class="append_top">进口</span>
						<span class="append_foot"n>发热膜</span>
					</li>
				<!-- 	<li>
						<span class="append_top">制暖0分贝</span>
						<span class="append_foot"n>无噪音</span>
					</li> -->
					<li>
						<span class="append_top">石墨烯发热</span>
						<span class="append_foot">除湿杀菌</span>
					</li>
					<li>
						<span class="append_top">多终端远程</span>
						<span class="append_foot">智能操控</span>
					</li>
					<li>
						<span class="append_top">智能恒温</span>
						<span class="append_foot">温暖舒适</span>
					</li>
					<li>
						<span class="append_top">电热转换率90%以上</span>
						<span class="append_foot">省电管家</span>
					</li>
					<li>
						<span class="append_top">私人订制</span>
						<span class="append_foot">装饰空间</span>
					</li>
				</ul>
				<div class="circle circle3">
				 <img class="bg bg3_1 4" src="../images/walldraw_img/3_03.png">
				</div>
			</div>
		</div>
	  <div class="slider slider4"  id="slider4">
			<div class="slider-wrapper">
				<div class="desc desc4">
					<h1>无明光无噪音</h1>
					<p>制暖10分贝以下，犹如花开般的声音</p>
				</div>
				<ul class="append_desc4">
					<li>
						<span>
							<i class="icon icon1_1"></i>
							花开0-10分贝
						</span>
					</li>
					<li>
						<span>
							<i class="icon icon1_2"></i>
							鸟鸣45-60分贝
						</span>
					</li>
					<li>
						<span>
							<i class="icon icon1_3"></i>
							说话40-70分贝
						</span>
					</li>
					<li>
						<span>
							<i class="icon icon1_4"></i>
							钢琴70-90分贝
						</span>
					</li>
				</ul>
				<div class="circle">
				  <img class="bg bg4_1" src="../images/walldraw_img/4.1_03.png">
				</div>
			</div>
		</div>
		<div class="slider slider5"  id="slider5">
			<div class="slider-wrapper">
				<div class="desc desc5">
					<h1>远红外线取暖</h1>
					<p>不是所有辐射都是有害的，太阳光中8-15µm的光波即为人类生长所必须的生命光波。<br>熊爸爸暖魔方释放的同样是该波段的生命光波。</p>
				</div>
				<div class="circle">
			      <div class="bg bg5_2"></div>
			      <div class="bg bg5_3"></div>
			      <img class="bg bg5_1" src="../images/walldraw_img/5_03.png">
			      <img class="bg bg5_4" src="../images/walldraw_img/5_01_03.png">
				</div>
			</div>
		</div>

		 <div class="slider slider6"  id="slider6">
			<div class="slider-wrapper">
				<div class="desc desc6">
					<h1>方方面面的强大</h1>
					<p >惊艳的性能来源于德国原装进口发热部件，配合ARM® 32-bit Cortex®-M3 的强大CPU，令人叹为观止的强大动力，将稳定性进一步提升。
					</p>
				</div>
				<ul class="append_desc6">
					<li>
						<span class="append_icon  append_icon1"></span>
						<span class="append_txt">ARM®    Cortex®-M3 处理器
						 <em>快人一步</em>
						</span>
					</li>
					<li>
				    	<span class="append_icon  append_icon2"></span>
						<span class="append_txt">
							RTC实时时钟
							<em>预约开关机精确到分</em>
						</span>
					</li>
					<li>
					    <span class="append_icon  append_icon3"></span>
						<span class="append_txt">
							 支持Sleep、Stop、Standly模式
							<em> 将节能进行到底</em>
						</span>
					</li>
					<li>
					    <span class="append_icon  append_icon4"></span> 
						<span class="append_txt">
							802.11b/g/n标准  WiFi 模块
							<em>随时随地无线控制</em>
						</span>
					</li>
					<li>
					    <span class="append_icon  append_icon5"></span>
						<span class="append_txt">
						128K SRAM内存
						<em>支持系统升级</em>
						</span>
					</li>
					<li>
					    <span class="append_icon  append_icon6"></span>
						<span class="append_txt">
							SENSIRION温湿度传感器
							<em>精确计算温湿度</em>
						</span>
					</li>
					<li>
					    <span class="append_icon  append_icon7"></span>
						<span class="append_txt">
							90以上%电热转换率
							<em>快速升温</em>
						</span>
					</li>
					<li>
					    <span class="append_icon  append_icon8"></span>
						<span class="append_txt"> 
							8-15µm的光波 
							<em>远红外线取暖</em>
						</span>
					</li>
					<li>
					    <span class="append_icon append_icon9"></span>
						<span class="append_txt">
						   制暖10分贝以下 
						  <em> 犹如花开般的声音</em>
						</span>
					</li>
				</ul>
			</div>
		</div>
		 <div class="slider slider7"  id="slider7">
			<div class="slider-wrapper">
				<div class="desc desc7">
					<h1>暗藏玄机，每个组件都恰到好处</h1>
					<p >为了让取暖器从内到外，从造型到使用都达到极简的设计标准，在设计上用了全对称设计<br>专业防烫材质、画面可私人定制、远红外制热+暖风自然对流、智能控制、插拔式电源
					</p>
				</div>
				<div class="circle">
				  <img class="bg bg4_1" src="../images/walldraw_img/7_03.png">
				  <div class="bg bg7_2">
				    <div class="line line1"></div>
				    <p>石墨烯发热膜</p>
				  </div>
				  <div class="bg bg7_3">
				    <div class="line line2"></div>
				  	<p>发热片</p>
				  </div>
				  <div class="bg bg7_4">
				    <div class="line line3"></div>
				  	<p>壁画</p>
				  </div>
				  <div class="bg bg7_5">
				    <div class="line line4"></div>
				  	<p>反射膜</p>
				  </div>
				</div>
			</div>
		</div>
		 <div class="slider slider8"  id="slider8">
			<div class="slider-wrapper">
				<div class="desc desc8">
					<h1>1秒快速升温，温暖无需等待</h1>
					<p >采用智能恒温技术，当室内温度达到设定温度，自动休眠；室温低于设定温度范围时，机器将自动重启加热<br>室内恒温，不仅减少能耗，温暖更舒适
				    </p>
				</div>
				<div class="circle circle8">
				  <img class="bg bg8_1" src="../images/walldraw_img/8.04.png">
				   <div class="circle_box">
				   	 <div class="circle_bg circle_bg1"></div>
				     <div class="circle_bg circle_bg2"></div> 
				     <div class="circle_bg circle_bg3"></div> 
				   </div>
				</div>
			</div>
			<div class="bg8_box"></div>
		</div>
		<div class="slider slider9"  id="slider9">
			<div class="slider-wrapper">
				<div class="desc desc9">
					<h1>远程智能掌控</h1>
					<p >远程手机APP控制，无论您在办公室，还是在商场，都能轻松掌控家里的温湿度<br>一键智能预约，回家的途中，您就可以用手机预约加热时间，让家温暖等候您<br>
					多终端遥控，只需APP添加设备，就可轻松分享操控
				    </p>
				</div>
				<div class="circle">
					<div class="circle9_mobg">
						<img class="circ_1" src="../images/walldraw_img/02_03.png" alt="">
						<img class="circ_2" src="../images/walldraw_img/0_03.png" alt="">
						<img class="circ_3" src="../images/walldraw_img/03_03.png" alt="">
						<img class="circ_4" src="../images/walldraw_img/04_03.png" alt="">
						<p class="circ_txt">熊爸爸APP</p>
					</div>
				  <img  class="bg bg9_1" src="../images/walldraw_img/9_04.png" alt="">
				  <img  class="bg bg9_2" src="../images/walldraw_img/9_05.png" alt="">
				  <div class="desc desc9">
				   	<p class="bg_txt">熊爸爸壁画款</p>
				  </div>
				</div>
			</div>
		</div>
		<div class="slider slider10"  id="slider10">
			<div class="slider-wrapper">
				<div class="desc desc10">
					<h1>尊享私人订制</h1>
					<p >张扬自我个性，享受独特温暖，定格你的幸福的画面 </p>
				</div>
				<div class="circle">
				 <img class="bg bg10_1" src="../images/walldraw_img/10.png" alt="">
				</div>
			</div>
		</div>
		<div class="slider slider11"  id="slider11">
			<div class="slider-wrapper">
				<div class="desc desc11">
					<h1>为您节省每1°电</h1>
					<p >石墨烯，超导热料，电热转化率达90%以上，比传统方式节能15%~30%<br>智能显示一天的耗电量，看得见，更放心 </p>
				</div>
				<div class="circle">
				  <img class="bg bg11_1" src="../images/walldraw_img/11_03.png" alt="">
				  <div class="append_desc11">
				  	<img class="bg bg11_2" src="../images/walldraw_img/11.03.png" alt="">
				  	<img class="bg bg11_3" src="../images/walldraw_img/11.png" alt="">
				  </div>
				</div>
			</div>
		</div>
		<div class="slider slider12"  id="slider12">
			<div class="slider-wrapper">
				<div class="desc desc12">
					<h1>多功能</h1>
					<p >取暖、装饰空间、除湿杀菌、烘干衣服，只需一步 </p>
				</div>
			</div>
		</div>
		<div class="slider slider16">
			<div class="slider-wrapper">
				<div class="desc desc15">
					<h1>货到付款请填写以下信息</h1>
				</div>
				<div class="content">
					<div class="content_title">
						<p>熊爸爸壁画款<span class="price">3999</span></p>
					</div>
					<div class="content_item">
						<h1>规格尺寸</h1>
						<div class="content_wrap">
							<label class="choose_l" for="choose_l">800*800mm</label><input type="radio" id="choose_l"  name="choose">
							<label class="choose_r" for="choose_r">1200*600mm</label><input type="radio" id="choose_r" name="choose">
						</div>
					</div>
					<div class="content_item">
						<h1>产品类型</h1>
						<div class="product_box">
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
							<p><label class="productname"  for="choose_l">非智能 800*800 1000 黑框 西湖桥</label><input type="radio" id="choose_l" name="product"></p>
						</div>
					</div>
					<div class="content_item">
						<h1>数量</h1>
						<div class="content_mun">
							<input type="input">
						</div>
					</div>
					<div class="content_title">
						<p>收货信息</p>
						<div class="site">
							<div class="site_item">
								<p>
									<label>姓名</label>
									<input typ="text">
								</p>
								<p>
								    <label>地址</label>
									<input typ="text">
								</p>
								<p>
									<label>详细地址</label>
									<textarea></textarea>
								</p>
							</div>
							<div class="site_item">
								<label>地区</label>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
   </div>
</body>
</html>