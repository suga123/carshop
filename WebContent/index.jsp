<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %><!-- EL的函数库=jstl的函数 -->
<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<c:if test="${requestScope.allCars  eq  null}">
	<c:redirect  url="CarServlet?method=index"></c:redirect><!-- 跳转页面的标签，重定向 -->
</c:if>
		


<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/CarShop/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<fmt:setLocale value="zh_CN"/>
	<fmt:setBundle basename="resource"  var="r" /><!-- 配置好要引用的资源文件 -->
	<title>
	<fmt:message  key="index_title"   bundle="${r }" ></fmt:message>
	</title>
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
<input type="hidden"  id="nowPage" value="1"/>
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

					<ul id="allCars" class="clearfix">


						<c:forEach  var="c"  items="${requestScope.allCars }" varStatus="s">
									<li>
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
			
										<a href="CarServlet?method=detail&carid=${c.carId }" class="button orange">详情</a>
											&nbsp;
										<a href="ShoppingCarServlet?method=add&carid=${c.carId }"  target="_blank">
											<img onmouseover="this.style.boxShadow='-1px  -1px  12px red'" onmouseout="this.style.boxShadow=''"  src="images/shoppingCar.png" width="25" height="25" title="添加到购物车" style="margin: 0px;padding: 0px;position: relative;top: 8px;border-radius:12.5px" />
										</a>
										<label class="compare"><input  name="compare"  value="${c.carId }"  type="checkbox" /><a href="javascript:compare()">比较</a></label>
									</li>
						</c:forEach>


					</ul>

					<a href="CarServlet?method=listCarByPage&page=1&count=3" class="see">查看更多</a>
					<div style="margin: auto;display: none;" id="loading"><img src="images/loading.gif" style="width: 30px;height: 30px;"/></div>
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
	<c:choose>
			<c:when test="${requestScope.loginResultMessage eq 'codeError'}">
				<script type="text/javascript">
					alert("温馨提示:\r\n验证码填写错误!");
				</script>
			</c:when>
			<c:when test="${requestScope.loginResultMessage eq 'userError'}">
				<script type="text/javascript">
					alert("温馨提示:\r\n用户名和密码错误!");
				</script>
			</c:when>
			<c:when test="${requestScope.loginResultMessage eq 'registerSuccess'}">
				<script type="text/javascript">
					alert("温馨提示:\r\n注册成功!");
				</script>
			</c:when>
			<c:when test="${requestScope.loginResultMessage eq 'registerFail'}">
				<script type="text/javascript">
					alert("温馨提示:\r\n注册失败!");
				</script>
			</c:when>
	</c:choose>
</body>
</html>

<script>
	function  compare(){
		var ids="";
		$("[name='compare']:checked").each(function(){
			ids+=$(this).val()+",";
		});
		location.href='CarServlet?method=compare&ids='+ids;
	}
	
	$(document).ready(function(){
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			var scrollHeight = $(document).height();
			var windowHeight = $(this).height();
			if(Math.round(scrollTop) + windowHeight >= scrollHeight){
				
				$("#loading").css("display","block");
				setTimeout(function(){
					//1.当滚动到网页地步当时候应该发起ajax请求下一页当数据
					var  nowPage=$("#nowPage").val();
					$.get("CarServlet?method=listCarByAjaxRequest&page="+(nowPage+1)+"&count=15",function(data){
						for(var  n=0;n<data.length;n++)
						{
							var  newCar="<li><a   name='sellCar'   href='CarServlet?method=detail&carid="+data[n].id+"' class='single-image video picture'><img style='width: 200px;height: 120px;' src='"+data[n].image+"' alt='' /></a><a href='CarServlet?method=detail&carid="+data[n].id+"' class='list-meta'><h6 class='title-list-item'>"+data[n].goumaishijian+"&nbsp;"+data[n].pailiang+"&nbsp;"+data[n].xilie+"</h6></a><div class='detailed'><span class='cost'>"+data[n].jiage+"万</span><span>"+data[n].pailiang+"</span> <br /><b>"+data[n].gonglishu+"公里</b></div><a href='CarServlet?method=detail&carid="+data[n].id+"' class='button orange'>详情</a>&nbsp;<a href='ShoppingCarServlet?method=add&carid="+data[n].id+"'  target='_blank'><img onmouseover=this.style.boxShadow='-1px  -1px  12px red' onmouseout=this.style.boxShadow=''  src='images/shoppingCar.png' width='25' height='25' title='添加到购物车' style='margin: 0px;padding: 0px;position: relative;top: 8px;border-radius:12.5px' /></a><label class='compare'><input  name='compare'  value='"+data[n].id+"'  type='checkbox' /><a href='javascript:compare()'>比较</a></label></li>"
							$("#allCars").append(newCar);
						}
						$("#loading").css("display","none");
					});
				}, 5000);
					
			}
		})
	})
</script>
