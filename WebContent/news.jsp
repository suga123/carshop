<%@page import="com.oracle.carshop.model.bean.New"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.carshop.model.dao.NewDAOImp"%>
<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%
	if(request.getAttribute("news")==null){
		request.getRequestDispatcher("NewServlet?method=list").forward(request, response);
	}
	ArrayList<New> news=(ArrayList<New> )request.getAttribute("news");
%>

<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | 新闻</title>
	
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

		<section class="container sbl clearfix">

			<!-- - - - - - - - - - - - - - - Content - - - - - - - - - - - - - - - - -->		

			<section id="content" class="twelve columns">
				
				<h3 class="section-title">新闻列表</h3>

				<% for(New n:news){ %>
				<article class="entry clearfix secondary">

					<a href="NewServlet?method=detail&newid=<%=n.getNewid() %>" target="_blank">
					<img class="entry-image" alt="" src="<%=n.getXinwenpeitu() %>"  style="width: 160px;height: 80px;"/>
					</a>	

					<div class="entry-body">

						<span class="date"><b>日期:</b>&nbsp;<a href="#"><%=n.getFabushijian() %></a></span>
						
						<a href="blog-single.jsp">
							<h6 class="title"><%=n.getBiaoti() %></h6>
						</a>

						<p>
							<%=n.getNeirong() %>
							<a href="NewServlet?method=detail&newid=<%=n.getNewid() %>" class="details"  target="_blank">详情</a>
						</p>

					</div><!--/ .entry-body-->

				</article><!--/ .entry-->
				<%} %>
				<div class="wp-pagenavi clearfix">
					
					<span class="pages">Page 1 of 2</span>
					<a class="prevpostslink" href="#"></a>
					<span class="current">1</span>
					<a class="page" href="#">2</a>
					<a class="nextpostslink" href="#"></a>
					
				</div><!--/ .wp-pagenavi-->

			</section><!--/ #content-->

			<!-- - - - - - - - - - - - - - end Content - - - - - - - - - - - - - - - - -->	


			<!-- - - - - - - - - - - - - - - Sidebar - - - - - - - - - - - - - - - - -->	

			<aside id="sidebar" class="four columns">
				
				
				<div class="widget_custom_search">
			
			<h3 class="widget-title">快速查找</h3>
			
			<form action="searchCarByCondition.jsp" id="boxpanel" class="form-panel" />
				
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
					<input type="text"  id="minprice" name="minprice" />
<!-- 					<select id="minprice" name="minprice"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />0 -->
<!-- 						<option value="2" />1w -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="maxprice">最高价:</label>
						<input type="text"  id="maxprice" name="maxprice" />
<!-- 					<select id="maxprice" name="maxprice"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />50w -->
<!-- 						<option value="2" />100w -->
<!-- 					</select> -->
				</fieldset>
				
				<fieldset>
					<label for="trans">变速箱:</label>
					<input type="text"  id="trans" name="trans" />
<!-- 					<select id="trans" name="trans"  style="width: 80px;height: 30px;"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />自动 -->
<!-- 						<option value="2" />手动 -->
<!-- 						<option value="2" />手动 -->
<!-- 					</select> -->
				</fieldset>
				<fieldset>
					<label for="bodytype">车辆类型:</label>
					<input type="text"  id="bodytype" name="bodytype" />
<!-- 					<select id="bodytype" name="bodytype"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />紧凑型车 -->
<!-- 						<option value="2" />小型车 -->
<!-- 					</select> -->
				</fieldset>
				<fieldset>
					<label for="mileage">里程数(最小):</label>
					<input type="text"  id="mileage" name="mileage" />
<!-- 					<select id="mileage" name="mileage"> -->
<!-- 						<option value="0" />不限制 -->
<!-- 						<option value="1" />1w-5w -->
<!-- 						<option value="2" />5w-10w -->
<!-- 					</select> -->
				</fieldset>
					<fieldset>
					<label for="mileage">里程数(最大):</label>
					<input type="text"  id="maxmileage" name="maxmileage" />
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
				
				
			</aside><!--/ #sidebar-->

			<!-- - - - - - - - - - - - - end Sidebar - - - - - - - - - - - - - - - - -->

		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<%@include file="bottom.jsp" %>

</body>
</html>
