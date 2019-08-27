<%@ Page Title="" Language="C#" MasterPageFile="~/master/User.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="CranBerry.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
    <link rel='stylesheet' type='text/css' href='/assets/css/fullcalendar.css' />
<script type='text/javascript' src='/assets/js/jquery.js'></script>
<script type='text/javascript' src='/asstes/js/jquery-ui-custom.js'></script>
<script type='text/javascript' src='/assets/js/fullcalendar.min.js'></script>
<script type='text/javascript'>

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			editable: true,
			events: [
				{
					title: '창의융합문제 발견 페스티벌',
					start: new Date(2019,3 , 2)
				},
                {
					title: '1학기 1회고사 출제범위 공지',
					start: new Date(2019,3 , 5)
				},
                {
					title: '귀가',
					start: new Date(2019,3 , 5)
				},
                {
					title: '벚꽃제',
					start: new Date(2019,3 , 6)
				},
                {
					title: '블록(화) - 11/33/55',
					start: new Date(2019,3 , 8)
				},
                
				{
					title: '창작로봇 아이디어 공모전(서류)',
					start: new Date(2019, 3, 8),
					end: new Date(2019, 3, 15)
				},
                {
					title: '블록(화) - 22/44/66',
					start: new Date(2019, 3, 9)
				},
                {
					title: '4원 전국연합 학력평가(3)',
					start: new Date(2019,3 , 10)
				},
                {
					title: '체육대회(1,2)',
					start: new Date(2019,3 , 10)
				},
                {
					title: 'GA(1) / HR(2,3)',
					start: new Date(2019,3 , 11)
				},
                {
					title: '학교운영위원회(1분기)',
					start: new Date(2019,3 , 11)
				},
                {
					title: '졸업앨범 단체사진 촬영',
					start: new Date(2019,3 , 12)
				},
                {
					title: 'GA(2) / HR(1)',
					start: new Date(2019,3 , 18)
				},
                {
					title: '1인1능 계획서 마감',
					start: new Date(2019,3 , 18)
				},
                {
					title: '청소년 과학탐구 토론대회 본선',
					start: new Date(2019,3 , 22)
				},
                {
					title: '세족식',
					start: new Date(2019,3 , 24)
				},
                {
					title: '교원전문성 신장연수I',
					start: new Date(2019,3 , 25)
				},
                {
					title: 'TRF계획서 제출 마감',
					start: new Date(2019,3 , 26)
				},
                {
					title: '1분기례',
					start: new Date(2019,3 , 30)
				},
                {
					title: '1회고사',
					start: new Date(2019, 3, 29),
					end: new Date(2019, 4, 1)
				},
			]
		});
		
	});

</script>
<div id='calendar'></div>
    </asp:Content>