<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="UploadBerry.aspx.cs" Inherits="CranBerry.admin.UploadBerry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />


	<!-- BERRY추가 제목 -->    
	<h1 class="PageTitle"><b>BERRY 추가</b></h1>
	<!-- 본문 붉은 선 -->
	<div class="RedHr"></div>
    
    <!-- Berry 번호 박스 -->
    <div class="SmallTitle"><b>BERRY 번호</b></div>
    <asp:TextBox ID="BerryId" runat="server" class="Box" style=" height: 50px; margin-bottom : 2%;" />

    <!-- Berry 분류 박스 -->
	<div class="SmallTitle"><b>BERRY 분류</b></div>
    <asp:TextBox ID="BerryClassification" runat="server" class="Box" style=" height: 50px; margin-bottom : 2%;" />



    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목</b></div>
        <asp:TextBox ID="BerryTitle" runat="server" class="Box" style=" height: 50px; margin-bottom : 2%;" />
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
     <asp:TextBox ID="BerryContent" runat="server" class="Box" style="height: 530px"></asp:TextBox>
	</div>

    <!-- 바이트 -->
    <div style="color: #707070; font-size: 10pt; margin-left: 14%">0/10000byte</div> 


    <!-- 되돌리기/글쓰기 버튼 -->
	<div style="width: 89%; height: 70px; text-align: center; margin-bottom: 350px">
	 <div>
	  <asp:Button ID="SaveButton" OnClick="SaveButton_Click" runat="server" style="float: right; width: 100px; font-size: 13pt; margin-bottom: 5px" Text="저장"/></div>
    </div>
    <!-- 저작권 문구 바 -->
    <div class="Copyright">
    <p class="CopyrightF">
	2018 Copyright © Team VaryBerry All Right Reserved.</p>
	</div>
</asp:Content>
