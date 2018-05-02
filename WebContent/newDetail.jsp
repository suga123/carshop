<%@page import="com.oracle.carshop.model.bean.New"%>
<%@page import="com.oracle.carshop.model.dao.NewDAOImp"%>
<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%
	New  n=(New)request.getAttribute("new");

%>
<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | 新闻详情</title>
	
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
			
			<h3 class="widget-title">新闻详情</h3>
			
			<img class="alignleft" src="<%=n.getXinwenpeitu() %>"  style="width: 460px;height: 280px;" alt="" />
			
			<h3><%=n.getBiaoti() %></h3>
			<h3><%=n.getFabushijian() %></h3>
			<h3><%=n.getYueduliang() %>人阅读过</h3>
			
			<p>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				<%=n.getNeirong() %>
				
			</p>
			
			<!-- <div class="divider"></div>
			
			<img class="alignright" src="images/temp/temp_460x280.png" alt="" />
			
			<h3>A right aligned image</h3>
			
			<p>
				Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
				Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim. 
				Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco. Consectetur adipisicing elit, sed do 
				eiusmod tempor incididunt.  Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
				exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint 
				occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim. Consectetur 
				adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim 
				ad minim veniam.Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
				Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
				laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
				voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
				non proident, sunt in culpa qui officia deserunt mollit anim. Consectetur adipisicing elit, 
				sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
			</p>
			
			<div class="divider"></div>
			
			<a href="#" class="single-image alignleft">
				<img src="images/temp/blog_temp_1.jpg" alt="" />
			</a>
			
			<h3>A left aligned image</h3>
			
			<p>
				Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
				Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.
				Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco. Consectetur adipisicing elit, sed do 
				eiusmod tempor incididunt.  Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
				exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sin
				Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
				laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
				voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
				non proident, sunt in culpa qui officia deserunt mollit anim. Consectetur adipisicing elit, 
				sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
			</p>
			
			<div class="divider"></div>
			
			<a href="#" class="single-image alignright">
				<img src="images/temp/blog_temp_2.jpg" alt="" />	
			</a>
			
			<h3>A right aligned image</h3>
			
			<p>
				Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
				Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.
				Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
				Ut enim ad minim veniam, quis nostrud exercitation ullamco. Consectetur adipisicing elit, sed do 
				eiusmod tempor incididunt.  Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
				exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sin
				Labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
				laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
				voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
				non proident, sunt in culpa qui officia deserunt mollit anim. Consectetur adipisicing elit, 
				sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
			</p> -->
			
		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<%@include file="bottom.jsp" %>		

</body>
</html>
