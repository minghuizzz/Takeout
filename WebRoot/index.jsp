<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">

<title>Welcome Page</title>


<link rel="stylesheet" type="text/css" href="css/style4.css" />
<link href="css/style5.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/local.css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-responsive.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

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

<body id="page">
	<div class="container" id="login">
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
					未登录，请<a data-toggle="modal" data-target="#loginModal"
						type="button" class="submit">登录</a>
					<a data-toggle="modal" data-target="#enrollModal"
						type="button" class="submit" data-dismiss="modal">注册</a>
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

		<div class="carousel slide" id="c1" data-ride="carousel"
			style="margin-top:20px;">
			<ol class="carousel-indicators">
				<li data-slide-to="0" data-target="#c1" class="active"></li>
				<li data-slide-to="1" data-target="#c1"></li>
				<li data-slide-to="2" data-target="#c1"></li>
				<li data-slide-to="3" data-target="#c1"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img alt="" src="images/l1.jpg" />
				</div>
				<div class="item">
					<img alt="" src="images/l2.jpg" />
				</div>
				<div class="item">
					<img alt="" src="images/l3.jpg" />
				</div>
				<div class="item">
					<img alt="" src="images/l4.jpg" />
				</div>
			</div>
			<a data-slide="next" href="#c1" class="right carousel-control">›</a>
			<a data-slide="prev" href="#c1" class="left carousel-control">‹</a>
		</div>
	</div>

	<div class="modal hide fade" id="loginModal">
		<div class="modal-header">
			<a href="#" class="close" data-dismiss="modal">X</a>
			<h4>登录</h4>
		</div>
		<form action="login.action" method="post">
			<div class="modal-body">
				<div class="control-group">
					<label class="control-label" for="inputName">用户名</label>
					<div class="controls">
						<input name="userName" type="text" id="inputName" placeholder="Input Your UserName">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputPassword">密码</label>
					<div class="controls">
						<input name="password" type="password" id="inputPassword"
							placeholder="Input Your Password">
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">登录</button>
					
				</div>
			</div>
		</form>
	</div>

	<div class="modal hide fade" id="enrollModal">
		<div class="modal-header">
			<a href="#" class="close" data-dismiss="modal">X</a>
			<h4>用户注册</h4>
		</div>
		<form id="reg" action="enroll.action" method="post" name="enrollForm">
			<div class="modal-body">
				<div class="control-group">
					<label class="control-label" for="inputName" >用户名</label>
					<div class="controls">
						<input name="enrollUserName" type="text" id="enrollName" placeholder="英文或者中文" 
							>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputPassword">密码</label>
					<div class="controls">
						<input name="enrollPassword" type="password" id="enrollPassword"
							placeholder="数字或者英文，长度为6-16"
							>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="confirmPassword">确认</label>
					<div class="controls">
						<input name="confirm_password" type="password" id="confirmPassword"
							placeholder="再次输入密码" >
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputPhoneNumber">手机号</label>
					<div class="controls">
						<input name="phoneNumber" type="text" id="phoneNumber"
							placeholder="输入11位手机号">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="inputSex">性别</label>
					<div class="controls">
						<input name="sex" type="text" id="inputSex"
							placeholder="输入男或者女" >
					</div>
				</div>

			</div>

			<div class="modal-footer">
				<button class="btn btn-primary" type="submit">提交</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					aria-hidden="true">退出</button>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function checkUserName() {//检查用户名长度
			var name = document.getElementById("enrollName").value;
			if (name.length<2 || name.length>8) {
				alert("用户名的长度必须大于2小于8");
				document.getElementById("enrollName").blur();
				return false;
			} else
				return true;

		}
		function checkPwdLength() {
			var name = document.getElementById("enrollPassword").value;
			if (name.length<6 || name.length>16) {
				alert("密码长度必须为6-16位");
				document.getElementById("enrollPassword").blur();
				return false;
			} else
				return true;
		}
		function checkConfirmPwd() {
			var pwd = document.getElementById("enrollPassword").value;
			var repwd = document.getElementById("confirmPassword").value;
			if (pwd != repwd) {
				alert("确认密码不正确，请重新输入");
				document.getElementById("confirmPassword").blur();
				return false;
			} else
				return true;
		}
		function checkPhoneNum() {
			var phone = document.getElementById("phoneNumber").value;
			if (phone.length != 11) {
				alert("请输入有效的手机号码");
				document.getElementById("phoneNumber").blur();
				return false;
			}
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (!myreg.test(phone)) {
				alert("请输入有效的手机号码");
				return false;
			} else
				return true;
		}
		function checkSex() {
			var sex = document.getElementById("inputSex").value;
			if ((sex != "man") || (sex != "woman")) {
				alert("输入性别有误");
				document.getElementById("enrollName").blur();
				return false;
			} else
				return true;
		}
		function checkAll(form) {
			if (!checkUserName() || !checkPwdLength() || !checkConfirmPwd()
					|| !checkPhoneNum()) {
				alert("表单输入错误，请检查输入内容");
				return false;
			} else
				document.enrollForm.submit();
		}
	</script>
</body>
</html>
