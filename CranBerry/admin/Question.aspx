<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="CranBerry.admin.Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
	<form runat="server">
	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />
	<!--제목, 검색 박스-->
	<table style="margin-left: 850px; margin-top: 60px">
		<tr>
			<td style="width: 150px; height: 60px; background-color: white; border: 1px solid #757575; border-radius: 0.4em">
				<p style="color: #757575; font-size: 25px; margin-left: 20px; text-align: center">제목</p>
			</td>
			<td style="width: 20px"></td>
			<td style="width: 600px; height: 60px; background-color: white; border: 1px solid #757575; border-radius: 0.4em"></td>
			<td style="width: 30px"></td>
			<!--검색 버튼-->
			<td style="margin-left: 1570px; margin-top: 60px; margin-bottom: 20px; width: 120px; height: 70px; background-color: #400101; border-radius: 0.4em; font-size: 25px; color: white; text-align: center">검색
			</td>
		</tr>
	</table>




	<!--Q&A 제목-->
	<h1 style="color: #400101; margin-left: 160px; font-size: 55px"><b>Q&A</b></h1>
	<hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 1800px; margin-left: 55px">

	<!--제일 큰 박스-->
	<table style="width: 1550px; height: 886px; background-color: white; border: 1px solid #707070; margin-left: 170px; margin-top: 60px; margin-bottom: 60px">
		<tr>
			<td>

				<!--여백-->
				<div style="height: 100px"></div>

				<!--Q&A 소제목-->
				<span style="color: #400101; margin-left: 80px; margin-top: 20px; font-size: 65px"><b>Q.</b>
					<asp:Label ID="lblTitle1" runat="server"></asp:Label>

					<span style="color: black; margin-top: 20px; margin-left: 350px; font-size: 25px"><b>등록일시 : 2018-10-26 20:45</b>
					</span>
				</span>
				<hr style="border: 1px solid #BF0404; background-color: #BF0404; width: 1500px; margin-top: 13px">

				<!--작은 박스1-->
				<table style="width: 1430px; height: 250px; background-color: white; border: 1px solid #707070; margin-left: 55px; margin-top: 60px">
					<tr>
						<td>
							<span style="width: 1430px; height: 220px; margin-top: 30px"></span>
							<asp:Label ID="lblTitle2" runat="server"></asp:Label>

						</td>
					</tr>
				</table>


				<!--답변내용 소제목-->
				<table style="margin-left: 60px; margin-top: 30px">
					<tr>
						<td style="background-color: #D45858; width: 20px; height: 65px"></td>
						<td><span style="font-family: Segoe UI; color: #400101; margin-left: 20px; font-size: 35px"><b>답변내용</b></span></td>
					</tr>
				</table>

				<!--작은 박스2-->
				<table style="width: 1430px; height: 220px; background-color: white; border: 1px solid #707070; margin-left: 55px; margin-top: 12px; margin-bottom: 90px">
					<tr>
						<td>
							<span style="width: 1430px; height: 20px; margin-top: 30px"></span>
							<asp:Label ID="lblAnswer" runat="server"></asp:Label>

						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>

	<!--답변 등록-->
	<span style="font-family: Segoe UI; color: #400101; margin-left: 200px; font-size: 35px"><b>답변 등록</b></span>
	<table style="width: 1550px; height: 220px; background-color: white; border: 1px solid #707070; margin-left: 170px; margin-top: 12px; margin-bottom: 90px">
		<tr>
			<td>
				<span style="width: 1430px; height: 20px; margin-top: 30px"></span>
				<asp:TextBox ID="txtAnswer" runat="server" Width="1430px" Height="202px"></asp:TextBox>

			</td>
		</tr>
	</table>

	<!--되돌리기/저장 버튼-->
	<table style="margin-left: 1440px; margin-top: 60px; margin-bottom: 150px">
		<tr>
			<td style="margin-left: 1440px; margin-top: 60px; margin-bottom: 37px; width: 120px; height: 70px; background-color: #703E3E; border-radius: 0.4em; text-align: center">
				<img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.15752-9/49694550_2011936722437397_7232961076650835968_n.png?_nc_cat=109&_nc_ht=scontent-icn1-1.xx&oh=034251dcb9adcb974dd3341526dc06d6&oe=5CD10F30"
					alt="되돌리기 버튼" width="50" height="50"></td>
			<td style="width: 20px"></td>
			<td>
				<asp:Button ID="btnWrite" runat="server" Width="120px" Height="70px" OnClick="btnWrite_Click" CssClass="Button" />
			</td>
		</tr>
	</table>
		</form>
</asp:Content>
