<%@page import="com.oracle.carshop.model.bean.CarImage"%>
<%@page import="java.util.Set"%>
<%@page import="com.oracle.carshop.model.bean.Car"%>
<%@page import="com.oracle.carshop.model.dao.CarDAOImp"%>
<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%  Car  carInfo=(Car)request.getAttribute("car"); %>

<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | 车辆详情</title>
	
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<link rel="shortcut icon"type="image/x-icon"  href="images/icons/browser_logo.gif" />
	<link rel="stylesheet" href="css/style.css" media="screen" />
	<link rel="stylesheet" href="css/galleriffic.css" media="screen" />
	<link rel="stylesheet" href="css/skeleton.css" media="screen" />
	<link rel="stylesheet" href="fancybox/jquery.fancybox.css" media="screen" />

	<!-- HTML5 Shiv + detect touch events -->
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body class="menu-1 h-style-1 text-1">

<div class="wrap">


	<%@include file="top.jsp" %>
	
	<div class="main">

		<!-- - - - - - - - - - - - - - - Container - - - - - - - - - - - - - - - - -->	

		<section class="container sbl clearfix">

			<!-- - - - - - - - - - - - - - - Content - - - - - - - - - - - - - - - - -->		

			<section id="content" class="twelve columns">
				
				<article class="item clearfix">
					
					<h2 class="title"><%=carInfo.getPinpaiming() %>-<%=carInfo.getXilie() %>-<%=carInfo.getGoumaishijian() %></h2>
					
					<div id="gallery" class="gallery">

						<div class="slideshow-container">
						<img  id="show" src="<%=carInfo.getQicheshoutu()%>"  style="width: 100%;height: 100%"/>
<!-- 							<div id="loading" class="loader"></div> -->
<!-- 							<div id="slideshow" class="slideshow clearfix"></div> -->
						</div><!--/ .slideshow-container-->

						<div id="thumbs" class="clearfix">
							<ul class="thumbs list-image clearfix">
							<%  Set<CarImage>  imgs=carInfo.getImgs();
								for(CarImage im:imgs){
							%>
								<li>
									<a class="thumb" name="leaf" href="images/new/<%=im.getImagepath() %>.jpg" >
										<img name='imgs'  src="images/new/<%=im.getImagepath() %>.jpg"  style="width: 145px;height: 100px;"/>
									</a>
								</li>
							<%} %>

								<!-- <li>
									<a class="thumb" name="leaf" href="images/temp/item-1.jpg" title="Title 0">
										<img src="images/temp/list-thumb-1.jpg" alt="Title #1" />
									</a>
								</li>

								<li>
									<a class="thumb" name="leaf" href="images/temp/item-2.jpg" title="Title 1">
										<img src="images/temp/list-thumb-2.jpg" alt="Title #2" />
									</a>
								</li>

								<li>
									<a class="thumb" name="leaf" href="images/temp/item-3.jpg" title="Title 2">
										<img src="images/temp/list-thumb-3.jpg" alt="Title #3" />
									</a>
								</li>	

								<li>
									<a class="thumb" name="leaf" href="images/temp/item-4.jpg" title="Title 3">
										<img src="images/temp/list-thumb-4.jpg" alt="Title #4" />
									</a>
								</li>	

								<li>
									<a class="thumb" name="leaf" href="images/temp/item-5.jpg" title="Title 4">
										<img src="images/temp/list-thumb-5.jpg" alt="Title #5" />
									</a>
								</li>	

								<li>
									<a class="thumb" name="leaf" href="images/temp/item-6.jpg" title="Title 5">
										<img src="images/temp/list-thumb-6.jpg" alt="Title #6" />
									</a>
								</li>	 -->

							</ul><!--/ .thumbs-->

						</div><!--/ #thumbs-->

					</div><!--/ #gallery-->
	
					<div class="extra">
						
						<b class="heading">售价:</b>
						
						<span class="cost">￥<%=carInfo.getShoujia() %>万</span>
						
						<ul class="list type-1">
