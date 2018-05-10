<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/CarShop/">
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
	<c:import url="top.jsp"></c:import>
	
	
	<div class="main">

		<!-- - - - - - - - - - - - - - - Container - - - - - - - - - - - - - - - - -->	

		<section class="container content clearfix">
			
			
			<div class="compare-table clearfix" style="overflow: scroll;display: inline-block; ;float: left; ">
				
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
				<div >
			<c:forEach  var="c" items="${requestScope.cars }">
					<div class="col" style="width: 120px;">
					
							<div class="heading">&nbsp;</div>
							
							<div class="viewport">
								
								<figure>
									<img src="${c.qicheshoutu }" alt="" width="120"  height="90" />
									<figcaption>${c.pinpaiming }-${c.xilie }-${c.goumaishijian }</figcaption>
								</figure>
								
								<a    target="_blank"  href="CarServlet?method=detail&carid=${c.carId }"  class="button orange">详情</a>						
								
							</div><!--/ .viewport-->
							
							<ul>
								<li data-feature="Price"> ￥${c.shoujia }</li>
								<li data-feature="Body Type">${c.cheliangleixing }</li>
								<li data-feature="Engine Size">${c.pailiang}</li>
								<li data-feature="Transmission">${c.biansuxiang }</li>
								<li data-feature="Service History">无</li>
								<li data-feature="Mileage">${c.gonglishu }</li>
								<li data-feature="Year">${c.goumaishijian }</li>
								<li data-feature="Owners">${c.dijishou }</li>
								<li data-feature="Fuel Type">${c.ranliaoleixing }</li>
								<li data-feature="Exterior Color">黑色</li>
								<li data-feature="Interior Color">灰色</li>
							</ul>
							
						</div><!--/ .col-->
			</c:forEach>
				</div>
			</div><!--/ .compare-table-->

		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<c:import url="bottom.jsp"></c:import>

</body>
</html>
