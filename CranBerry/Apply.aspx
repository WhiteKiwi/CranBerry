<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply.aspx.cs" Inherits="CranBerry.Apply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
</head>
<body style="text-align: center;">

        <div>
            <form runat="server" style="height: 100%; text-align: center;">
			
				<div style="background-image: url('assets/img/banner.png');height: 509px;width: 1587px;margin-left: 150px;">
		<div style="background-color: rgba(0,0,0,0.60);height: 509px;width: 1587px;color: white;font-family: nanumbarunpenr;font-size: 25px;">
			<span>
				<p style="font-size: 40px;text-align:left;margin-left: 200px;"> CranBerry 6기 관리진 모집</p>
				<br />
				<br/>
				<br/>
				<br />
				학번
				<asp:TextBox ID="studentNumber" runat="server" />
				
				<asp:Button ID="CheckButton" runat="server" Text="지원 불러오기" OnClick="Checkbtn" />
				
				<br />
				수정본은 언제든지 다시 제출하면 됩니다!!
				<br />
				채점은 가장 최근에 제출한 것으로 합니다.
			</span>
		</div>
	</div>
                
			
				<br />
				<br />
					<h1 style="text-align:left;margin-left:200px; font-family: 'NanumSquare'">Q1. 해시태그 3개를 이용하여 자신을 소개해주세요. - 200자 이상</h1>
                <div>
				<asp:TextBox ID="Answer1" runat="server" TextMode="MultiLine"  style="border:3px solid #BF0404 ;height: 300px;width: 80%;margin-bottom: 70px;border-radius:20px;" Rows="20" />
				</div>

				<h1 style="text-align:left;margin-left:200px; font-family: 'NanumSquare'">Q2. VaryBerry 6기 관리진에 지원한 동기를 말해주세요. - 200자 이상</h1>
                <div>
				<asp:TextBox ID="Answer2" runat="server" TextMode="MultiLine"  style="border:3px solid #BF0404 ;height: 300px;width: 80%;margin-bottom: 70px;border-radius:20px;" Rows="20" />
				</div>
                
                <h1 style="text-align:left;margin-left:200px; font-family: 'NanumSquare'">Q3. 자유주제로 Berry를 작성해주세요.(참고: http://cnsaberry.com/Berries.aspx ) - 200자 이상</h1>
                <div>
				<asp:TextBox ID="Answer3" runat="server" TextMode="MultiLine"  style="border:3px solid #BF0404 ;height: 300px;width: 80%;margin-bottom: 70px;border-radius:20px;" Rows="20" />
				</div>
                
                <p style="float: left; margin-bottom: 15px; font-size:20px; margin-left: 50px;">공지사항을 읽지 않으셨다면 불이익을 받지 않기 위해서 꼭 필독하시기 바랍니다! <br> 처음 등록 하시면 "등록" 버튼을 / 지원 불러오기로 수정하는 거면 "수정완료"버튼을 눌러주세요. 튕김 현상이 일어날 수 있습니다. 복사해놓은 후 제출해주세요!</p>
				<br />
				<br />
				<asp:Button ID="UploadButton" runat="server" style="height:39px;width:195px; border-radius:15px; border-shadow:none; margin-right:40px; margin-bottom:50px;" CssClass="btn btn-primary float-right" OnClick="Applybtn" Text="등록"  /> 
               
				<asp:Button ID="EditButton" runat="server" style="height:39px;width:195px;  border-radius:15px; border-shadow:none; margin-right:40px;" Text="수정완료" OnClick="Editbtn" Height="39px" Width="195px" />
				<br />
				<br />
				<br />
			
		</form>
        </div>
   
</body>
</html>