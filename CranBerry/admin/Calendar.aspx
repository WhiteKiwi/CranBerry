<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="CranBerry.admin.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <!-- CALANDER 제목 -->
	<h1 style="color: #400101; margin-left: 10%; margin-top: 110px; font-size: 40pt"><b>CALANDER</b></h1>
	<!-- 본문 붉은 선 -->
	<div style="background-color: #BF0404; width: 90%; height: 2px; margin-left: 5%"></div>

    
	
      <form id="form1" runat="server">
          <center>
     <asp:Calendar id="calendar1" runat="server" style="text-align:center; width: 1000px; height: 1000px;" SelectDayText="Hi">

           <OtherMonthDayStyle ForeColor="Gray">
           </OtherMonthDayStyle>
         <DayHeaderStyle Height="50px" ></DayHeaderStyle>

           <TitleStyle BackColor="Blue"
                       Height="50px"
                       ForeColor="White">
           </TitleStyle>

           <DayStyle BackColor="#FFFFFF" >
               
           </DayStyle>

           <SelectedDayStyle BackColor="LightGray"

                             Font-Bold="True">
           </SelectedDayStyle>

      </asp:Calendar>
         </center>
   </form>

</asp:Content>
