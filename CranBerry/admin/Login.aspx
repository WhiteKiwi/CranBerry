<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CranBerry.Login" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<!-- Title -->
	<title>CranBerry</title>

	<!-- Icon -->
	<link rel="shortcut icon" href="/assets/img/favicon.png" />

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">

	<!-- Custom Style -->
	<link rel="stylesheet" href="/assets/css/style.css?ver=0.1">
	<link rel="stylesheet" href="/assets/css/colors.css?ver=0.1">
	<link rel="stylesheet" href="/assets/css/fonts.css?ver=0.1">
	<link rel="stylesheet" href="/assets/css/admin.css?ver=0.1">
</head>
<body>
	<!-- 상단 빨간 줄 -->
	<div class="fixed-top cb-bg-red w-100" style="height: 50px;"></div>

	<form runat="server" class="login-form">
		<h1 class="f0" style="color: #BF0404;">CRANBERRY</h1>
		<h3 class="f2" style="color: #757575;">MANAGER PAGE</h3>
		<br />
		<div>
			<span class="login-input-box">
				<asp:TextBox runat="server" ID="UserID" CssClass="form-control" placeholder="ID"></asp:TextBox><br>
				<asp:TextBox runat="server" ID="UserPW" CssClass="form-control" placeholder="PW"></asp:TextBox>
			</span>
			<span>
				<asp:Button runat="server" ID="LoginButton" Text="로그인" CssClass="login-button cb-bg-red border-0 text-white f3 bold" />
			</span>
		</div>
		<br />
		<div class="cb-bg-red w-100" style="height: 4px;"></div>
		<div class="cb-bg-red w-100" style="height: 1px; margin: 7px 0 7px 0;"></div>
		<div class="cb-bg-red w-100" style="height: 4px;"></div>
	</form>

	<!-- 하단 빨간 줄 -->
	<div class="fixed-bottom cb-bg-red w-100" style="height: 50px;"></div>
</body>
</html>
