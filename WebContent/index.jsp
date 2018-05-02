<%@page import="com.oracle.carshop.model.bean.New"%>
<%@page import="com.oracle.carshop.model.dao.NewDAOImp"%>
<%@page import="com.oracle.carshop.model.dao.CarDAOImp"%>
<%@page import="com.oracle.carshop.model.bean.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %><!-- EL的函数库=jstl的函数 -->
<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<c:if test="${requestScope.allCars  eq  null}">
	<c:redirect  url="CarServlet?method=index"></c:redirect><!-- 跳转页面的标签，重定向 -->
</c:if>
		


<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台|首页</title>
	
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<link rel="shortcut icon"type="image/x-icon"  href="images/icons/browser_logo.gif" />
	<link rel="stylesheet" href="css/style.css" media="screen" />
	<link rel="stylesheet" href="css/skeleton.css" media="screen" />
	<link rel="stylesheet" href="sliders/flexslider/flexslider.css" media="screen" />
	<link rel="stylesheet" href="fancybox/jquery.fancybox.css" media="screen" />

	<!-- HTML5 Shiv + detect touch events -->
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body class="menu-1 h-style-1 text-1">
<div class="wrap">
	<c:import url="top.jsp"></c:import>
	<!-- - - - - - - - - - - - - - Top Panel - - - - - - - - - - - - - - - - -->	
	
	<div class="top-panel clearfix">
		
		<!-- - - - - - - - - - - Slider - - - - - - - - - - - - - -->	

		<div id="slider" class="flexslider clearfix">

			<ul class="slides">

			<c:forEach var="car"  items="${requestScope.tuiguangCars }">
								<li>
									<a href="CarServlet?method=detail&carid=${car.carId }"  target="_blank">
									<img src="${car.qicheshoutu }" alt="" style="width: 100%;height: 100%" />
									</a>
									<div class="caption">
										<div class="caption-entry">
				
											<dl class="auto-detailed clearfix">
												<dt><span class="model">${car.goumaishijian }&nbsp;${car.pinpaiming }</span></dt>
												<dd class="media-hidden"><b>${car.pailiang }</b></dd>
												<dd class="media-hidden"><b>${car.gonglishu }公里</b></dd>
												<dd><span class="heading">￥${car.shoujia }万</span></dd>
											</dl><!--/ .auto-detailed-->
				
											<a href="CarServlet?method=detail&carid=${car.carId }"  target="_blank"  class="button orange">详情 &raquo;</a>
				
										</div><!--/ .caption-entry-->
									</div><!--/ .caption-->
								</li>					
				</c:forEach>

			</ul><!--/ .slides-->

		</div><!--/ #slider-->

		<!-- - - - - - - - - - - end Slider - - - - - - - - - - - - - -->
		
		<!-- - - - - - - - - - - Search Panel - - - - - - - - - - - - - -->
		
		<div class="widget_custom_search">
			
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
					<input type="text"  id="minprice" name="minprice"  style="width: 60px;height: 20px;"/>
<!-- 					<select id="minprice" name="minprice"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />0 -->
<!-- 						<option value="2" />1w -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="maxprice">最高价:</label>
						<input type="text"  id="maxprice" name="maxprice"  style="width: 60px;height: 20px;"/>
<!-- 					<select id="maxprice" name="maxprice"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />50w -->
<!-- 						<option value="2" />100w -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="trans">变速箱:</label>
					<input type="text"  id="trans" name="trans"  style="width: 60px;height: 20px;"/>
<!-- 					<select id="trans" name="trans"  style="width: 80px;height: 30px;"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />自动 -->
<!-- 						<option value="2" />手动 -->
<!-- 						<option value="2" />手动 -->
<!-- 					</select> -->
				</fieldset>
				<fieldset>
					<label for="bodytype">车辆类型:</label>
					<input type="text"  id="bodytype" name="bodytype"  style="width: 60px;height: 20px;"/>
<!-- 					<select id="bodytype" name="bodytype"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />紧凑型车 -->
<!-- 						<option value="2" />小型车 -->
<!-- 					</select> -->
				</fieldset>
				<fieldset>
					<label for="mileage">里程数(最小):</label>
					<input type="text"  id="mileage" name="mileage"  style="width: 60px;height: 20px;"/>
