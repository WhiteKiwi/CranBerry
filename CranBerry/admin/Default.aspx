﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CranBerry.admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <form id="form1" runat="server">
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
	
        <!-- Notices -->
	<div class="notice-main" style="margin-left:150px;">
		<br />
		<br />
		<br />
		<h1 class="f0 text-red bold">NOTICE</h1>
		<br />
		<% var notices = CranBerry.Managers.NoticeManager.GetRecentNotices();
			foreach (var notice in notices) {
		%>
		<div>
			<a href="/admmin/Notice.aspx?id=<%= notice.Id %>" class="f4 notice-main-link"><%= notice.Title + "&nbsp; &nbsp; &nbsp;" + notice.NoticeAt.ToString("yyyy-MM-dd") %></a>
		    <hr style="border:solid 1px; color:#ff0000; width:100%" />
        </div>
		<% } %>
		<br />
		<br />
		<br />
	</div>
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

	

	<!-- About us -->
	<div class="cb-bg-red text-center text-white">
		<br />
		<br />
		<br />
		<h1 class="f0 bold">ABOUT US</h1>
		<br />
		<br />
		<p class="text-white">VaryBerry는 신입생들의 학교 적응을 돕기 위해 모인 재학생 단체입니다.</p>
		<p class="text-white">국어 시간, 신입생 길라잡이 포스터 제작에서 시작하여 벌써 큰사의 큰 페이지가 되었습니다.</p>
		<p class="text-white">오직, 신입생들을 위해 대가없이 노력하는 멋진 친구들을 기억해주세요!</p>
		<br />
		<br />
	</div>
	

	<!-- Copyright -->
	<div class="copyright f3">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>
    </form>
</asp:Content>