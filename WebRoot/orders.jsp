<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<title>订餐记录</title>


<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style5.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/local.css">
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.cxselect.min.js"></script>
<script>
	function ToMenu() {
		document.getElementById("toMenu").action = "menu.action?foodType="
				+ "主食";
		document.getElementById("toMenu").submit();
	}
	function ToOrder() {
		document.getElementById("toOrder").submit();
	}
</script>
</head>

<body>
	<div class="container">
		<div class="global-navbar navbar navbar-default"
			style="height:70px;margin-top:20px">
			<div class="navbar-header">
				<a class="navbar-brand wos-brand" href="index.jsp"> <img
					src="images/title.jpg" style="height:55px" alt="TakeOut">
				</a>
			</div>
			<div class="main-navigation clearfix">
				<ul class="navbar-nav" style="text-align:center;">
					<li class="menu-item menu-item-menu"
						style="margin-top:4px;margin-bottom:4px">
						<form id="toMenu" action="menu" method="post">
							<a class="menu-item-target" href="javascript:ToMenu()"
								style="text-decoration:none"> <i
								class="fa mcd mcd-burger icon"></i>浏览菜单
							</a>
						</form>
					</li>
					<li class="menu-item menu-item-menu"
						style="margin-top:4px;margin-bottom:4px"><a
						class="menu-item-target" href="personal.jsp"
						style="text-decoration:none"> <i class="fa fa-user icon"></i>我的账户
					</a></li>
					<li class="menu-item menu-item-menu"
						style="margin-top:4px;margin-bottom:4px">
						<form id="toOrder" action="ShowOrder" method="post">
							<a class="menu-item-target" href="javascript:ToOrder()"
								style="text-decoration:none"> <i class="fa fa-phone icon"></i>我的订单
							</a>
						</form>
				</ul>
			</div>
		</div>

		<div class="col-xs-12 type-flama">
			<div class="page-title">
				<h1>订餐记录</h1>
			</div>

			<div class="page-content">
				<div class="panel panel-default panel">
					<div class="panel-body">
						<table class="table" contenteditable="true">
							<thead>
								<tr>
									<th>订单号</th>
									<th>食品名称</th>
									<th>数量</th>
									<th>总价</th>
									<th>订餐时间</th>
									<th>送餐地址</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator id="orders" value="#request.orderList">
									<tr>
										<td>${orders.orderNo}</td>
										<td>${orders.foodName}</td>
										<td>${orders.amount}</td>
										<td>${orders.userNo}</td>
										<td>${orders.orderTime}</td>
										<td>${orders.address}</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>

				<div class="panel-group type-flama order-history accordion"></div>

			</div>
		</div>
	</div>
</body>
</html>
