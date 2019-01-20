<%@ Page Title="" Language="C#" MasterPageFile="~/master/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CranBerry.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
	<link rel="stylesheet" href="/assets/css/carousel.css?ver=0.1">
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
		<a href="/Berries" class="btn-go-berries bold text-black" >GO BERRIES</a>
	</div>
	<!-- 붉은 선 -->
	<div class="cb-bg-red" style="height: 2px;"></div>

	<!-- About CranBerry -->
	<div class="text-center m-5">
		<h1 class="text-red bold" style="font-size: 30pt;">ABOUT CRANBERRY</h1>
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
</asp:Content>
