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

<title>个人信息</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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
		<div class="row-fluid" style="margin-top:10px">
			<div class="page-title">
				<h1>账户设置</h1>
			</div>
			<div class="page-content">
				<div class="panel-lg panel panel-default"></div>

				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">用户信息</a></li>
						<li><a id="addrbutton" href="#tab2" data-toggle="tab">地址信息</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="tab1">
							<p class="text-info">用户信息</p>
							<div class="span7">
								<form action="modifyUserInfo.action" class="form-horizontal"
									method="post">
									<div class="control-group">
										<label class="control-label" for="inputName">用户名</label>
										<div class="controls">
											<input type="text" name="userName" id="inputName"
												placeholder="Input New Name" value="${request.userName}">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="inputPhoneNumber">手机号</label>
										<div class="controls">
											<input name="phoneNumber" type="text" id="inputPhoneNumber"
												placeholder="Input New PhoneNumber">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="inputOldPassword">旧密码</label>
										<div class="controls">
											<input type="password" name="oldPassword"
												id="inputOldPassword" placeholder="Old Password">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="inputPassword">新密码</label>
										<div class="controls">
											<input type="password" name="newPassword" id="inputPassword"
												placeholder="New Password">
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="ConfirmPassword">确认新密码</label>
										<div class="controls">
											<input type="password" name="confirmNewPassword"
												id="ConfirmPassword" placeholder="Confirm New Password">
										</div>
									</div>
									<button type="submit" class="btn btn-primary pull-right">提交</button>
								</form>
							</div>
						</div>

						<div class="tab-pane" id="tab2">
							<table class="table table-steiped" id="addrTable">
								<thead>
									<tr>
										<th>地址编号</th>
										<th>地址信息</th>
									</tr>
								</thead>
								<tbody id="addrList">
								</tbody>
							</table>
							<a role="button" class="btn btn-primary" data-toggle="modal"
								href="#addModal">添加地址</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal hide fade" id="addModal">
			<div class="modal-header">
				<a href="#" class="close" data-dismiss="modal">X</a>
				<h4>添加地址</h4>
			</div>

			<div class="modal-body">
				<fieldset id="city_china">
					<div class="control-group">
						<label class="control-label" for="inputProvince">省份</label>
						<div class="controls">
							<select id="province" class="province cxselect"
								disabled="disabled" name="province"></select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputCity">城市</label>
						<div class="controls">
							<select id="city" class="city cxselect" disabled="disabled"
								name="city"></select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputArea">地区</label>
						<div class="controls">
							<select id="area" class="area cxselect" disabled="disabled"
								name="area"></select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputName">街道</label>
						<div class="controls">
							<input id="detail" name="detail" type="text"
								style="width: 220px;height:30px"
								placeholder="Input Your Detail Address">
						</div>
					</div>
				</fieldset>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" data-dismiss="modal" id="addAddrRow">提交</button>
			</div>
		</div>

		<script>
			$.cxSelect.defaults.url = 'js/cityData.min.json';
			$('#city_china').cxSelect({
				selects : [ 'province', 'city', 'area' ]
			});
		</script>
		<script type="text/javascript">
			//添加地址信息
			$("#addAddrRow")
					.click(
							function() {
								//获取用户选择的地址信息，并添加到table后面
								var province = document
										.getElementById("province").value;
								var city = document.getElementById("city").value;
								var area = document.getElementById("area").value;
								var detail = document.getElementById("detail").value;

								var complete = province + city + area + detail;
								//complete = encodeURI(complete);

								//向后台传送地址信息
								$
										.ajax({
											url : "addAddr",
											type : "GET",
											datatype : "json",
											data : ({
												completeAddr : complete
											}),
											success : function(data) {
												if (data == "true") {
													var _row = '<tr>'
															+ '<td>'
															+ complete
															+ '</td>'
															+ '<td>'
															+ "<input type=\"button\" value=\"删除\" onclick=\"delRow\(this\)\">"
															+ '</td>' + '</tr>'
													$("#addrList").append(_row);
													alert("添加地址成功");
												} else
													alert("添加地址失败");
											}
										})
							})
			//删除指定行
			function delRow(row) {
				var num = row.parentNode.parentNode.rowIndex;
				$
						.ajax({
							url : "editAddr",
							type : "GET",
							datatype : "json",
							data : ({
								delNum : num
							}),
							success : function(data) {
								if (data == "true") {
									document.getElementById('addrTable')
											.deleteRow(num);
									alert("删除地址成功");
								} else
									alert("删除地址失败");
							}
						});
			}
			//显示地址信息 
			$("#addrbutton")
					.click(
							function() {
								$("#addrList").empty();
								$
										.ajax({
											url : "showAddr",
											type : "POST",
											datatype : "json",
											success : function(data) {

												$
														.each(
																data,
																function(i,
																		list) {
																	var _row = '<tr>'
																			+ '<td>'
																			+ list.userAddr
																			+ '</td>'
																			+ '<td>'
																			+ "<input type=\"button\" value=\"删除\" onclick=\"delRow\(this\)\">"
																			+ '</td>'
																			+ '</tr>'

																	$(
																			"#addrList")
																			.append(
																					_row);
																})
											}
										})
							});
		</script>

	</div>
</body>
</html>
