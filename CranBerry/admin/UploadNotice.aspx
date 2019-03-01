<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="UploadNotice.aspx.cs" Inherits="CranBerry.admin.UploadNotice" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <form id="form1" runat="server">
    <!-- 공지추가제목 -->    
        <div>
	<h1 class="f0 bold text-darkred" style="margin-left: 130px; margin-top: 50px;"><b>공지 추가</b></h1>
	<!-- 본문 붉은 선 -->
	<div class="RedHr"></div>
            </div>
    

    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목</b></div>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="Box" style=" margin-bottom : 2%; " Width="1135px" />
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
    
       <CKEditor:CKEditorControl ID="Content" BasePath="/assets/CKEditor/" runat="server"></CKEditor:CKEditorControl>
     

	</div>

 


    <!-- 저장버튼 -->
	<div style="width: 89%; height: 70px; text-align: center; margin-bottom: 350px">
	 <div class="Button" style="margin-left: 1%">
	 
         <div>
        <asp:Button ID="SaveButton"  CssClass="btn cb-bg-darkred float-right text-white" OnClick="SaveButton_Click" runat="server" Style="float: right; width: 100px; font-size: 13pt; margin-bottom: 5px" Text="저장" />
 </div>


    

    </form>

    </asp:Content>