<!-- 							<li><b>Reg Number: </b><span>423423</span></li> -->
							<li><b>行驶公里: </b><span><%=carInfo.getGonglishu() %></span></li>
							<li><b>车辆类型: </b><span><%=carInfo.getCheliangleixing() %></span></li>
							<li><b>购买时间: </b><span><%=carInfo.getGoumaishijian() %></span></li>
							<li><b>车辆排量: </b><span><%=carInfo.getPailiang() %></span></li>
							<li><b>变速箱: </b><span><%=carInfo.getBiansuxiang() %></span></li>
							<li><b>燃料类型: </b><span><%=carInfo.getRanliaoleixing() %></span></li>
							<li><b>几手: </b><span><%=carInfo.getDijishou() %>手</span></li>
						</ul>
						
						<ul class="addthis-toolbox clearfix">
							<li><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a></li>
							<li><a class="addthis_button_tweet"></a></li>
							<li><a class="addthis_button_google_plusone" g:plusone:size="medium"></a></li>
							<li><a class="addthis_counter addthis_pill_style"></a></li>
						</ul>

<!-- 						<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f3c188f442f3bf2"></script> -->
						
					</div><!--/ .extra-->					
					
					<div class="entry-item">
						
						<div class="video-box">
							
							<b class="heading">视频介绍:</b>
							<video src="<%=carInfo.getShipin() %>"  preload="auto" controls="controls" style="width: 100%;border:1px solid #eeeeee"></video>
<!-- 							<a href="http://www.youtube.com/embed/CNP8DMCDjgw?feature=player_detailpage" class="video-image video-icon"> -->
<!-- 								<img src="images/temp/list-thumb-1.jpg" alt="" /> -->
<!-- 							</a>							 -->
							
						</div><!--/ .video-box-->
						
						<h3 class="section-title">详细介绍</h3>
						
						<p>
							<%=carInfo.getMiaoshu() %>
						</p>
						
