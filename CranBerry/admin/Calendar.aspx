<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="CranBerry.admin.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <!-- CALANDER 제목 -->
	<h1 style="color: #400101; margin-left: 10%; margin-top: 110px; font-size: 40pt"><b>CALANDER</b></h1>
	<!-- 본문 붉은 선 -->
	<div style="background-color: #BF0404; width: 90%; height: 2px; margin-left: 5%"></div>

    
	
    <!-- 월 -->   
	<p style="color: black; font-size: 30pt; margin-top: 110px;  margin-bottom: 60px; margin-left: 44%"><b>NOVEMBER 11</b></p>

    <!-- 왼쪽 화살표 -->
    <div style="width: 10%; float: left; margin-top: 400px; text-align: center; font-size: 25pt">&lt;</div>
	
	<!-- 오른쪽 화살표 -->
	<div style="width: 10%; float: right; margin-top: 400px; text-align: center; font-size: 25pt">&gt;</div>

    <div style="width: 80%; height:800px; border : 1px solid #707070; border-collapse: collapse; font-size: 20pt; font-weight:bold">
         <asp:Table ID="tblCalendar" runat="server" BorderStyle="Solid" BorderColor="Black">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableHeaderCell></asp:TableHeaderCell>
            </asp:TableRow>
        </asp:Table>
        </div>
</asp:Content>
