<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply.aspx.cs" Inherits="CranBerry.Apply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
</head>
<body>

        <div>
            <form runat="server" style="height: 100%; text-align: center;">
			<div style="margin-left: 50px; margin-right: 30px;">
				<div class="float-left" style="margin-right: 20px;">
					<h5>학번</h5>
				</div>
				<span class="float-left" style="margin-right: 20px;">
					<asp:TextBox ID="studentNumber" runat="server" />
				<asp:Button ID="Checkbtn" runat="server" Text="지원 불러오기" OnClick="Checkbtn_Click" style="background-color:#ff99ff; color: white; border-shadow:none; border-radius: 10px;" />
					<%--<asp:Button ID="CheckButton" runat="server" CssClass="btn btn-primary float-right" OnClick="ApplyCheck" Text="지원서 불러오기" />--%>
				</span>
				<br />
			
				<br />
				<br />
				<h5 style="float: left; margin-bottom: 15px; font-size:20px; margin-left: 50px;"> Q1. 크랜베리 개발자에 지원하게 된 동기는 무엇입니까? <br />또한 크래베리 개발자 활동 중 개인사정으로 인해 시간이 부족하여도 개발자에 열정적으로 임할 자신이 있나요?(최대 1200자)</h5>
				<asp:TextBox ID="Answer1" runat="server" TextMode="MultiLine"  style="width:90%; border:3px solid #ff6666; border-radius:30px; height: 300px;" Rows="20" />
				<br />
				<h5 style="float: left; margin-bottom: 15px; font-size:20px; margin-left: 50px;"> Q2. 자신을 한 문장으로 표현하세요.(최대 50자)</h5>
				<asp:TextBox ID="Answer2" runat="server" TextMode="MultiLine"  style="width:90%; border:3px solid #ff6666; border-radius:30px; height: 300px;" Rows="20" />
				<br />
				<h5 style="float: left; margin-bottom: 15px; font-size:20px; margin-left: 50px;"> Q3. 만약 신이 된다면 가장 먼저 하고 싶은 일은 무엇인가요? <br>   그리고 자신에게 가장 소중한 것은 무엇인가요? (500자 이상) - 창의력</h5>
				<asp:TextBox ID="Answer3" runat="server" TextMode="MultiLine"  style="width:90%; border:3px solid #ff6666; border-radius:30px; height: 300px;" Rows="20" />
				<br />
				<br />
				<p style="float: left; margin-bottom: 15px; font-size:20px; margin-left: 50px;">공지사항을 읽지 않으셨다면 불이익을 받지 않기 위해서 꼭 필독하시기 바랍니다! <br> 처음 등록 하시면 "등록" 버튼을 / 지원 불러오기로 수정하는 거면 "수정완료"버튼을 눌러주세요. 튕김 현상이 일어날 수 있습니다. 복사해놓은 후 제출해주세요!</p>
				<br />
				<br />
				<asp:Button ID="UploadButton" runat="server" style="height:39px;width:195px; background-color:#ff99ff; color:white; border-radius:15px; border-shadow:none; margin-right:40px;" CssClass="btn btn-primary float-right" OnClick="ApplyUpload" Text="등록"  /> 
                
				<asp:Button ID="Editbn" runat="server" style="height:39px;width:195px; background-color:#ff99ff; color:white; border-radius:15px; border-shadow:none; margin-right:40px;" Text="수정완료" OnClick="Editbtn" Height="39px" Width="195px" />
				<br />
				<br />
				<br />
			</div>
		</form>
        </div>
   
</body>
</html>