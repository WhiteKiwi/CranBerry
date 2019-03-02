<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="EditNotice.aspx.cs" Inherits="CranBerry.admin.EditNotice" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <form runat="server">
<!-- 공지수정제목 -->    
	<h1 class="PageTitle"><b>공지 수정</b></h1>
	<!-- 본문 붉은 선 -->
	<div class="RedHr"></div>
    

    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목</b></div>
     <asp:TextBox runat="server" ID="txtTitle" CssClass="Box"  style=" height: 50px; width: 1520px; margin-bottom : 2%" ></asp:TextBox> 
        
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
    <CKEditor:CKEditorControl ID="Contents" BasePath="/assets/CKEditor/" runat="server"></CKEditor:CKEditorControl>

	</div>

    <!-- 바이트 -->
    <div style="color: #707070; font-size: 10pt; margin-left: 14%">0/10000byte</div>


    <!-- 저장버튼 -->

	 <asp:Button runat="server" ID="NoticeButton" CssClass="Button" OnClick="NoticeButton_Click" Text="저장"  style="width: 89%; height: 70px; width:100px; float: right; text-align: center; margin-bottom: 350px"></asp:Button>
	  


    <!-- 저작권 문구 바 -->
    <div class="Copyright">
    <p class="CopyrightF">
	2018 Copyright © Team VaryBerry All Right Reserved.</p>
	</div>
        </form>
</asp:Content>