<!-- 					<select id="mileage" name="mileage"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />1w-5w -->
<!-- 						<option value="2" />5w-10w -->
<!-- 					</select> -->
				</fieldset>
					<fieldset>
					<label for="mileage">里程数(最大):</label>
					<input type="text"  id="maxmileage" name="maxmileage"  style="width: 60px;height: 20px;"/>
<!-- 					<select id="mileage" name="mileage"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />1w-5w -->
<!-- 						<option value="2" />5w-10w -->
<!-- 					</select> -->
				</fieldset>
				
				
				
				<div class="clear"></div>
				<button id="submitSearch" class="submit-search" type="submit">查找</button>
				
			</form><!--/ .form-panel-->
			
		</div><!--/ .main-search-panel-->
		
		<!-- - - - - - - - - - end Search Panel - - - - - - - - - - - - -->
		
	</div><!--/ .top-panel-->
	
	<!-- - - - - - - - - - - - - end Top Panel - - - - - - - - - - - - - - - -->	
	
	<div class="main">

		<!-- - - - - - - - - - - - - - - Container - - - - - - - - - - - - - - - - -->	

		<section class="container sbr clearfix">

			<!-- - - - - - - - - - - - - - - Content - - - - - - - - - - - - - - - - -->		

			<section id="content" class="twelve columns">
				
				<div class="recent-list-cars">
					
					<h3 class="widget-title">最近发布的二手车</h3>

					<ul class="clearfix">


						<c:forEach  var="c"  items="${requestScope.allCars }" varStatus="s">
									<li>${s.index },,,${s.count },,,
										<a   name="sellCar"   href="CarServlet?method=detail&carid=${c.carId }" class="single-image video picture">
											<img style="width: 200px;height: 120px;" src="${c.qicheshoutu }" alt="" />
										</a>
			
										<a href="CarServlet?method=detail&carid=${c.carId }" class="list-meta">
											<h6 class="title-list-item">${c.goumaishijian }&nbsp;${c.pailiang }&nbsp;${c.xilie }</h6>
										</a>
			
										<div class="detailed">
											<span class="cost">￥${c.shoujia }万</span>
											<span>${c.pailiang }</span> <br />
											<b>${c.gonglishu }公里</b>	
										</div><!--/ .detailed-->
			
										<a href="carDetail.jsp?carid=${c.carId }" class="button orange">详情</a>
										<label class="compare"><input type="checkbox" />比较</label>
									</li>
						</c:forEach>


					</ul>

					<a href="CarServlet?method=listCarByPage&page=1&count=3" class="see">查看更多</a>
					
				</div><!--/ .recent-list-cars-->
				
			</section><!--/ #content-->

			<!-- - - - - - - - - - - - - - end Content - - - - - - - - - - - - - - - - -->	


			<!-- - - - - - - - - - - - - - - Sidebar - - - - - - - - - - - - - - - - -->	

			<aside id="sidebar" class="four columns">
				
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
					 <c:forEach  var="n"   items="${requestScope.news }">
						<li><a href="NewServlet?method=detail&newid=${n.newid }">${fn:substring(n.biaoti,0,5) }</a></li>
						</c:forEach>
					</ul>
					
					<a href="news.jsp" class="see" target="_blank">查看更多新闻</a>
					
				</div><!--/ .widget-container-->

			</aside><!--/ #sidebar-->

			<!-- - - - - - - - - - - - - end Sidebar - - - - - - - - - - - - - - - - -->

		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<c:import url="bottom.jsp"></c:import>
	<%  if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("codeError")) {%>
	<script type="text/javascript">
	alert("温馨提示:\r\n验证码填写错误!");
	</script>
	<%} else if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("userError")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n用户名和密码错误!");
	</script>
	<%} else if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("registerSuccess")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n注册成功!");
	</script>
	<%} else if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("registerFail")){ %>
	<script type="text/javascript">
	alert("温馨提示:\r\n注册失败!");
	</script>
	<%} %> 
</body>
</html>
