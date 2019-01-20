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


</asp:Content>
