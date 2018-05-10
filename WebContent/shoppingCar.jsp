<%@page  contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"   %>
<!DOCTYPE html>
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if IE 9]>					<html class="ie9 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="not-ie no-js" lang="en">  <!--<![endif]-->
<head><base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}/CarShop/">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<title>二手車交易平台 | 购物车</title>
	
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<link rel="shortcut icon"type="image/x-icon"  href="images/icons/browser_logo.gif" />
	<link rel="stylesheet" href="css/style.css" media="screen" />
	<link rel="stylesheet" href="css/skeleton.css" media="screen" />
	<link rel="stylesheet" href="fancybox/jquery.fancybox.css" media="screen" />
	<style>
	td{
		border:1px solid gray;
		text-align: center;
		vertical-align: middle;
	}
	</style>
	<!-- HTML5 Shiv + detect touch events -->
	<script type="text/javascript" src="js/modernizr.custom.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body class="menu-1 h-style-1 text-1">

<div class="wrap">
	<c:import url="top.jsp"></c:import>
	
	
	<div class="main">

		<!-- - - - - - - - - - - - - - - Container - - - - - - - - - - - - - - - - -->	

		<section class="container content clearfix">
			
			<div>
				
				<h3 class="widget-title">購物車列表</h3>
				
				<div class="row ">
					
				<table   style="width: 100%"  style="border:1px solid gray;" cellspacing="0">
						<c:if test="${empty  sessionScope.cars  }">
						<tr><td colspan="7">客官，您的购物车比您的脸还干净，您是否要去购买点东西呢?<a href="index.jsp">去首页逛逛</a></td></tr>
						</c:if>
						<c:forEach var="s"  items="${sessionScope.cars }">
						<tr name="car">
							<td style="padding: 0px;">
								<a href="CarServlet?method=detail&carid=${s.key.carId }"  target="_blank">
										<img  name="img"  src="${s.key.qicheshoutu }" align="middle" width="100" height="60" hspace="20" style="margin: auto;margin-top: 5px;"/>
								</a>
							</td>
							<td valign="middle">
								<span style="font-weight: bold;font-size: 14x;">
										${s.key.pinpaiming }-${s.key.xilie}-${s.key.biansuxiang }-${s.key.pailiang}
								</span>
							</td>
							<td valign="middle">
									<span style="font-weight: bold;font-size: 14px;">
											在${s.key.goumaishijian} 时间购买
									</span>
							</td>
							<td valign="middle">
									<span style="font-weight: bold;font-size: 14px;">
											行驶了${s.key.gonglishu} 公里
									</span>
							</td>
							<td valign="middle">
									<span style="font-weight: bold;font-size: 14px;">
											售价:${s.key.shoujia} 万
									</span>
							</td>
								<td  valign="middle" style="padding-left: 20px;">
									<a  href="javascript:deleteCarFromGouwuche('ShoppingCarServlet?method=deleteCar&carid=${s.key.carId }')">
										<img src="images/add.png"  width="20" height="20" style="cursor: pointer;position: relative;top: 5px;" title="加一件"/>
									</a>
									<input type="text" value="${s.value }"  style="width: 30px;height:15px; margin-right:10px; margin-left:10px;position: relative;"/>
									<a  href="javascript:deleteCarFromGouwuche('ShoppingCarServlet?method=deleteCar&carid=${s.key.carId }')">
										<img src="images/reduce.png"  width="20" height="20" style="cursor: pointer;position: relative;top: 5px;"  title="减一件"/>
									</a>
								</td>
								<td>
									<a  href="javascript:deleteCarFromGouwuche('ShoppingCarServlet?method=deleteCar&carid=${s.key.carId }')">
										<img src="images/remove.png"  width="20" height="20" style="cursor: pointer;position: relative;top: 2px;margin-right:10px; margin-left:10px;" title="删除该商品"/>
									</a>
								</td>
							</tr>
					</c:forEach>
					<tr>
						<td align="right" colspan="7" style="text-align: right;padding-top: 15px;padding-right: 15px;">
								<a href=""  class="button orange">结算&raquo;</a>
								<a href="javascript:deleteAll()"class="button orange">清空购物车&raquo;</a>
						</td>
					</tr>
				</table>
					
				
					
				</div><!--/ .row-->
				
			</div>
			
			
			
			
		</section><!--/.container -->

		<!-- - - - - - - - - - - - - end Container - - - - - - - - - - - - - - - - -->			
		
	</div><!--/ .main-->

	<c:import url="bottom.jsp"></c:import>	

</body>
</html>



<script>
	function deleteCarFromGouwuche(url){
		//ShoppingCarServlet?method=deleteCar&carid=${s.key.carId }
		var  userChoice=window.confirm("您确认要删除这个商品吗?");
		if(userChoice)
		{
			location.href=url;
		}
	}
	function deleteAll(){
		var  userChoice=window.confirm("客官，您真的要删除所有的商品吗?");
		if(userChoice)
		{
			location.href='ShoppingCarServlet?method=deleteAll';
		}
	}
	$(document).ready(function(){
		$("[name='car']:even").css("backgroundColor","#eeeeee");
		$("[name='car']").mouseover(function(){
			$(this).css("color","green");
			$(this).css("textShadow","1px 1px 1px  gray");
		});
		$("[name='car']").mouseout(function(){
			$(this).css("color","gray");
			$(this).css("textShadow","");
		});

		$("[name='img']").mouseover(function(){
			$(this).css("boxShadow","-1px -1px  15px  green");
		});
		$("[name='img']").mouseout(function(){
			$(this).css("boxShadow","");
		});
		})
</script>
