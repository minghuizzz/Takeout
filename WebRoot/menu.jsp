<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>登录成功</title>


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
	function deleteOrder(param) {
		var food="<%=request.getAttribute("foodType")%>";
		document.getElementById("od").action = "DeleteOrder.action?orderNo="
				+ param + "&foodType=" + food;
		document.getElementById("od").submit();
	}
</script>

<script>
	function changeaddr(){
		var food="<%=request.getAttribute("foodType")%>";
		var addr=document.getElementById("form_deliveryoptions_address").value;
		document.getElementById('CA').action="ChangeAddr.action?foodType="+food+"&userAddr="+addr;
		document.getElementById("CA").submit();
	}
</script>

<script>
	function chooseAddr() {
		//alert(document.all.testchb.display);
		if (document.all.address.style.display == 'block') {
			document.all.address.style.display = "none";
		} else {
			document.all.address.style.display = "block";
		}
	}
</script>
<script>
	function exchange(param) {
		document.getElementById("menu2").action = "exitem.action?foodType="
				+ param;
		document.getElementById("menu2").submit();
	}
</script>
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
<script>
	function addFood(foodName, i, foodType) {
		var str = "food" + i;
		var amount = document.getElementById(str).value;
		document.getElementById("addForm1").action = "AddCart.action?foodName="
				+ foodName + "&amount=" + amount + "&foodType=" + foodType;
		document.getElementById("addForm1").submit();
	}
</script>
<script>
	function up(i) {
		var str = "food" + i;
		document.getElementById(str).value++;
	}
	function down(i) {
		var str = "food" + i;
		document.getElementById(str).value--;
	}
</script>
<style>
.center {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 600px;
	height: auto;
	border: 0px;
	overflow: hidden;
}
</style>

</head>

