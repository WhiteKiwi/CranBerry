<%@ Page Title="" Language="C#" MasterPageFile="~/master/User.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="CranBerry.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- 페이지 Top -->
	<h1 class="f0 bold text-darkred" style="margin-left: 130px;">Q&A</h1>
	<div class="w-100" style="padding: 10px 130px 30px 130px;">
		<div class="cb-bg-red w-100" style="height: 3px;"></div>
	</div>

	<!-- Question Box -->
	<div class="border border-secondary p-5" style="position: relative; margin: 0 130px 0 130px;">
		<%
			int id;
			try {
				id = int.Parse(Request.QueryString["id"]);
			} catch (Exception e) {
				id = 1;
			}

			var question = CranBerry.Managers.QnAManager.GetQnA(id);
			if (question.Answer != "0") {
		%>

		<!-- 답변 완료 시 표시 -->
		<div class="answer-rectangle bold">
			<span>답변<br>
				완료</span>
		</div>
		<% } %>
		<!-- 질문 제목 -->
		<br>
		<br>
		<h1 class="text-darkred bold float-left" style="margin: -12px 7px 0 7px;">Q.</h1>
		<h3 class="bold"><%= question.Title %></h3>
		<h5 class="float-right bold" style="margin: -6px 130px 0 0;">등록일: <%= question.QuestionAt.ToString("yyyy-MM-dd") %></h5>
		<div class="cb-bg-red w-100" style="height: 2px; margin-top: 25px;"></div>
		<br>

		<!-- 질문 내용 -->
		<div class="color-black"><%= question.Contents %></div>
		<br>
		<hr>

		<!-- 답변 존재 시 출력 -->
		<div class="p-2">
			<div style="background-color: #D45858; height: 47px; width: 15px; float: left;"></div>
			<h3 class="color-darkred" style="margin-left: 30px; padding-top: 6px;"><b>답변 내용</b></h3>
		</div>
		<br>
		<div class="p-4 border border-secondary"><%= question.Answer == "0" ? "답변 대기중입니다. 잠시만 기다려주세요 :)" : question.Answer %></div>
		<br>
	</div>
	<br>
	<br>
	<div class="w-100">
		<a href="/QnA.aspx" class="btn btn-square float-right cb-bg-darkred text-white" style="height: 38px; margin-right: 120px;" role="button">목록</a>
	</div>
	<br>
	<br>
	<br>

	<!-- Copyright -->
	<div class="copyright f3 text-white cb-bg-red">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>
</asp:Content>
