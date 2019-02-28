<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="CranBerry.admin.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
  &nbsp;&nbsp;&nbsp;  <!-- CALANDER 제목 -->
	<h1 style="color: #400101; margin-left: 10%; margin-top: 110px; font-size: 40pt"><b>CALANDER</b></h1>
	<!-- 본문 붉은 선 -->
	<div style="background-color: #BF0404; width: 90%; height: 2px; margin-left: 5%"></div>

    
	
    <!-- 월 -->   
	<p style="color: black; font-size: 30pt; margin-top: 110px;  margin-bottom: 60px; text-align:center;"><b>MARCH 3월</b></p>

    

  
	<table style="width: 80%; height:800px; border : 1px solid #707070; border-collapse: collapse; margin-left: 200px; font-size: 20pt; font-weight:bold; 	">
		
		<tr style="text-align:center; height: 70px; border:1px #000000 solid;">
			<th style="color : red; width: 14%">SUNDAY </th>
			<th style="width: 14%">MONDAY </th>
			<th style="width: 14%">TUESDAY </th>
			<th style="width: 14%">WEDNESDAY </th>
			<th style="width: 14%">THURSDAY </th>
			<th style="width: 14%">FRIDAY </th>
			<th style="color:blue; width: 14%">SATURDAY </th>
		</tr>

		<tr style="text-align: left; height: 150px	;">
			<th>
				<p class="Calander">  </p>
				<div style="height: 80%; font-size:15px;"></div>
			</th>
			<th>
				<p class="Calander"> </p>
				<div style="height: 80%;"></div>
			</th>
						<th>
				<p class="Calander">  </p>
				<div style="height: 80%;"></div>
			</th>
						<th>
				<p class="Calander"> </p>
				<div style="height: 80%;"></div>
			</th>
						<th>
				<p class="Calander"> </p>
				<div style="height: 80%;"></div>
			</th>
						<th>
							<p class="Calander" style="color:red;"> 1 삼일절</p>
							<div style="height: 80%; font-size:15px;">제 6회 입학식</div>
			</th>
						<th>
							<p class="Calander" style="color:blue;"> 4</p>
							<div style="height: 80%; font-size:15px;">개학<br/>선후배 상견례<br />수강과목 변경신청</div>
			</th>
		</tr>
		
		<tr style="text-align: left; height:150px;">
			<th>
				<p class="Calander" style="color:red;"> 3</p>
				<div style="height: 80%"></div>
			</th>
						<th>
				<p class="Calander">4</p>
				<div style="height: 80%; font-size:15px;">개학<br />선후배 상견례(7교시~CAS)<br />수강과목 변경신청(~3/11, 12:30)</div>
			</th>
						<th>
				<p class="Calander">5 </p>
				<div style="height: 80%; font-size:15px;">1학기 방과후학교 및 1인1기 <br/>수강신청(~3/8)<br />학생회장후보등록(~3/7)</div>
			</th>
						<th>
				<p class="Calander">6 경칩 </p>
				<div style="height: 80%; font-size:15px;">1학기 학급위원선출 및<br/>급훈선정</div>
			</th>
						<th>
				<p class="Calander">7</p>
				<div style="height: 80%; font-size:15px;">3월 전국연합학력평가</div>
			</th>
						<th>
				<p class="Calander">8 GA(전체)</p>
				<div style="height: 80%"></div>
			</th>
						<th>
				<p class="Calander" style="color:blue;">9</p>
				<div style="height: 80%"></div>
			</th>
		</tr>
		
		<tr style="text-align: left; height:150px;">
			<th>
				<p class="Calander" style="color:red;">10</p>
				<div style="height: 80%"></div>
			</th>
						<th>
				<p class="Calander">11</p>
				<div style="height: 80%; font-size:15px;">1학기 방과후학교 시작	<br/>학생회장 선거운동(~3/13)</div>
			</th>
						<th>
				<p class="Calander">12 </p>
				<div style="height: 80%; font-size:15px;"></div>
			</th>
						<th>
				<p class="Calander">13</p>
				<div style="height: 80%; font-size:15px;"></div>
			</th>
						<th>
				<p class="Calander">14</p>
				<div style="height: 80%; font-size:15px;">학생회장 선거토론회<br/>CNSA 수학의 날 행사</div>
			</th>
						<th>
				<p class="Calander">15</p>
				<div style="height: 80%; font-size:15px;">학생회장 선거<br/>귀가</div>
			</th>
						<th>
				<p class="Calander" style="color:blue;">16</p>
				<div style="height: 80%; font-size:15px;">FB리그 개막</div>
			</th>
		</tr>
		
		<tr style="text-align: left; height:150px;">
			<th>
				<p class="Calander" style="color:red;">17</p>
				<div style="height: 80%"></div>
			</th>
						<th>
				<p class="Calander">18</p>
				<div style="height: 80%; font-size:15px;"></div>
			</th>
						<th>
				<p class="Calander">19</p>
				<div style="height: 80%; font-size:15px;">수업컨설팅(~6/14)<br />동아리 발표회 및 박람회</div>
			</th>
						<th>
				<p class="Calander">20</p>
				<div style="height: 80%; font-size:15px;">학부모총회(학운위원 선출)<br/>학급별 학부모 간담회<br/>대입설명회</div>
			</th>
						<th>
				<p class="Calander">21</p>
				<div style="height: 80%; font-size:15px;">블록(월) - 11/33/55<br/>1분기 정기학생 대위원회</div>
			</th>
						<th>
				<p class="Calander">22</p>
				<div style="height: 80%; font-size:15px;">블록(월) - 22/44/66</div>
			</th>
						<th>
				<p class="Calander" style="color:blue;">23</p>
				<div style="height: 80%; font-size:15px;">영화를 말하다</div>
			</th>
		</tr>
		
		<tr style="text-align: left; height:150px;">
			<th>
				<p class="Calander" style="color:red;">24</p>
				<div style="height: 80%"></div>
			</th>
						<th>
				<p class="Calander">25</p>
				<div style="height: 80%; font-size:15px;">TRF 시행 공고</div>
			</th>
						<th>
				<p class="Calander">26</p>
				<div style="height: 80%; font-size:15px;">1인1능 계획서 초안 제출<br />과학실험경연대회 본선<br/>(EP1, EP2)</div>
			</th>
						<th>
				<p class="Calander">27</p>
				<div style="height: 80%; font-size:15px;">HR</div>
			</th>
						<th>
				<p class="Calander">28</p>
				<div style="height: 80%; font-size:15px;">Legend Festival I(재학생)</div>
			</th>
						<th>
				<p class="Calander">29</p>
				<div style="height: 80%; font-size:15px;">블록(월) - 22/44/66</div>
			</th>
						<th>
				<p class="Calander" style="color:blue;">30</p>
				<div style="height: 80%; font-size:15px;"></div>
			</th>
		</tr>
		
        <tr style="text-align: left; ">
						<th>
				<p class="Calander" style="color:red;"> 31</p>
				<div style="height: 80%"></div>
			</th>
			<th>
				<p class="Calander"></p>
				<div style="height: 80%"></div>
			</th>
			<th>
				<p class="Calander">  </p>
				<div style="height: 80%"></div>
			</th>
			<th>
				<p class="Calander">  </p>
				<div style="height: 80%"></div>
			</th>
			<th>
				<p class="Calander"> </p>
				<div style="height: 80%"></div>
			</th>
			<th>
				<p class="Calander">  </p>
				<div style="height: 80%"></div>
			</th>
			<th>
				<p class="Calander">  </p>
				<div style="height: 80%"></div>
			</th>
		</tr>
		

	</table>
 

    <!-- 저작권 문구 바 -->
	<div class="copyright f3">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>

</asp:Content>
