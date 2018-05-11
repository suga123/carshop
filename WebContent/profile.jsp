<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/CarShop/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | Pricing Table</title>
	
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
			
			<h3 class="widget-title">个人中心</h3>
			
			<section class="pricing-table col4 clearfix">
				
				<div class="col" style="width: 280px">
					<form action="UserServlet" method="post"  enctype="multipart/form-data">
					<input  type="hidden"  name="userid"  value="${user.userid }"/>
					<header class="header">
						<h2 class="title">账号:<span class="description">${user.username }</span></h2>
						<input type="hidden" name="username" value="${user.username }" />
<%-- 						<h3 class="description">${user.username }</h3> --%>
					</header><!--/ .header -->
					
					<div class="heading">
						
						<img src="${user.image }"  width="200" height="200"  style="border:1px solid gray;border-radius: 100px;"/>
						<input type="file"  name="headImage" />
<!-- 						<dl> -->
<!-- 							<dt><span class="currency">$</span></dt> -->
<!-- 							<dd><span class="int">25</span></dd> -->
<!-- 							<dd><span class="sup" data-month="p/m">99</span></dd> -->
<!-- 						</dl> -->
						
					</div><!--/ .price-->

					<ul class="features">
						<li><span>昵称:<input   name="nickname"  value="${user.nickname }"/></span></li>
						<li><span>性别:
							<c:choose>
								<c:when test="${user.sex eq 1 }">
									<input type="radio" name="sex" value="1" checked="checked"/>男
									<input type="radio" name="sex" value="0" />女
								</c:when>
								<c:otherwise>
										<input type="radio" name="sex" value="1" />男
									<input type="radio" name="sex" value="0"checked="checked" />女
								</c:otherwise>
							</c:choose>
						</span></li>
						<li><span>年龄:
						<select name="age">
							<c:forEach var="age" begin="1" end="100">
								<c:if test="${age eq user.age }">
										<option selected="selected" value="${age}">${age }</option>
								</c:if>
								<c:if test="${age ne user.age }">
										<option value="${age}">${age }</option>
								</c:if>
							</c:forEach>
						</select>
						</span></li>
						<li><span>工作:<input   name="job"  value="${user.job }"/></span></li>
						<li><span>邮箱:<input   name="email"  value="${user.email }"/></span></li>
						<li><span>电话:<input   name="tel"  value="${user.tel }"/></span></li>
						<li><span>驾龄:
							<select name="jialing">
							<c:forEach var="j" begin="1" end="100">
								<c:if test="${j eq user.jialing }">
										<option selected="selected" value="${j}">${j }</option>
								</c:if>
								<c:if test="${j ne user.jialing }">
										<option value="${j}">${j }</option>
								</c:if>
							</c:forEach>
						</select>
						</span></li>
						<li><span>简介:<textarea name="jianjie" style="width: 160px;height: 160px;">${user.jianjie}</textarea></span></li>
						<li></li>
					</ul><!--/ .features -->

					<footer class="footer">
						<input type="submit" value="修改"   class="button orange" /><input type="reset" value="清空"   class="button orange" />
					</footer><!--/.footer -->
					</form>
				</div><!--/ .col -->

				</div><!--/ .col -->

			</section><!--/ .pricing-table -->
	

		</section><!--/ .container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<c:import url="bottom.jsp"></c:import>

</body>
</html>
