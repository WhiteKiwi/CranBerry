<%@ Page Title="" Language="C#" MasterPageFile="~/master/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CranBerry.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
	<link rel="stylesheet" href="/assets/css/default.css?ver=0.1">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
	<!-- Carousel -->
	<div id="MainCarousel" class="carousel slide" data-ride="carousel">
		<!-- Carousel 하단 바 -->
		<ol class="carousel-indicators">
			<li data-target="#MainCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#MainCarousel" data-slide-to="1" class=""></li>
			<li data-target="#MainCarousel" data-slide-to="2" class=""></li>
			<li data-target="#MainCarousel" data-slide-to="3" class=""></li>
		</ol>

		<!-- Carousel 사진들 -->
		<div class="carousel-inner" style="height: 100%;">
			<div class="carousel-item active">
				<img class="berry-carousel-img" src="/assets/img/Event.jpg" />
			</div>

			<div class="carousel-item">
				<img class="berry-carousel-img" src="/assets/img/Facilities.jpg" />
			</div>

			<div class="carousel-item">
				<img class="berry-carousel-img" src="/assets/img/CNSA_Life.jpg" />
			</div>

			<div class="carousel-item">
				<img class="berry-carousel-img" src="/assets/img/Organization.jpg" />
			</div>
		</div>

		<!-- Carousel 이전, 다음 버튼 -->
		<a class="carousel-control-prev" href="#MainCarousel" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#MainCarousel" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- 흰 블록 -->
	<div class="bg-white" style="height: 30px;"></div>
	<!-- 붉은 선 -->
	<div class="cb-bg-red" style="height: 2px;"></div>
	<!-- Go Berries -->
	<div class="bg-white text-center" style="margin: 40px;">
		<a href="/Berries.aspx" class="btn-go-berries bold text-black">GO BERRIES</a>
	</div>
	<!-- 붉은 선 -->
	<div class="cb-bg-red" style="height: 2px;"></div>

	<!-- About CranBerry -->
	<div class="text-center m-5">
		<h1 class="f0 text-red bold">ABOUT CRANBERRY</h1>
		<br />
		<p class="f4" style="margin-bottom: 10px;">신입생에게 충남삼성고등학교는 낯설고 익숙하지 않는 장소입니다.</p>
		<p class="f4" style="margin-bottom: 10px;">중학교와 다른 점이 너무나도 많은 본교에서 신입생이 홀로 빠르게 적응하기란 쉽지 않습니다.</p>
		<p class="f4" style="margin-bottom: 10px;">"CranBerry"는 넥타이 매는 법을 몰랐던 선배들의 미숙했던 시절을 떠올리며,</p>
		<p class="f4" style="margin-bottom: 10px;">신입생들의 빠른 학교 적응을 바라며 만들었습니다.</p>
		<p class="f4" style="margin-bottom: 10px;">먼저 CNSA를 경험한 선배들의 진심어린 조언을 본 페이지에 담아</p>
		<p class="f4" style="margin-bottom: 10px;">신입생 여러분들이 조금이나마 더 편한 학교생활을 즐길 수 있도록 노력하겠습니다.</p>
		<br />
		<p class="f4" style="margin-bottom: 10px;">"CranBerry"는 2018년도를 기준으로 작되었습니다.</p>
		<p class="f4" style="margin-bottom: 10px;">지속적으로 관리해 나갈 예정이지만 2019년도와 차이가 있을 수 있음을 알려드립니다.</p>
		<p class="f4" style="margin-bottom: 10px;">신입생 여러분의 학교 적응에 VaryBerry가 많은 도움이 되었으면 좋겠습니다 :)</p>
	</div>

	<!-- New Q&A -->
	<div class="text-center" style="background-color: rgba(0, 0, 0, 0.05); padding: 55px 0 30px 0;">
		<h1 class="f0 bold m-0">NEW Q&A</h1>
	</div>
	<div id="qnaCarouselIndicators" class="carousel slide" data-ride="carousel" style="background-color: rgba(0, 0, 0, 0.05);">
		<ol class="carousel-indicators">
			<li data-target="#qnaCarouselIndicators" data-slide-to="0" class="active" style="background-color: #707070;"></li>
			<li data-target="#qnaCarouselIndicators" data-slide-to="1" style="background-color: #707070;"></li>
			<li data-target="#qnaCarouselIndicators" data-slide-to="2" style="background-color: #707070;"></li>
		</ol>

		<div class="carousel-inner">
			<% for (int i = 0; i < 3; i++) { %>
			<div class="carousel-item<% if (i == 0) { Response.Write(" active"); } %>" style="padding-bottom: 100px;">
				<% 
					var questions = CranBerry.Managers.QnAManager.GetRecentQuestions();
					for (int j = 0; j < 3; j++) { %>
				<div class="qna-card p-2">
					<!-- 질문 -->
					<div style="padding-top: 25px;">
						<div class="f1 bold float-left" style="margin: 0 25px 0 25px;">Q.</div>
						<div class="f3 qna-title"><a href="/Question.aspx?id=<%= questions[i * 3 + j].Id %>"><%= questions[i * 3 + j].Title %></a></div>
					</div>


					<div style="padding: 20px;">
						<!-- 가로선 -->
						<div class="bg-secondary w-100" style="height: 1px;"></div>
						<!-- 작성일 -->
						<p class="f4" style="padding: 13px 10px 0 10px;">작성일: <%= questions[i * 3 + j].QuestionAt.ToString("yyyy-MM-dd") %></p>
						<!-- 가로선 -->
						<div class="bg-secondary w-100" style="height: 1px;"></div>
					</div>

					<!-- 질문 내용 -->
					<a href="/Question.aspx?id=<%= questions[i * 3 + j].Id %>" class="qna-contents"><%= questions[i * 3 + j].Contents %></a>
				</div>
				<% } %>
			</div>
			<% } %>
		</div>
		<a class="carousel-control-prev" href="#qnaCarouselIndicators" role="button" data-slide="prev">
			<span class="qna-carousel-control-icon" aria-hidden="true"><</span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#qnaCarouselIndicators" role="button" data-slide="next">
			<span class="qna-carousel-control-icon" aria-hidden="true">></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- Notices -->
	<div class="notice-main">
		<br />
		<br />
		<br />
		<h1 class="f0 text-red bold">NOTICE</h1>
		<br />
		<% var notices = CranBerry.Managers.NoticeManager.GetRecentNotices();
			foreach (var notice in notices) {
		%>
		<div>
			<a href="/Notice.aspx?id=<%= notice.Id %>" class="f4 notice-main-link"><%= notice.Title + "&nbsp; &nbsp; &nbsp;" + notice.NoticeAt.ToString("yyyy-MM-dd") %></a>
		</div>
		<% } %>
		<br />
		<br />
		<br />
	</div>

	<!-- About us -->
	<div class="cb-bg-red text-center text-white">
		<br />
		<br />
		<br />
		<h1 class="f0 bold">ABOUT US</h1>
		<br />
		<br />
		<p>VaryBerry는 신입생들의 학교 적응을 돕기 위해 모인 재학생 단체입니다.</p>
		<p>국어 시간, 신입생 길라잡이 포스터 제작에서 시작하여 벌써 큰사의 큰 페이지가 되었습니다.</p>
		<p>오직, 신입생들을 위해 대가없이 노력하는 멋진 친구들을 기억해주세요!</p>
		<br />
		<br />
	</div>
	<!-- Member -->
	<div class="all-varyberry">
		<!-- Beta -->
		<div class="team-varyberry" style="border-right: 0.5px solid #707070;">
			<img src="/assets/img/Beta.png" />
			<br />
			<br />
			<div>
				<!-- 역할 -->
				<div class="role f3">
					Director<br />
					Frontend Developer<br />
					Designer<br />
					Guide Leader<br />
					Guide Writer<br />
					<br />
					<br />
					<br />
					Photographer<br />
					로고 아이디어<br />
					BlueBerry 지원<br />
					개발 조언<br />
					<br />
					이름 아이디어<br />
					단체 작성 도움<br />
				</div>
				<!-- 이름 -->
				<div class="name f3">
					4기 장지훈<br />
					4기 김재훈<br />
					3기 김도연<br />
					3기 김영훈<br />
					4기 임채림<br />
					4기 공민선<br />
					4기 강범석<br />
					4기 이주원<br />
					3기 전민규<br />
					3기 조현준<br />
					김지민 T<br />
					1기 조성욱<br />
					2기 박민재<br />
					3기 박준서<br />
					4기 석기범
				</div>
			</div>
		</div>

		<!-- 1st -->
		<div class="team-varyberry">
			<img src="/assets/img/first.png" />
			<br />
			<br />
			<div>
				<!-- 역할 -->
				<div class="role f3">
					Leader<br />
					Frontend Developer<br />
					Designer<br />
					<br />
					Photographer<br />
					Manager<br />
					<br />
					<br />
					<br />
					<br />
				</div>
				<!-- 이름 -->
				<div class="name f3">
					4기 장지훈<br />
					4기 김재훈<br />
					3기 김도연<br />
					4기 최소정<br />
					3기 전민규<br />
					4기 임채림<br />
					4기 홍영서<br />
					4기 최다연<br />
					4기 나혜연<br />
					4기 함석운<br />
				</div>
			</div>
		</div>

		<!-- 2nd -->
		<div class="team-varyberry">
			<img src="/assets/img/second.png" />
			<br />
			<br />
			<div>
				<!-- 역할 -->
				<div class="role f3">
					Leader<br />
					Developer<br />
					Frontend Developer<br />
					<br />
					Backend Developer<br />
					<br />
					<br />
					Designer<br />
					Photographer<br />
					Manager<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
				</div>
				<!-- 이름 -->
				<div class="name f3">
					5기 김가을<br />
					4기 장지훈<br />
					5기 김지은<br />
					5기 이은성<br />
					5기 김병준<br />
					5기 서정민<br />
					5기 이준모<br />
					5기 정지우<br />
					5기 이시웅<br />
					4기 임채림<br />
					4기 홍영서<br />
					4기 최다연<br />
					4기 나혜연<br />
					4기 함석운<br />
					5기 조예슬<br />
					5기 김민성<br />
					5기 전혜원<br />
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>

	<!-- Copyright -->
	<div class="copyright f3">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>
</asp:Content>
