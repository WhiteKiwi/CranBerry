<%@ Page Title="" Language="C#" MasterPageFile="~/master/User.Master" AutoEventWireup="true" CodeBehind="UploadQuestion.aspx.cs" Inherits="CranBerry.UploadQuestion" %>

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
	<h1 class="f0 bold text-darkred" style="margin-left: 130px;">Q&A 등록</h1>
	<div class="w-100" style="padding: 10px 130px 30px 130px;">
		<div class="cb-bg-red w-100" style="height: 3px;"></div>
	</div>

	<!-- 안내사항 -->
	<div style="margin: 0 130px 0 130px;">
		<div class="jumbotron jumbotron-fluid border text-center" style="padding: 30px 30px 10px 30px; border-color: #95989A !important;">
			<h4>Q&A 작성 안내</h4>
			<br />
			<div class="text-left">
				<p>
					<strong>1. 제목에 질문하고자 하는 내용이 표현되어야 합니다.</strong><br />
					- 예를 들어 캐주얼 데이에 정복 조끼가 착용 가능한지 여부에 대해 질문해 주실 때 제목에는 "캐주얼 데이 조끼 착용 가능 여부" 처럼 작성해 주시기 바랍니다.
				</p>
				<p><strong>2. 질문의 의도가 교칙위반 이거나 BlueBerry의 목적에 맞지 않는 질문은 특별한 안내 없이 삭제 될 수 있습니다.</strong></p>
				<p>
					<strong>3. 문제집과 같은 개인차가 있는 질문은 명확한 답변이 어렵습니다.</strong><br />
					- 따라서 추천보다는 선배들이 많이 사용한 문제집과 같은 객관적인 사실을 답변해드립니다.<br />
					- 어디까지나 참고사항으로 여겨주시면 좋겠습니다.
				</p>
				<p>
					<strong>4. 질문하기 전 질문하고자 하는 내용이 Berries에 작성되어 있는지 확인해주시기 바랍니다.</strong><br />
					- 작성되어 있는 팁의 경우 답변의 우선순위가 낮아질 수 있습니다.
				</p>
				<p><strong>5. 20글자 이상 작성해주세요~</strong></p>
			</div>
		</div>
	</div>
	<br />

	<!-- Contents -->
	<form runat="server" style="margin: 0 130px 0 130px;">
		<div class="row">
			<div class="col-1" style="text-align: left;">
				<h4>제목</h4>
				<br />
				<br />
				<h4>내용</h4>
			</div>
			<div class="col-11">
				<asp:TextBox ID="nTitle" runat="server" Width="100%" />

				<br />
				<br />
				<br />

				<!-- Contents -->
				<asp:TextBox ID="Contents" runat="server" TextMode="MultiLine" Width="100%" Height="100%" placeholder="20글자 이상 작성해야 등록됩니다." />

				<br />
				<br />
				<asp:Button ID="QuestionButton" runat="server" CssClass="btn float-right cb-bg-darkred text-white" OnClick="QuestionUpload" Text="등록" />
			</div>
		</div>
	</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<!-- Copyright -->
	<div class="copyright f3 text-white cb-bg-red">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>
</asp:Content>
