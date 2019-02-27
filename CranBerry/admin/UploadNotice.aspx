<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="CranBerry.admin.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <form id="form1" runat="server">
    <!-- 공지추가제목 -->    
	<h1 class="PageTitle"><b>공지 추가</b></h1>
	<!-- 본문 붉은 선 -->
	<div class="RedHr"></div>
    

    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목</b></div>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="Box" style=" height: 50px; margin-bottom : 2%; width: 1000px;" />
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
    
        <asp:TextBox runat="server" ID="txtContents" CssClass="Box" style="height: 530px; width: 1000px;" />
	</div>

    <!-- 바이트 -->
    <div style="color: #707070; font-size: 10pt; margin-left: 14%">0/10000byte</div>


    <!-- 저장버튼 -->
	<div style="width: 89%; height: 70px; text-align: center; margin-bottom: 350px">
	 <div class="Button" style="margin-left: 1%">
	 
          <asp:Button ID="txtSave" OnClick="txtSave_Click" runat="server" style="float: right; width: 100px; font-size: 13pt; margin-bottom: 5px" Text="저장"/></div>
	  </div>


    <!-- 저작권 문구 바 -->
    <div class="Copyright">
    <p class="CopyrightF">
	2018 Copyright © Team VaryBerry All Right Reserved.</p>
	</div>

    

    </form>

    </asp:Content>