<!-- 						<p> -->
<!-- 							Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris -->
<!-- 							nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit -->
<!-- 							esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt -->
<!-- 							in culpa qui officia deserunt mollit anim. Consectetur adipisicing elit, sed do eiusmod tempor -->
<!-- 							incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. -->
<!-- 						</p> -->
						
						<div class="entry-tabs">

							<ul class="tabs-nav">

								<li><a href="#tab1">产品规格</a></li>
								<li><a href="#tab2">安全配置</a></li>
								<li><a href="#tab3">便携配置</a></li>
								<li><a href="#tab4">舒适配置</a></li>
								<li><a href="#tab5">娱乐配置</a></li>

							</ul><!--/ .tabs-nav -->

							<div class="tabs-container">

								<div class="tab-content clearfix" id="tab1">
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>车辆类型: </b><span>轿车</span></li>
											<li><b>传动系统: </b><span>全时四驱</span></li>
											<li><b>油耗数据: </b><span>10升/100公里</span></li>
											<li><b>反制动系统: </b><span>非ABS|4轮|ABS</span></li>
											<li><b>前制动类型: </b><span>碟刹</span></li>
											<li><b>转弯直径: </b><span>28米</span></li>
											<li><b>后悬挂: </b><span>多点连接</span></li>
											<li><b>后台黄类型: </b><span>线圈</span></li>
											<li><b>前部空间: </b><span>1.2米</span></li>
											<li><b>前腿部空间: </b><span>60厘米</span></li>
											<li><b>前肩室: </b><span>53.10 in.</span></li>
											<li><b>前髋间: </b><span>51.90 in.</span></li>
											<li><b>遏制重量自动: </b><span>2568 lbs</span></li>
											<li><b>总长度: </b><span>178.30 in.</span></li>
										</ul>									
										
									</div>
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>总高度: </b><span>58.50 in.</span></li>
											<li><b>离地间隙: </b><span>5.70 in.</span></li>
											<li><b>前轮距: </b><span>58.30 in.</span></li>
											<li><b>标准座位: </b><span>5</span></li>
											<li><b>货物体积: </b><span>13.60 ft.</span></li>
											<li><b>最大牵引力: </b><span>1500 lbs</span></li>
											<li><b>续航里程: </b><span>36.000 mile</span></li>
											<li><b>发动机型号: </b><span>1.8L L4 DOHC 16V</span></li>
										</ul>									
										
									</div>
									
								</div><!--/ .tab-content -->

								<div class="tab-content clearfix" id="tab2">
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>前排气囊: </b><span>全部</span></li>
											<li><b>后排气囊: </b><span>全部</span></li>
											<li><b>侧边气囊: </b><span>全部</span></li>
											<li><b>主动刹车: </b><span>有</span></li>
											<li><b>ESC: </b><span>有</span></li>
										</ul>									
										
									</div>
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>侧方雷达: </b><span>有.</span></li>
											<li><b>前摄像头: </b><span>有</span></li>
											<li><b>后摄像头: </b><span>有.</span></li>
											<li><b>碰撞警告: </b><span>没有</li>
											<li><b>自动刹车: </b><span>有</span></li>
											<li><b>坡道辅助: </b><span>有</span></li>
											<li><b>车道偏移警告: </b><span>有</span></li>
											<li><b>疲劳警示: </b><span>有</span></li>
										</ul>									
										
									</div>
								
								</div><!--/ .tab-content -->

								<div class="tab-content clearfix" id="tab3">
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>电吸门: </b><span>有</span></li>
											<li><b>USB: </b><span>有</span></li>
											<li><b>自动泊车: </b><span>有</span></li>
											<li><b>寻车灯: </b><span>有</span></li>
											<li><b>倒车影像: </b><span>有</span></li>
											<li><b>转向辅助灯光: </b><span>有</span></li>
											<li><b>感应雨刮: </b><span>有.</span></li>
											<li><b>手机遥控: </b><span>有.</span></li>
											<li><b>自动防眩目: </b><span>有.</span></li>
											<li><b>自动大灯: </b><span>有.</span></li>
											<li><b>自动启停: </b><span>有</span></li>
										</ul>									
										
									</div>
									
									<div class="five columns">
									
										<ul class="list type-1">
											
											<li><b>无钥匙启动: </b><span>有.</span></li>
											<li><b>自动尾箱: </b><span>有</span></li>
											<li><b>遮阳帘: </b><span>有</span></li>
											<li><b>电动座椅: </b><span>有</span></li>
										</ul>									
										
									</div>
			
								</div><!--/ .tab-content -->

								<div class="tab-content clearfix" id="tab4">
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>真皮座椅: </b><span>Semi</span></li>
											<li><b>电动加热: </b><span>Coil</span></li>
											<li><b>座椅通风: </b><span>39.10 in.</span></li>
											<li><b>自动空调: </b><span>41.30 in.</span></li>
											<li><b>分区空调: </b><span>53.10 in.</span></li>
											<li><b>座椅按摩: </b><span>51.90 in.</span></li>
											<li><b>座椅放倒: </b><span>2568 lbs</span></li>
											<li><b>后排可调: </b><span>178.30 in.</span></li>
										</ul>									
										
									</div>
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>空气悬挂: </b><span>58.50 in.</span></li>
											<li><b>可调悬架: </b><span>5.70 in.</span></li>
											<li><b>全景天窗: </b><span>58.30 in.</span></li>
											<li><b>主动降噪: </b><span>5</span></li>
											<li><b>车载冰箱: </b><span>13.60 ft.</span></li>
											<li><b>Maximum Towing: </b><span>1500 lbs</span></li>
											<li><b>Basic-distance: </b><span>36.000 mile</span></li>
											<li><b>Engine Type: </b><span>1.8L L4 DOHC 16V</span></li>
										</ul>									
										
									</div>
			
								</div><!--/ .tab-content -->

								<div class="tab-content clearfix" id="tab5">
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>后排影响: </b><span>SEDAN 4-DR</span></li>
											<li><b>氛围灯: </b><span>FWD</span></li>
											<li><b>车载网络: </b><span>30-32 miles/gallon</span></li>
											<li><b>音频系统: </b><span>Non-ABS | 4-Wheel | ABS</span></li>
											<li><b>多片CD: </b><span>Coil</span></li>
											<li><b>USB音频: </b><span>39.10 in.</span></li>
											<li><b>蓝牙音频: </b><span>41.30 in.</span></li>
											<li><b>Front Shoulder Room: </b><span>53.10 in.</span></li>
											<li><b>Front Hip Room: </b><span>51.90 in.</span></li>
											<li><b>Curb Weight-automatic: </b><span>2568 lbs</span></li>
										</ul>									
										
									</div>
									
									<div class="five columns">
									
										<ul class="list type-1">
											<li><b>Track Front: </b><span>58.30 in.</span></li>
											<li><b>Standard Seating: </b><span>5</span></li>
											<li><b>Cargo Volume: </b><span>13.60 ft.</span></li>
											<li><b>Maximum Towing: </b><span>1500 lbs</span></li>
											<li><b>Basic-distance: </b><span>36.000 mile</span></li>
											<li><b>Engine Type: </b><span>1.8L L4 DOHC 16V</span></li>
										</ul>									
										
									</div>
			
								</div><!--/ .tab-content -->

							</div><!--/ .tabs-container -->	

						</div><!--/ .entry-tabs-->
						
						<h3 class="section-title">联系我们关注这辆车</h3>
						
							<form method="post" action="" class="comments-form" />

								<p class="input-block">
									<label for="name">你的姓名 (必填)</label>
									<input type="text" name="name" id="name" />
								</p>

								<p class="input-block">
									<label for="email">你的邮箱(必填)</label>
									<input type="text" name="email" id="email" />
								</p>

								<p class="input-block">
									<label for="web">你的电话(必填)</label>
									<input type="text" name="web" id="web" />
								</p>

								<p class="input-block">
									<label for="comments">你的留言: (必填)</label>
									<textarea name="comments" id="comments" cols="30" rows="10"></textarea>	
								</p>

								<p class="input-block">
									<label>&nbsp;</label>
									<button class="button orange" type="submit" id="submit">提交</button>
								</p>

							</form><!--/ .contact-form-->	
						
					</div><!--/ .entry-item-->
					
				</article><!--/ .item-->
				
			</section><!--/ #content-->

			<!-- - - - - - - - - - - - - - end Content - - - - - - - - - - - - - - - - -->	


			<!-- - - - - - - - - - - - - - - Sidebar - - - - - - - - - - - - - - - - -->	

			<aside id="sidebar" class="four columns">
				
				<div class="widget-container widget_custom_search">

					<h3 class="widget-title">快速查找</h3>

					<form action="CarServlet" id="boxpanel" class="form-panel" />
				<input type="hidden"   name="method"  value="search"/>
				
				<fieldset>
					<label for="manufacturer">厂商:</label>
					<input type="text"  id="manufacturer" name="manufacturer"/>
