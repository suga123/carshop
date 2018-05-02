<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%><!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | 车辆对比</title>
	
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<link rel="shortcut icon"type="image/x-icon"  href="images/icons/browser_logo.gif" />
	<link rel="stylesheet" href="css/style.css" media="screen" />
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

		<section class="container content clearfix">
			
			
			<div class="compare-table clearfix">
				
				<div class="col features">
					
					<div class="heading"><h3 class="widget-title">对比内容</h3></div>
					
					<div class="viewport"></div><!--/ .viewport-->
					
					<ul>
						<li>售价</li>
						<li>车型</li>
						<li>发动机</li>
					    <li>变速箱</li>
						<li>维修记录</li>
						<li>公里数</li>
						<li>年份</li>
						<li>转卖几次</li>
						<li>燃料类型</li>
						<li>车身颜色</li>
						<li>内饰颜色</li>
					</ul>
					
				</div><!--/ .col-->
				
				<div class="col">
					
					<div class="heading">&nbsp;</div>
					
					<div class="viewport">
						
						<figure>
							<img src="images/temp/thumb-6.jpg" alt="" />
							<figcaption>Ferrari F12 Berlinetta 2012</figcaption>
						</figure>
						
						<a href="#" class="button orange">Details</a>						
						
					</div><!--/ .viewport-->
					
					<ul>
						<li data-feature="Price">$35,000</li>
						<li data-feature="Body Type">Sedan</li>
						<li data-feature="Engine Size">3.8 &nbsp;&nbsp; 3.5</li>
						<li data-feature="Transmission">Manual</li>
						<li data-feature="Service History">Full</li>
						<li data-feature="Mileage">14000</li>
						<li data-feature="Year">2011</li>
						<li data-feature="Owners">1</li>
						<li data-feature="Fuel Type">Gas</li>
						<li data-feature="Exterior Color">Red</li>
						<li data-feature="Interior Color">Black</li>
					</ul>
					
				</div><!--/ .col-->
				
				<div class="col">
					
					<div class="heading">&nbsp;</div>
					
					<div class="viewport">
						
						<figure>
							<img src="images/temp/thumb-7.jpg" alt="" />
							<figcaption>Ferrari F12 Berlinetta 2012</figcaption>
						</figure>
						
						<a href="#" class="button orange">Details</a>						
						
					</div><!--/ .viewport-->
					
					<ul>
						<li data-feature="Price">$35,000</li>
						<li data-feature="Body Type">Sedan</li>
						<li data-feature="Engine Size">3.8 &nbsp;&nbsp; 3.5</li>
						<li data-feature="Transmission">Manual</li>
						<li data-feature="Service History">Full</li>
						<li data-feature="Mileage">14000</li>
						<li data-feature="Year">2011</li>
						<li data-feature="Owners">1</li>
						<li data-feature="Fuel Type">Gas</li>
						<li data-feature="Exterior Color">Red</li>
						<li data-feature="Interior Color">Black</li>
					</ul>
					
				</div><!--/ .col-->
				
			</div><!--/ .compare-table-->

		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<%@include file="bottom.jsp" %>

</body>
</html>
