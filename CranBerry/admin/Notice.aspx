<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="CranBerry.admin.Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <!-- Top Image -->
        <form id="form1" runat="server">

   <%
       int id=1;
     try {
     	id = int.Parse(Request.QueryString["id"]);
     } catch (Exception e) {
      	id = 1;
      }
       var notice = CranBerry.Managers.NoticeManager.GetNoticeByID(id);
	%>

		


	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />

	<!-- Notice -->
	<div style="width: 100%; padding-top: 50px; padding-left: 100px; padding-right: 100px; text-align: left;">
		<h3><strong>공지사항</strong></h3>
     
        <asp:Button ID="ModifyButton" OnClick="ModifyButton_Click" runat="server" Text="수정" />
         <asp:Button ID="DeleteButton" OnClick="DeleteButton_Click" Text="삭제" runat="server" CssClass="btn cb-bg-darkred float-right text-white" Style="margin-right:50px;"/>
        <br />
        <br />
		<hr class="hr-red" /> 
			<span class="float-left" style="margin-left: 17px; margin-right: 30px;">제목</span>
			<span class="float-left" style="text-align: center;">
				<%=notice.Title %></span>
			<span class="float-right" style="margin-left: 30px; margin-right: 37px;">
				공지일:<%=notice.NoticeAt %></span>
			
	
		<br />
		<hr class="hr-red"  />
		<div style="margin-left: 20px; margin-right: 20px;">
			<%=notice.Contents %>
		</div>
		<br />
	</div>

	<br />
	<div style="width: 100%; text-align: right;">
		<a href="/admin/Notices.aspx" class="btn cb-bg-darkred text-white" style="margin-right: 120px;" role="button">목록</a>
	</div>

	<br />
	<br />
            </form>
    </span></span></asp:Content>