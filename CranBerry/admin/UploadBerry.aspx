<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="UploadBerry.aspx.cs" Inherits="CranBerry.admin.UploadBerry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
	<form id="form1" runat="server">
	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />


	<!-- BERRY추가 제목 -->    
	<h1 style="margin-left:140px" class="PageTitle"><b>BERRY 추가</b></h1>
	<!-- 본문 붉은 선 -->
	<div style="margin-left:140px" class="RedHr"></div>
    
    <!-- Berry 번호 박스 -->
    <div style="margin-left:140px" class="SmallTitle"><b>BERRY 번호</b></div>
    <asp:TextBox ID="BerryId" runat="server" class="Box" style="margin-left:140px; height: 50px; margin-bottom : 2%;" />
        &nbsp;<div style="margin-left: 140px" class="SmallTitle"><b>BERBERRY 분류</b></div>
        <asp:DropDownList ID="ClassificationList" runat="server" style="margin-left:140px" OnSelectedIndexChanged="ClassificationList_SelectedIndexChanged">
            <asp:ListItem Selected="True">선택</asp:ListItem>
            <asp:ListItem>행사</asp:ListItem>
            <asp:ListItem>학교시설</asp:ListItem>
            <asp:ListItem>큰사용어</asp:ListItem>
            <asp:ListItem>생활/학습</asp:ListItem>
            <asp:ListItem>기숙사</asp:ListItem>
            <asp:ListItem>동아리</asp:ListItem>
            <asp:ListItem>단체</asp:ListItem>
            <asp:ListItem>대회</asp:ListItem>
        </asp:DropDownList>
        <div style="margin-top:30px;margin-left:120px"><p>첨부파일</p><asp:FileUpload Id="AttachFile" runat="server" type="file" />&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            (최대 4M)</div>
      
           
    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목></div>
        <asp:TextBox ID="BerryTitle" runat="server" class="Box" style=" margin-bottom : 2%;" Width="1354px" />
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
     <asp:TextBox ID="BerryContent" runat="server" class="Box" Height="423px" Width="1354px"></asp:TextBox>
	</div>
           
    <!-- 바이트 -->
   <%-- <div style="color: #707070; font-size: 10pt; margin-left: 14%">0/10000byte</div> --%>


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
    </form>
    </b>
</asp:Content>