<body onload="editAddr.action">
	<div class="container">
		<header>
			<!-- 应该有个判断是否登录 -->
			<s:if test="#session.userName != null">
				<h5 style="float:right;">
					Welcome,
					<s:property value="#session.userName" />
					&emsp;<a href="logout.action">退出</a>
				</h5>
			</s:if>
			<s:else>
				<h5>
					未登录，请<a href="index.jsp">登录</a>
				</h5>
			</s:else>
		</header>
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
		<div class="row-fluid" style="margin-top:40px;">
			<div class="span12">
				<div class="row-fluid">
					<div class="span2">
						<div class="food-menu">
							<ul class="primary-menu">
								<li class="primary-menu-item selected"><a
									class="primary-menu-item-target"><span>食品种类</span><i
										class="fa fa-angle-right"></i></a>
									<form id="menu2" action="exitem" method="post">
										<ul class="secondary-menu">
											<li class="secondary-menu-item "><a
												class="secondary-menu-item-target"
												href="javascript:exchange('主食')"><i class="fa fa-circle"></i>
													<span>主食</span></a></li>
											<li class="secondary-menu-item "><a
												class="secondary-menu-item-target"
												href="javascript:exchange('小食')"><i class="fa fa-circle"></i>
													<span>小食</span></a></li>
											<li class="secondary-menu-item "><a
												class="secondary-menu-item-target"
												href="javascript:exchange('甜品')"><i class="fa fa-circle"></i>
													<span>甜品</span></a></li>
											<li class="secondary-menu-item "><a
												class="secondary-menu-item-target"
												href="javascript:exchange('饮品')"><i class="fa fa-circle"></i>
													<span>饮品</span></a></li>
										</ul>
									</form></li>
							</ul>
						</div>
					</div>
					<div class="span7">
						<div class="page-content">
							<div class="row row-narrow">
								<div id="product-cards"
									data-equal-height=".col-xs-6 .product-title">
									<div class="row row-narrow">
										<s:iterator id="menuItem" value="#request.menuList">
											<div class="col-lg-4 col-xs-6">
												<div class="panel panel-default panel-product">
													<div class="panel-body">
														<img src="${menuItem.foodPicture}" class="img-block"
															alt="">
														<h5 class="product-title" style="height: 19px;">${menuItem.foodName}</h5>
														<div class="product-badges">
															<span class="food-icons-sprite food-icons-new ir"></span>
														</div>
													</div>
													<div class="panel-footer">
														<div class="row row-narrow">
															<div class="col-xs-6">
																<div class="product-details">
																	<div class="product-cost">
																		<span class="starting-price">￥${menuItem.foodPrice}</span>
																	</div>
																	<div class="product-nutritional-info"></div>
																</div>
															</div>
															<form id="addForm1" action="AddCart" method="post"
																onsubmit="return false">
																<div class="btn group">
																	<button type="button"
																		class="btn btn-yellow btn-default"
																		onclick="javascript:down('${menuItem.foodNo}')">-</button>
																	<input style="text-align:center;width:60px;height:30px"
																		id="food${menuItem.foodNo}" type="text" value="1" />
																	<button type="button"
																		class="btn btn-yellow btn-default"
																		onclick="javascript:up('${menuItem.foodNo}')">+</button>
																	<button class="btn btn-blue action-create"
																		onclick="javascript:addFood('${menuItem.foodName}','${menuItem.foodNo}','${menuItem.foodType}')">添加</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</s:iterator>
										<!-- 循环这个 -->


									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="span3">
						<div id="order-widget"
							class="panel panel-basic panel-narrow order-summary">
							<div class="panel-heading">
								<h3 class="text-center">我的订单</h3>
							</div>
							<div class="panel-section-group">
								<section id="addr"
									class="panel-section section-delivery-address">
									<table class="table-default table-delivery-address">
										<tbody>
											<tr>
												<th scope="row">送餐至:
													<div>
														<a href="#cgAddr" role="button" class="btn"
															data-toggle="modal">编辑</a>
													</div>


												</th>
												<td>

													<div>${request.userAddr}</div>

												</td>
											</tr>
										</tbody>
									</table>
								</section>

								<section id="time"
									class="panel-section section-delivery-datetime">
									<table class="table-default table-delivery-datetime">
										<tbody>
											<tr>
												<th scope="row">送餐时间:</th>
												<td>
													<div class="when-to-deliver"></div>
													<div class="how-long-to-deliver">
														<b>预计送餐时间:</b>

														<div>${request.planSendTime}</div>


													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</section>

								<section id="price" class="panel-section section-cost-breakdown">
									<table class="table-default table-cost">
										<tfoot class="total">
											<tr>
												<th scope="row">总计:</th>
												<td>￥${request.totalPrice}</td>
											</tr>
										</tfoot>
										<tbody></tbody>
									</table>


									<div class="form-group">


										<form action="PayCart" method="post">
											<s:if test="#request.totalPrice != 0">
												<button class="btn btn-danger btn-block btn-xl"
													type="submit">立即结账</button>
											</s:if>
										</form>
										<s:else>
											<button herf="#" class="btn btn-block btn-xl"
												disabled="disabled">立即结账</button>
										</s:else>


									</div>

								</section>

								<section id="orderDetail"
									class="panel-section section-order-items">
									<h3>订单明细</h3>

									<form id="od" class="order-items item-list"
										action="DeleteOrder" method="post">

										<div class="order-item list-item">
											<div>
												<div>
													<s:iterator id="cart" value="#request.cartList">

														<div class="item-heading clearfix">
															<div class="quantity">${cart.amount}</div>
															<div class="picture">
																<img alt="" class="img-block"
																	src="${cart.foodPicture}">
															</div>
															<div class="details">
																<h5 class="product-name">${cart.foodName}</h5>
															</div>
														</div>
														<div class="item-body clearfix">
															<div class="controls">
																<a class="action-delete action-delete-order"
																	data-orderid="88"
																	href="javascript:deleteOrder('${cart.orderNo}')"
																	title="删除"> <img alt="24x24" src="icon/delete.ico" /></a>

															</div>
																<div class="cost">
																	￥<h5>${cart.foodPrice}</h5>
																</div>
														</div>
													</s:iterator>
												</div>
											</div>
										</div>
									</form>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="cgAddr" class="modal fade center" role="dialog"
		aria-hidden="false" tabindex="-1" style="display: none;z-index:99999;">
		<div class="modal-backdrop fade in" style="height: 521px;"></div>

		<div class="modal-content" style="z-index:99999">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">
					<img alt="24x24" src="icon/close.ico" />
				</button>
			</div>
			<div class="fieldset-heading">
				<h2>请选择送餐地址</h2>
			</div>

			<form id="CA" action="ChangeAddr" method="post">
				<div>
					<a
						class="ui-selectmenu ui-widget ui-state-default ui-selectmenu-dropdown ui-corner-all"
						id="form_deliveryoptions_address-button" role="button"
						href="javascript:chooseAddr()" tabindex="0" aria-haspopup="true"
						aria-owns="form_deliveryoptions_address-menu"
						aria-disabled="false" style="width: 538px;"> 
						<select	class="hide-default-error" name="userAddr"
						id="form_deliveryoptions_address" tabindex="0"
						style="display: block;" aria-disabled="false">
							<s:iterator id="addrs" value="#request.userAddrList">
								<option>${addrs.userAddr}</option>
							</s:iterator>
						</select>
					</a>
				</div>

				<table style="width:370px">
					<thead>
						<tr>
							<td><a style="float:left;font-size:20px;padding-left:30px"
								href=""> <img src="icon/right.ico" />添加送餐地址
							</a></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="button" value="更改地址" onclick="javascript:changeaddr()"
								class="btn btn-danger btn-xl btn-submit" style="float:right" />

							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>

	</div>


</body>
</html>