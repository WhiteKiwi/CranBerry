<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="EditNotice.aspx.cs" Inherits="CranBerry.admin.EditNotice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
<!-- 공지수정제목 -->    
	<h1 class="PageTitle"><b>공지 수정</b></h1>
	<!-- 본문 붉은 선 -->
	<div class="RedHr"></div>
    

    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목</b></div>
     <asp:TextBox runat="server" ID="Title" CssClass="Box"  style=" height: 50px; margin-bottom : 2%" ></asp:TextBox> 
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
    <asp:TextBox runat="server" ID="Contents" CssClass="Box" style="height: 530px" ></asp:TextBox> 
	</div>

    <!-- 바이트 -->
    <div style="color: #707070; font-size: 10pt; margin-left: 14%">0/10000byte</div>


    <!-- 저장버튼 -->
	<div style="width: 89%; height: 70px; text-align: center; margin-bottom: 350px">
	 <asp:Button runat="server" ID="NoticeSaveButton" CssClass="Button" OnClick="NoticeSaveButton_Click" Text="저장" style="color: white; font-size: 13pt; margin-bottom: 5px; margin-left: 1%"></asp:Button>
	  </div>


    <!-- 저작권 문구 바 -->
    <div class="Copyright">
    <p class="CopyrightF">
	2018 Copyright © Team VaryBerry All Right Reserved.</p>
	</div>
</asp:Content>
