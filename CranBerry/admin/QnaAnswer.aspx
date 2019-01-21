<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QnaAnswer.aspx.cs" Inherits="CranBerry.QnaAnswerr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="Login.css" rel="Login"/>    

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--CRANBERRY 툴바-->
<div style="width: 1920px; height: 155px; background-color: #BF0404; float: top">
<div style="width: 1920px; height: 10px"></div>
<table>
<tr>
<td><span style="margin-left: 30px"></span></td>
<td>
<img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.15752-9/50140794_1967936896624249_2193767319388291072_n.png?_nc_cat=108&_nc_ht=scontent-icn1-1.xx&oh=c9b2da2da16afac0bbf31040a0ec1cd4&oe=5CBF25DE"
alt="크랜베리 로고" width="110"></td>
<td><span style="color: white; font-size: 60px; margin-left: 70px">CRANBERRY</span></td>
<td><span style="color: white; margin-left: 580px; font-size: 30px">Notice</span></td>
<td><span style="color: white; margin-left: 67px; font-size: 30px">Berries</span></td>
<td><span style="color: white; margin-left: 67px; font-size: 30px">Calander</span></td>
<td><span style="color: white; margin-left: 67px; font-size: 30px">Q&A</span></td>
<td><span style="color: white; margin-left: 67px; font-size: 30px">Info</span></td>
</tr>
</table>
<hr style="border: 2px solid white; background-color: white; margin-bottom: 15px">
</div>
<!--추가 툴바-->
<div style="width: 1920px; height: 72px; background-color: #B5B5B5">
<div style="width: 1920px; height: 20px"></div>
<span style="color: white; margin-left: 308px; font-size: 25px">공지추가</span>
<span style="color: white; margin-left: 80px; font-size: 25px">일정추가</span>
<span style="color: white; margin-left: 80px; font-size: 25px">Berry추가</span>
<span style="color: white; margin-left: 80px; font-size: 25px">Beryy제안관리</span>
<span style="color: white; margin-left: 80px; font-size: 25px">동아리</span>
<span style="color: white; margin-left: 80px; font-size: 25px">Berry조회수</span>
<span style="color: white; margin-left: 80px; font-size: 25px">Ban</span>
</div>

<div style="width: 1920px">
<!--사진-->
<img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.15752-9/49745756_2347222058826851_6098154240859963392_n.png?_nc_cat=107&_nc_ht=scontent-icn1-1.xx&oh=b33505dd95e2590b32f1bbf3dac3bbac&oe=5CC2E9C1"
alt="배너 사진" width="1920" height="450"></img>


<!--제목, 검색 박스-->
<table style="margin-left:850px; margin-top: 60px">
<tr>
<td style="width: 150px; height: 60px; background-color: white; border:1px solid #757575;  border-radius: 0.4em">
<p style="color: #757575; font-size: 25px; margin-left: 20px; text-align: center">제목</p></td>
<td style="width: 20px"></td>
<td style="width: 600px; height: 60px; background-color: white; border:1px solid #757575; border-radius: 0.4em"></td>
<td style="width: 30px"></td>
<!--검색 버튼-->
<td style="margin-left: 1570px; margin- margin-top: 60px; margin-bottom: 20px; width: 120px; height: 70px; background-color: #400101;
border-radius: 0.4em; font-size: 25px; color: white; text-align: center">검색
</td>
</tr>
</table>




<!--Q&A 제목-->
<h1 style="color: #400101; margin-left: 160px; font-size: 55px"><b>Q&A</b></h1>
<hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 1800px; margin-left: 55px">

<!--제일 큰 박스-->
<table style="width: 1550px; height: 886px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 60px; margin-bottom: 60px">
<tr>
<td>

<!--여백-->
<div style="height: 100px"></div>

<!--Q&A 소제목-->
<span style="color: #400101; margin-left: 80px; margin-top: 20px; font-size: 65px">Q.</b>
    <asp:Label ID="lblTitle1" runat="server"></asp:Label>

<span style="color: black; margin-top: 20px; margin-left:350px; font-size: 25px"><b>등록일시 : 2018-10-26 20:45</b>
</span>
</span>
</span>
<hr style="border: 1px solid #BF0404; background-color: #BF0404; width: 1500px; margin-top: 13px">

<!--작은 박스1-->
<table style="width: 1430px; height: 250px; background-color: white; border:1px solid #707070;
 margin-left: 55px; margin-top: 60px">
<tr>
<td>
<span style="width: 1430px; height: 220px; margin-top: 30px"><span>
    <asp:Label ID="lblTitle2" runat="server"></asp:Label>

</td>
</tr>
</table>


<!--답변내용 소제목-->
<table style="margin-left: 60px; margin-top: 30px">
<tr>
<td style="background-color: #D45858; width: 20px; height: 65px"></td>
<td><span style="font-family: Segoe UI; color: #400101; margin-left:20px; font-size: 35px"><b>답변내용</b></span></td>
</tr>
</table>

<!--작은 박스2-->
<table style="width: 1430px; height: 220px; background-color: white; border:1px solid #707070;
 margin-left: 55px; margin-top: 12px; margin-bottom: 90px">
<tr>
<td>
<span style="width: 1430px; height: 20px; margin-top: 30px"><span>
    <asp:Label ID="lblAnswer" runat="server"></asp:Label>

</td>
</tr>
</table>

</td>
</tr>
</table>

<!--답변 등록-->
<span style="font-family: Segoe UI; color: #400101; margin-left: 200px; font-size: 35px"><b>답변 등록</b></span></td>
</tr>
<table style="width: 1550px; height: 220px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 12px; margin-bottom: 90px">
<tr>
<td>
<span style="width: 1430px; height: 20px; margin-top: 30px"><span>
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
<td style="width: 20px">
</td>
<td>
    <asp:Button ID="btnWrite" runat="server" width="120px" Height="70px" OnClick="btnWrite_Click" CssClass="Button"  />
</td>
</tr>
</table>

<!--저작권 문구-->
<p style="color: #757575; font-size: 27px; text-align: center; padding-top: 12px">2018 Copyright © Team VaryBerry All Right Reserved.</p>

        </div>
    </form>
</body>
</html>
