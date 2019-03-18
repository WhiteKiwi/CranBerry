<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="CranBerry.admin.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    &nbsp;&nbsp;&nbsp;  <!-- CALANDER 제목 -->
	<h1 style="color: #400101; margin-left: 10%; margin-top: 110px; font-size: 40pt"><b>CALANDER</b></h1>
	<!-- 본문 붉은 선 -->
	<div style="background-color: #BF0404; width: 90%; height: 2px; margin-left: 5%"></div>

     <form id="form1" runat="server">  
    <div>  
        <p style="text-align: center">  
   
        </p>  
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"  
            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"  
            ForeColor="#663399" ShowGridLines="True" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"  
            OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">  
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />  
            <SelectorStyle BackColor="#FFCC66" />  
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />  
            <OtherMonthDayStyle ForeColor="#CC9966" />  
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />  
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />  
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />  
        </asp:Calendar>  
        <br />  
        <b></b>  
        <asp:Label ID="LabelAction" runat="server"></asp:Label><br />  
        </b>  
    </div>  
    </form>  

</asp:Content>
