<%@page import="com.oracle.carshop.model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- - - - - - - - - - - - - - Header - - - - - - - - - - - - - - - - -->	
	
	<header id="header" class="clearfix">
		
		<a href="index.jsp" id="logo"><img src="images/logo.png" alt="Car Dealer" /></a>
		
		<div class="widget-container widget_search">
			
			<span class="call"><span>+86</span>0710-8888888</span><br />
			
			<span class="adds">中国，湖北省，襄阳市</span>

			<form action="CarServlet" id="searchform"method="get" />
				<input type="hidden"   name="method"  value="searchAny"/>
				<p>
					<% if(request.getParameter("key")!=null){ %>
					<input type="text" id="s" name="key" placeholder="搜索"  value="<%=new String(request.getParameter("key").getBytes("ISO-8859-1"),"UTF-8")%>"/>
					<%}else{ %>
					<input type="text" id="s" name="key" placeholder="搜索"/>
					<% }%>
					<button type="submit" id="searchsubmit"></button>
				</p>

			</form><!--/ #searchform-->

		</div><!--/ .widget-container-->		
		
		<nav id="navigation" class="navigation">
			
			<ul>
				<li class="current-menu-item"><a href="index.jsp">首頁</a></li>
				<li><a href="javascript:void()">找车</a>
					<ul>
						<li><a href="#">根据品牌</a>
							<ul>
								<li><a href="CarServlet?method=search&manufacturer=阿斯顿马丁">阿斯顿马丁</a></li>
								<li><a href="CarServlet?method=search&manufacturer=奥迪">奥迪</a></li>
								<li><a href="CarServlet?method=search&manufacturer=宝马">宝马</a></li>
								<li><a href="CarServlet?method=search&manufacturer=雪佛兰">雪佛兰</a></li>
								<li><a href="CarServlet?method=search&manufacturer=梅赛德斯奔驰">梅赛德斯奔驰</a></li>
								<li><a href="CarServlet?method=search&manufacturer=法拉利">法拉利</a></li>
								<li><a href="CarServlet?method=search&manufacturer=雷克萨斯">雷克萨斯</a></li>
								<li><a href="CarServlet?method=search&manufacturer=保时捷">保时捷</a></li>
								<li><a href="CarServlet?method=search&manufacturer=丰田">丰田</a></li>
							</ul>
						</li>
						<li><a href="#">根据车型</a>
							<ul>
								<li><a href="CarServlet?method=search&bodytype=轿车">轿车</a></li>
								<li><a href="CarServlet?method=search&bodytype=suv">suv</a></li>
								<li><a href="CarServlet?method=search&bodytype=越野车">越野车</a></li>
								<li><a href="CarServlet?method=search&bodytype=敞篷车">敞篷车</a></li>
								<li><a href="CarServlet?method=search&bodytype=跑车">跑车</a></li>
								<li><a href="CarServlet?method=search&bodytype=皮卡">皮卡</a></li>
								<li><a href="CarServlet?method=search&bodytype=mpv">mpv</a></li>
								<li><a href="CarServlet?method=search&bodytype=硬派越野车">硬派越野车</a></li>
							</ul>
						</li>
						</li>
<!-- 						<li><a href="#">根据引擎</a> -->
<!-- 							<ul> -->
<!-- 								<li><a href="CarServlet?method=search&bodytype=轿车">轿车</a></li> -->
<!-- 							</ul> -->
<!-- 						</li> -->
						<li><a href="#">根据里程</a>
							<ul>
								<li><a href="CarServlet?method=search&maxmileage=1">10000以内</a></li>
								<li><a href="CarServlet?method=search&mileage=1&maxmileage=3">1万-3万</a></li>
								<li><a href="CarServlet?method=search&mileage=3&maxmileage=5">3万-5万</a></li>
								<li><a href="CarServlet?method=search&mileage=5&maxmileage=10">5万-10万</a></li>
								<li><a href="CarServlet?method=search&mileage=10&maxmileage=30">10万-30万</a></li>
								<li><a href="CarServlet?method=search&mileage=30&maxmileage=50">30万-50万</a></li>
								<li><a href="CarServlet?method=search&mileage=50">50万以上</a></li>
							</ul>
						</li>
<!-- 						<li><a href="#">根据年份</a></li> -->
						<li><a href="#">根据价格</a>
							<ul>
								<li><a href="CarServlet?method=search&maxprice=1">1万以内</a></li>
								<li><a href="CarServlet?method=search&minprice=1&maxprice=3">1万-3万</a></li>
								<li><a href="CarServlet?method=search&minprice=3&maxprice=5">3万-5万</a></li>
								<li><a href="CarServlet?method=search&minprice=5&maxprice=10">5万-10万</a></li>
								<li><a href="CarServlet?method=search&minprice=10&maxprice=30">10万-30万</a></li>
								<li><a href="CarServlet?method=search&minprice=30&maxprice=50">30万-50万</a></li>
								<li><a href="CarServlet?method=search&minprice=50">50万以上</a></li>
							</ul>
						</li>
						<li><a href="#">根据变速箱</a>
							<ul>
								<li><a href="CarServlet?method=search&trans=自动">自动</a></li>
								<li><a href="CarServlet?method=search&trans=手动">手动</a></li>
								<li><a href="CarServlet?method=search&trans=手自一体">手自一体</a></li>
								<li><a href="CarServlet?method=search&trans=序列">序列</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="blog.jsp">博客</a>
<!-- 					<ul> -->
<!-- 						<li><a href="blog.jsp">Blog</a></li> -->
<!-- 						<li><a href="blog-single.jsp">Blog Single</a></li> -->
<!-- 					</ul> -->
				</li>
				<li><a href="news.jsp">新闻</a></li>
				<li><a href="sales.jsp">销售顾问</a></li>
				<li><a href="javascript:void()">其他</a>
					<ul>
						<li><a href="compareCar.jsp">车型对比</a></li>
<!-- 						<li><a href="404.jsp">404 Page</a></li> -->
<!-- 						<li><a href="image-and-floats.jsp">Images and Floats</a></li> -->
<!-- 						<li><a href="pricing-table.jsp">Pricing Tables</a></li> -->
<!-- 						<li><a href="typography.jsp">Typography</a></li> -->
						<li><a href="toggle.jsp">汽车常见知识</a></li>
<!-- 						<li><a href="columns.jsp">Column Layout</a></li> -->
					</ul>
				</li>
				<li><a href="contact.jsp">联系我们</a></li>
			</ul>
			
		</nav><!--/ #navigation-->
		
	</header><!--/ #header-->
	<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >Website Template</a></div>
	<!-- - - - - - - - - - - - - - end Header - - - - - - - - - - - - - - - - -->	
