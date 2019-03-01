<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="CranBerry.admin.Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <!-- Top Image -->
        <form id="form1" runat="server">
	<img src="/assets/img/banner.png" style="width: 100%;" />
   <%
       int id=1;
     try {
     	id = int.Parse(Request.QueryString["id"]);
     } catch (Exception e) {
      	id = 1;
      }
       var notice = CranBerry.Managers.NoticeManager.GetNoticeByID(id);
	%>
           <!-- Notice -->
	<div style="width: 100%; padding-top: 50px; padding-left: 100px; padding-right: 100px; text-align: left;">
		<h3><strong>공지사항</strong></h3>
        <div class="Button" style="height:50px;">
	  <a href="EditNotice.aspx?id=<%= notice.Id %>" style="color: #707070; font-size: 10pt">수정</a></div>
         <div class="Button" style="height:50px;">
	  <asp:Button ID="DeleteButton" OnClick="DeleteButton_Click" style="color: #707070; font-size: 10pt" runat="server" Text="삭제" /></div>
		<hr class="hr-red" />
		
			<span class="float-left" style="margin-left: 17px; margin-right: 30px;">제목</span>
        
			<span class="float-left" style="text-align: center;" </span>
        <div><%=notice.Title %></div>
		<div style="border: 2px solid #BF0404; background-color: #BF0404; width: 1800px; margin-left: 55px; margin-top: 30px"></div>
			<span class="float-right" style="margin-left: 30px; margin-right: 37px;">
				
			<div class="float-right" style="text-align: center; margin-right:300px" >공지일:<%=notice.NoticeAt %></div>
                
		
		<br />
         <div style="text-align:left">내용 </div>

		<hr class="hr-red" />
               
		<div style="margin-left: 20px; margin-right: 20px;" >
            <div><%=notice.Contents %></div>
            <div style="border: 2px solid #707070; background-color: #707070; width: 1800px; margin-left: 55px"></div>
			
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
        </span></span></span>
    </div>
            </form>
</asp:Content>