<!-- 					<select id="manufacturer" name="manufacturer" > -->
<!-- 						<option value="0" />任意 -->
<!-- 						<option value="1" />大众 -->
<!-- 						<option />宝马 -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="minprice">最低价:</label>
					<input type="text"  id="minprice" name="minprice"  />
<!-- 					<select id="minprice" name="minprice"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />0 -->
<!-- 						<option value="2" />1w -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="maxprice">最高价:</label>
						<input type="text"  id="maxprice" name="maxprice"  />
<!-- 					<select id="maxprice" name="maxprice"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />50w -->
<!-- 						<option value="2" />100w -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="trans">变速箱:</label>
					<input type="text"  id="trans" name="trans"  />
<!-- 					<select id="trans" name="trans"  style="width: 80px;height: 30px;"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />自动 -->
<!-- 						<option value="2" />手动 -->
<!-- 						<option value="2" />手动 -->
<!-- 					</select> -->
				</fieldset>
				<fieldset>
					<label for="bodytype">车辆类型:</label>
					<input type="text"  id="bodytype" name="bodytype"  />
<!-- 					<select id="bodytype" name="bodytype"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />紧凑型车 -->
<!-- 						<option value="2" />小型车 -->
<!-- 					</select> -->
				</fieldset>
				<fieldset>
					<label for="mileage">里程数(最小):</label>
					<input type="text"  id="mileage" name="mileage"  />
