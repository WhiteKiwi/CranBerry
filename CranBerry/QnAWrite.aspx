﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QaAWrite.aspx.cs" Inherits="CranBerry.QaAwrite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--CRANBERRY 툴바-->
<div style="width: 1920px; height: 240px; background-color: #BF0404; float: top">
<div style="width: 1920px; height: 15px"></div>
<table>
<tr>
<td><span style="margin-left: 30px"></span></td>
<td><img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.15752-9/50140794_1967936896624249_2193767319388291072_n.png?_nc_cat=108&_nc_ht=scontent-icn1-1.xx&oh=c9b2da2da16afac0bbf31040a0ec1cd4&oe=5CBF25DE"
alt="크랜베리 로고" width="110"></td>
<td><span style="color: white; font-size: 60px; margin-left: 660px">CRANBERRY</span></td>
</tr>
</table>
<hr style="border: 2px solid white; background-color; margin-bottom: 15px">
<span style="color: white; margin-left: 600px; font-size: 30px">Notice</span>
<span style="color: white; margin-left: 80px; font-size: 30px">Berries</span>
<span style="color: white; margin-left: 80px; font-size: 30px">Calander</span>
<span style="color: white; margin-left: 80px; font-size: 30px">Q&A</span>
<span style="color: white; margin-left: 80px; font-size: 30px">Info</span>
<hr style="border: 2px solid white; background-color: white; margin-top: 15px">
</div>

<div style="width: 1920px">
<!--사진-->
<img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.15752-9/49745756_2347222058826851_6098154240859963392_n.png?_nc_cat=107&_nc_ht=scontent-icn1-1.xx&oh=b33505dd95e2590b32f1bbf3dac3bbac&oe=5CC2E9C1"
alt="배너 사진" width="1920" height="650"></img>


<!--Q&A 등록 제목-->
<h1 style="color: #400101; margin-left: 160px; margin-top: 110px; font-size: 55px"><b>Q&A 등록</b></h1>
<hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 1800px; margin-left: 55px">

<!--제목 박스-->
<table style="margin-left: 130px; margin-top: 60px">
<tr>
<td style="color: black; font-size: 35px; vertical-align: text-top"><b>제목</b>
</td>
<td style="width: 40px">
</td>
<td style="width: 1520px; height: 50px; background-color: white; border:1px solid #707070; margin-top: 60px">
    <asp:TextBox ID="txtTitle" runat="server" Width="1520px" Height="50px"></asp:TextBox>
</td>
</tr>
</table>

<!--내용 박스-->
<table style="margin-left: 130px; margin-top: 45px">
<tr>
<td style="color: black; font-size: 35px; vertical-align: text-top"><b>내용</b>
</td>
<td style="width:40px">
</td>
<td style="width: 1520px; height: 530px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 50px">
    <asp:TextBox ID="txtContent" runat="server" width="1520px" Height="530px"></asp:TextBox>
 </td>
 </tr>
</table>

<!--바이트-->
<div style="color: #707070; font-size: 30px; margin-left: 255px">0/10000byte</div>

</div>

<!--되돌리기/글쓰기 버튼-->
<table style="margin-left: 1440px; margin-top: 60px; margin-bottom: 150px">
<tr>
<td style="margin-left: 1440px; margin-top: 60px; margin-bottom: 37px; width: 120px; height: 70px; background-color: #703E3E; border-radius: 0.4em; text-align: center">
<img src="https://scontent-icn1-1.xx.fbcdn.net/v/t1.15752-9/49694550_2011936722437397_7232961076650835968_n.png?_nc_cat=109&_nc_ht=scontent-icn1-1.xx&oh=034251dcb9adcb974dd3341526dc06d6&oe=5CD10F30"
 alt="되돌리기 버튼" width="50" height="50"></td>
<td style="width: 20px">
</td>
<td style="margin-left: 1570px; margin- margin-top: 60px; margin-bottom: 20px; width: 120px; height: 70px; background-color: #400101;
border-radius: 0.4em; font-size: 25px; color: white; text-align: center">글쓰기
  <asp:Button ID="btnWrite" runat="server" Width="120px" Height="70px" Text="글쓰기" OnClick="btnWrite_Click"/>
</td>
</tr>
</table>

<!--정체불명 빨간색 바-->
<div style="margin-left: 80px; margin-bottom: 37px; width: 1740px; height: 20px; background-color: #BF0404"></div>

<!--저작권 문구 바-->
<div style="width: 1920px; height: 130px; background-color: #BF0404; margin-bottom: 37px">
<p style="color: white; font-size: 27px; text-align: center; padding-top: 12px">2018 Copyright © Team VaryBerry All Right Reserved.</p></div>


        </div>
    </form>
</body>
</html>
