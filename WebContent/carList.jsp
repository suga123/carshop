<%@page import="com.oracle.carshop.model.bean.PageBean"%>
<%@page import="com.oracle.carshop.model.bean.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"   prefix="test"%>

<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="not-ie no-js" lang="en">
<!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/${pageContext.request.contextPath}/">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>二手車交易平台 |搜索结果</title>

<meta name="description" content="" />
<meta name="author" content="" />

<link rel="shortcut icon" type="image/x-icon"
	href="images/icons/browser_logo.gif" />
<link rel="stylesheet" href="css/style.css" media="screen" />
<link rel="stylesheet" href="css/skeleton.css" media="screen" />
<link rel="stylesheet" href="fancybox/jquery.fancybox.css"
	media="screen" />

<!-- HTML5 Shiv + detect touch events -->
<script type="text/javascript" src="js/modernizr.custom.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body class="menu-1 h-style-1 text-1">
<test:set  var="myname"  scope="session"  value="22324234"></test:set>
${sessionScope.myname }
<test:remove var="myname" scope="session"/>
	<div class="wrap">
		<%@include file="top.jsp"%>

		<div class="main">

			<!-- - - - - - - - - - - - - - - Container - - - - - - - - - - - - - - - - -->

			<section class="container sbl clearfix">

				<!-- - - - - - - - - - - - - - - Content - - - - - - - - - - - - - - - - -->

				<section id="content" class="twelve columns">

					<div class="recent-list-cars">

						<h3 class="widget-title">
							<span>最近发布的</span> 二手车
						</h3>

						<ul class="recent-list-cars clearfix">
							<%
								ArrayList<Car> cars = (ArrayList<Car>) request.getAttribute("cars");
								for (Car c : cars) {
							%>
							<li><a  name="sellCar" href="CarServlet?method=detail&carid=<%=c.getCarId() %>"
								class="single-image picture"> <img
									style="width: 200px; height: 120px;"
									src="<%=c.getQicheshoutu()%>" alt="" />
							</a> <a href="CarServlet?method=detail&carid=<%=c.getCarId() %>"
								class="list-meta">
									<h6 class="title-list-item"><%=c.getGoumaishijian().substring(0, c.getGoumaishijian().indexOf("/"))%>&nbsp;<%=c.getPinpaiming()%>&nbsp;<%=c.getXilie()%></h6>
							</a>

								<div class="detailed">
									<span class="cost">￥<%=c.getShoujia()%>万
									</span> <span><%=c.getPailiang()%></span> <br /> <b><%=c.getGonglishu()%>
										公里</b>
								</div>
								<!--/ .detailed--> <a
								href="CarServlet?method=detail&carid=<%=c.getCarId() %>"
								class="button orange">详情</a> <label class="compare"><input
									type="checkbox" />比较</label></li>
							<%
								}
							%>
						</ul>
						<!--/ .recent-list-cars-->

					</div>
					<!--/ .recent-list-cars-->

					<div class="wp-pagenavi clearfix" style="margin: auto;">
						<%-- <div style="width: 100%;margin: auto;text-align: center;">
						
						<a  href="CarServlet?method=listCarByPage&page=1&count=3"  class="pages">首页</a>
						<a  href="CarServlet?method=listCarByPage&page=${requestScope.pageBean.previousPage}&count=3"  class="pages">上一页</a>
						<a  href="CarServlet?method=listCarByPage&page=${requestScope.pageBean.nextPage}&count=3"  class="pages">下一页</a>
						<a  href="CarServlet?method=listCarByPage&page=${requestScope.pageBean.allPages}&count=3"  class="pages">尾页</a>
						
						当前第${requestScope.pageBean.nowPage}页/总共${requestScope.pageBean.allPages}页，
						每页${requestScope.pageBean.everPageCount}条/总共${requestScope.pageBean.allCount}条,
						跳到第
						
						<select  id="goto"  style="width: 20px;height: 16px; position: relative;top: 6px;"  class="">
						<%
						
							for(int n=1;n<=((PageBean)request.getAttribute("pageBean")).getAllPages();n++)
							{
								%>
								<option value="<%=n%>"><%=n %></option>
								<%
							}
						%>
						
						</select>页
						</div>
						<!-- <span class="pages">Page 1 of 2</span> <a class="prevpostslink"
							href="#"></a> <span class="current">1</span> <a class="page"
							href="#">2</a> <a class="nextpostslink" href="#"></a> -->

					</div> --%>
					<!--/ .wp-pagenavi-->

				</section>
				<!--/ #content-->

				<!-- - - - - - - - - - - - - - end Content - - - - - - - - - - - - - - - - -->


				<!-- - - - - - - - - - - - - - - Sidebar - - - - - - - - - - - - - - - - -->

				<aside id="sidebar" class="four columns">


					<div class="widget-container widget_custom_search">

						<h3 class="widget-title">快速查找</h3>

						<form action="CarServlet" id="boxpanel" class="form-panel" />
				<input type="hidden"   name="method"  value="search"/>

						<fieldset>
							<label for="manufacturer">品牌:</label>
							<%
								if (request.getParameter("manufacturer") != null) {
							%>
							<input type="text" id="manufacturer" name="manufacturer"
								value="<%=new String(request.getParameter("manufacturer").getBytes("ISO-8859-1"), "UTF-8")%>" />
							<%
								} else {
							%>
							<input type="text" id="manufacturer" name="manufacturer" />
							<%
								}
							%>
							<!-- 							<select id="manufacturer" name="manufacturer"> -->
							<!-- 								<option value="0" />Any -->
							<!-- 								<option value="1" />Lorem -->
							<!-- 								<option value="2" />Ipsum -->
							<!-- 							</select> -->
						</fieldset>
						<fieldset>
							<label for="minprice">最低价:</label> 
							<input type="text"
								id="minprice" name="minprice"
								value="${param.minprice }"    style="width: 50px;height: 20px;" />
							<!-- 							<select id="minprice" name="minprice"> -->
							<!-- 								<option value="0" />No min -->
							<!-- 								<option value="1" />Lorem -->
							<!-- 								<option value="2" />Ipsum -->
							<!-- 							</select> -->
						</fieldset>

						<fieldset>
							<label for="maxprice">最高价:</label>
							<%
								if (request.getParameter("maxprice") != null) {
							%>
							<input type="text"
								id="maxprice" name="maxprice"
								value="<%=request.getParameter("maxprice")%>"     style="width: 50px;height: 20px;"/>
							<%
								} else {
							%>
							 <input type="text" id="maxprice" name="maxprice"     style="width: 50px;height: 20px;"/>
							<%
								}
							%>
							<!-- 							<select id="maxprice" name="maxprice"> -->
							<!-- 								<option value="0" />No max -->
							<!-- 								<option value="1" />Lorem -->
							<!-- 								<option value="2" />Ipsum -->
							<!-- 							</select> -->
						</fieldset>

						<fieldset>
							<label for="trans">变速箱类型:</label>
							<%
								if (request.getParameter("trans") != null) {
							%>
							<input type="text" id="trans" name="trans"
								value="<%=new String(request.getParameter("trans").getBytes("ISO-8859-1"), "UTF-8")%>" />
							<%
								} else {
							%>
							<input type="text" id="trans" name="trans" />
							<%
								}
							%>
							<!-- 							<select id="trans" name="trans"> -->
							<!-- 								<option value="0" />Any -->
							<!-- 								<option value="1" />Lorem -->
							<!-- 								<option value="2" />Ipsum -->
							<!-- 							</select> -->
						</fieldset>

						<fieldset>
							<label for="mileage">公里数:</label> 
							<%
								if (request.getParameter("mileage") != null) {
							%>
							<input type="text"
								id="mileage" name="mileage"
								value="<%=request.getParameter("mileage")%>"  style="width: 55px;height: 20px;"/>
							<%
								} else {
							%>
							 <input type="text" id="mileage" name="mileage"    style="width: 55px;height: 20px;"/>
							<%
								}
							%>
							到
							<%
								if (request.getParameter("maxmileage") != null) {
							%>
							<input type="text"
								id="maxmileage" name="maxmileage"
								value="<%=request.getParameter("maxmileage")%>"    style="width: 55px;height: 20px;"/>
							<%
								} else {
							%>
							 <input type="text" id="maxmileage" name="maxmileage"   style="width: 55px;height: 20px;" />
							<%
								}
							%>
							<!-- 							<select id="mileage" name="mileage"> -->
							<!-- 								<option value="0" />Any -->
							<!-- 								<option value="1" />Lorem -->
							<!-- 								<option value="2" />Ipsum -->
							<!-- 							</select> -->
						</fieldset>

						<fieldset>
							<label for="bodytype">车辆尺寸:</label>
							<%
								if (request.getParameter("bodytype") != null) {
							%>
							<input type="text" id="bodytype" name="bodytype"
								value="<%=new String(request.getParameter("bodytype").getBytes("ISO-8859-1"), "UTF-8")%>" />
							<%
								} else {
							%>
							<input type="text" id="bodytype" name="bodytype" />
							<%
								}
							%>
							<!-- 							<select id="bodytype" name="bodytype"> -->
							<!-- 								<option value="0" />Any -->
							<!-- 								<option value="1" />Lorem -->
							<!-- 								<option value="2" />Ipsum -->
							<!-- 							</select> -->
						</fieldset>

						<div class="clear"></div>
						<button id="submitSearch" class="submit-search" type="submit">查找</button>

						</form>
						<!--/ .form-panel-->

					</div>
					<!--/ .widget-container-->


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
									<td><a id="buttonCalculate" href="#" class="button orange">计算</a>
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

						</div>
						<!--/ .entry-loan-->

					</div>
					<!--/ .widget-container-->

					<div class="widget-container widget_recent_entries">

						<h3 class="widget-title">最近新闻</h3>

						<ul>
							<li><a href="#">国家对新能源车的补贴政策</a></li>
							<li><a href="#">二手车市场互联网化是促进市场优化的一种形式</a></li>
							<li><a href="#">常见二手车购买时注意事项</a></li>
						</ul>

						<a href="#" class="see">查看更多新闻</a>

					</div>
					<!--/ .widget-container-->

				</aside>
				<!--/ #sidebar-->

				<!-- - - - - - - - - - - - - end Sidebar - - - - - - - - - - - - - - - - -->

			</section>
			<!--/.container -->

			<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->

		</div>
		<!--/ .main-->

		<%@include file="bottom.jsp"%>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#goto").change(function(){
					location.href='CarServlet?method=listCarByPage&page='+$(this).val()+'&count=3';//用js发起请求
				})
			})
		</script>
</body>
</html>