<!-- 					<select id="mileage" name="mileage"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />1w-5w -->
<!-- 						<option value="2" />5w-10w -->
<!-- 					</select> -->
				</fieldset>
					<fieldset>
					<label for="mileage">里程数(最大):</label>
					<input type="text"  id="maxmileage" name="maxmileage"  />
<!-- 					<select id="mileage" name="mileage"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />1w-5w -->
<!-- 						<option value="2" />5w-10w -->
<!-- 					</select> -->
				</fieldset>
				
				
				
				<div class="clear"></div>
				<button id="submitSearch" class="submit-search" type="submit">查找</button>
				
			</form><!--/ .form-panel-->

				</div><!--/ .widget-container-->
				
				<div class="widget-container widget_loan_calculator">
					
					<div class="widget-head">
						<h3 class="widget-title">分期计算器</h3>
					</div>
					
					<div class="entry-loan">
						
						<table>
							<tr>
								<td><label for="loan_amount">贷款金额</label></td>
								<td><input id="loan_amount" type="text" value="0.00" /></td>
								<td>￥</td>
							</tr>
							<tr>
								<td><label for="payment">首付金额</label></td>
								<td><input id="payment" type="text" value="0.00" /></td>
								<td>￥</td>
							</tr>
							<tr>
								<td><label for="rate">贷款利率</label></td>
								<td><input id="rate" type="text" value="0.00" /></td>
								<td>%</td>
							</tr>
							<tr>
								<td><label for="term">贷款年限</label></td>
								<td><input id="term" type="text" value="0.00" /></td>
								<td>年</td>
							</tr>
							<tr>
								<td>
									<a id="buttonCalculate" href="#" class="button orange">计算</a>
								</td>
							</tr>
							<tr>
								<td><label for="payments">总共还款</label></td>
								<td><input id="payments" type="text" value="0.00" /></td>
								<td>￥</td>
							</tr>
							<tr>
								<td><label for="mpayment">每月还款</label></td>
								<td><input id="mpayment" type="text" value="0.00" /></td>
								<td>￥</td>
							</tr>
						</table>
						
					</div><!--/ .entry-loan-->
					
				</div><!--/ .widget-container-->
				
				<div class="widget-container widget_recent_entries">
					
					<h3 class="widget-title">最近新闻</h3>
					
					<ul>
						<li><a href="#">国家对新能源车的补贴政策</a></li>
						<li><a href="#">二手车市场互联网化是促进市场优化的一种形式</a></li>
						<li><a href="#">常见二手车购买时注意事项</a></li>
					</ul>
					
					<a href="#" class="see">查看更多新闻</a>
					
				</div><!--/ .widget-container-->
				
			</aside><!--/ #sidebar-->

			<!-- - - - - - - - - - - - - end Sidebar - - - - - - - - - - - - - - - - -->

		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<%@include file="bottom.jsp" %>		
<script type="text/javascript">
$(document).ready(function(){
	$("[name='imgs']").click(function(){
		$("#show").attr("src",$(this).attr("src"));
	})
})
</script>

</body>
</html>
