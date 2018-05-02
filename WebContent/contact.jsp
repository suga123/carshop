<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | 联系我们</title>
	
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<link rel="shortcut icon"type="image/x-icon"  href="images/icons/browser_logo.gif" />
	<link rel="stylesheet" href="css/style.css" media="screen" />
	<link rel="stylesheet" href="css/skeleton.css" media="screen" />
	<link rel="stylesheet" href="fancybox/jquery.fancybox.css" media="screen" />
	<!-- HTML5 Shiv + detect touch events -->
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=Ri3mC4soQVBj7nBKiQlVyKhZhbwrWGHf"></script>
</head>
<body class="menu-1 h-style-1 text-1">

<div class="wrap">
	<%@include file="top.jsp" %>
	
	
	<div class="main">
		
		<div id="allmap" style="width: 970px;height: 400px;margin: auto;"></div>

		<!-- - - - - - - - - - - - - - - Container - - - - - - - - - - - - - - - - -->	

		<section class="container clearfix">
			
			<div class="four columns">
				
				<div class="widget_contacts">

					<h3 class="widget-title">我们的联系方式</h3>			

					<ul class="our-contacts">

						<li class="address">
							<b>地址 :</b>
							<p>湖北省襄阳市隆中路296号湖北文理学院</p>
						</li>
						<li class="phone">
							<b>电话:</b>&nbsp;<span>+1 (234) 567-8901</span> <br />
							<b>传真:</b>&nbsp;<span>+1 (234) 567-8902</span>
						</li>
						<li>
							<b>邮箱: <a href="mailto:testmail@sitename.com">testmail@sitename.com</a></b>
						</li>

					</ul><!--/ .our-contacts-->

				</div><!--/ .widget-container-->
				
			</div><!--/ .four .columns-->
			
			<div class="twelve columns">

				<div id="contact">

					<h3 class="widget-title">联系我们</h3>

					<form method="post" action="" class="contact-form" id="contactform" />

						<p class="input-block">
							<label for="name">你的名字 (必填)</label>
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
							<label for="verify">验证码</label>
							<iframe src="php/capcha_page.php" height="29" width="80" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" class="capcha_image_frame" name="capcha_image_frame"></iframe>
							<input class="verify" type="text" id="verify" name="verify" />
						</p>
						
						<p class="input-block">
							<label>&nbsp;</label>
							<button class="button orange" type="submit" id="submit">提交</button>
						</p>
						
					</form><!--/ .contact-form-->			   

				</div><!--/ #contact-->
					
			</div><!--/ .twelve .columns-->
			


		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->
	<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(112.048098,32.006678);
	map.centerAndZoom(point, 15);
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);               // 将标注添加到地图中
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
</script>