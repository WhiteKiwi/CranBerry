<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="CranBerry.admin.Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />

	<!-- Notice -->
	<div style="width: 100%; padding-top: 50px; padding-left: 100px; padding-right: 100px; text-align: left;">
		<h3><strong>공지사항</strong></h3>
        <div class="Button" style="height:50px;">
	  <a href="EditNotice.aspx?id=<%= notice.Id %>" style="color: #707070; font-size: 10pt">수정</a></div>
		<hr class="hr-red" />
		<form runat="server">
			<span class="float-left" style="margin-left: 17px; margin-right: 30px;">제목</span>
			<span class="float-left" style="text-align: center;">
				<asp:Label ID="nTitle" runat="server" /></span>
			<span class="float-right" style="margin-left: 30px; margin-right: 37px;">
				<asp:Label ID="NoticeAt" runat="server" /></span>
			<span class="float-right" style="text-align: center;">공지일</span>
		</form>
		<br />
		<hr class="hr-red" />
		<div style="margin-left: 20px; margin-right: 20px;">
			<asp:Label ID="Contents" runat="server" />
		</div>
		<br />
	</div>

	<br />
	<div style="width: 100%; text-align: right;">
		<a href="/Notices.aspx" class="btn cb-bg-darkred text-white" style="margin-right: 120px;" role="button">목록</a>
	</div>

	<br />
	<br />

	<!-- Copyright -->
	<div class="copyright f3 text-white cb-bg-red">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>
</asp:Content>
