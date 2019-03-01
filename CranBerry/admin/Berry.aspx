<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="CranBerry.admin.Accounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #7A8591;">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=0"><strong>행사</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=1"><strong>학교시설</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=2"><strong>CNSA 용어</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=3"><strong>생활/학습</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=4"><strong>인재관</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=5"><strong>동아리</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=6"><strong>단체</strong></a>
				</li>
				<li class="nav-item active" style="margin-left: 10px; margin-right: 10px;">
					<a class="nav-link" href="/admin/Berries.aspx?classification=7"><strong>대회</strong></a>
				</li>
			
			</ul>
		</div>
	</nav>

	<!-- 사이드바 제목, 크기 설정 -->
	<div class="col-3 border border-bottom-0 border-secondary text-left" style="padding: 1rem; float: left; overflow: auto;">
		<%
			CranBerry.Models.Classification classification;
			switch (Request.QueryString["classification"]) {
				case "0":
					classification = CranBerry.Models.Classification.Event;
					break;
				case "1":
					classification = CranBerry.Models.Classification.Facilities;
					break;
				case "2":
					classification = CranBerry.Models.Classification.CNSATerms;
					break;
				case "3":
					classification = CranBerry.Models.Classification.CNSALifeAndStudy;
					break;
				case "4":
					classification = CranBerry.Models.Classification.Dormitory;
					break;
				case "5":
					classification = CranBerry.Models.Classification.Club;
					break;
				case "6":
					classification = CranBerry.Models.Classification.Group;
					break;
				case "7":
					classification = CranBerry.Models.Classification.Contest;
					break;
				default:
					classification = CranBerry.Models.Classification.Event;
					break;
			}
			var berryList = CranBerry.Managers.BerryManager.GetBerriesByClassification(classification);

			int i = 0;
			foreach (var berry in berryList) { %>

		<div>
			<a href="/Berries.aspx?classification=<%=Request.QueryString["classification"] != null ? Request.QueryString["classification"] : "0" %>&berry=<%= berry.Id %>" class="text-dark">
				<span style="margin-left: 10px; margin-right: 20px;"><%= ++i  %></span><span><%= berry.Title %></span>
			</a>
		</div>
		<hr style="background-color: #95989A;" />
		<% } %>
	</div>

	<!-- 본문에 대한 코드 -->
	<div class=" col-9 container" style="text-align: left; float: left; padding: 2rem; position: relative;">
		<!-- 제목 -->
		<br />
		<%
			int berryId = 1;
			if (Request.QueryString["berry"] != null) {
				berryId = int.Parse(Request.QueryString["berry"]);
			} else {
				berryId = berryList[0].Id;
			}
			var requestBerry = CranBerry.Managers.BerryManager.GetBerryByID(berryId);
		%>
		<h1 style="margin-left: 1rem;"><%= requestBerry.Title %></h1>
        
        <!-- 수정삭제 -->
	 	  	 <div class="Wb">
	  <asp:Button ID="DeleteButton" OnClick="DeleteButton_Click" style="color: #707070; font-size: 10pt" Text="삭제" runat ="server"></asp:Button></div>
	 	 <div class="Wb">
	  <a href="/admin/EditBerry.aspx?select=Modify&BerryID=<%= Berry.ID%>" style="color: #707070; font-size: 10pt">수정</a></div>
	  </div>

		<hr style="border: 1px solid #95989A; background-color: #95989A;" />
		<div style="width: 100%; padding-top: 1rem; padding-left: 2rem; padding-right: 2rem;">
			<%= requestBerry.Contents %>
		</div>
		
		<br />
		<br />
		<br />
		<footer style="margin-top: 1.5em; margin-bottom: 1.5em; color: #C9C9C9; position: absolute; bottom: 0px; color: #C9C9C9;">
			<h6>2017 Copyright © Team VaryBerry All Right Reserved.</h6>
		</footer>
	
    </asp:Content>