<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="EditBerry.aspx.cs" Inherits="CranBerry.admin.EditBerry" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">

    <form id="form1" runat="server">


<!--Berry추가 제목-->
<h1 style="color: #400101; margin-left: 160px; margin-top: 80px; font-size: 55px"><b>Berry수정</b></h1>
<hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 1800px; margin-left: 55px; margin-bottom: 30px">
           <%
               int id=1;
               try {
                   id = int.Parse(Request.QueryString["Id"]);
               } catch (Exception e) {
                   id = 1;
               }
               var berry = CranBerry.Managers.BerryManager.GetBerryByID(id);
	%>
<!--분류선택 박스-->
<table style="margin-left: 130px; margin-top: 60px">
<tr>
<td style="color: black; font-size: 35px; vertical-align: text-top"><b>분류선택</b>
</td>
<td style="width: 120px">
</td>
<td style="width: 1400px; height: 50px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 50px"><p style="font-size: 24px; color: #757575; margin-left: 25px">
 행사<asp:DropDownList ID="ClassificationList" runat="server" OnSelectedIndexChanged="ClassificationList_SelectedIndexChanged">
            <asp:ListItem>Event</asp:ListItem>
            <asp:ListItem>Facilities</asp:ListItem>
            <asp:ListItem>CNSATerms</asp:ListItem>
            <asp:ListItem>CNSALifeAndStudy</asp:ListItem>
            <asp:ListItem>Dormitory</asp:ListItem>
            <asp:ListItem>Club</asp:ListItem>
            <asp:ListItem>Group</asp:ListItem>
            <asp:ListItem>Contest</asp:ListItem>
        </asp:DropDownList>
    </p></td>
 </tr>
</table>

<!--제목 박스-->
<table style="margin-left: 130px; margin-top: 45px">
<tr>
<td style="color: black; font-size: 35px; vertical-align: text-top"><b>제목</b>
</td>
<td style="width: 190px">
</td>
<td style="width: 1400px; height: 50px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 50px"><p style="font-size: 24px; color: #757575; margin-left: 25px">
 <asp:TextBox ID="txtTItle" runat="server" ></asp:TextBox>
       </p></td>
 </tr>
</table>

<!--첨부파일 박스-->

<td style="width: 120px; height: 50px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 50px"><p style="font-size: 24px; color: #757575; margin-left: 25px">
 내 PC</p></td>
 </tr>
</table>

<!--내용 박스-->
<table style="margin-left: 130px; margin-top: 45px">
<tr>
<td style="color: black; font-size: 35px; vertical-align: text-top"><b>내용</b>
</td>
<td style="width: 190px">
</td>
<td style="width: 1400px; height: 510px; background-color: white; border:1px solid #707070;
 margin-left: 170px; margin-top: 50px"><p style="font-size: 24px; color: #757575; margin-left: 25px">
     <CKEditor:CKEditorControl ID="txtContent" BasePath="/assets/CKEditor/" runat="server" Text="<%=berry.contents %>"></CKEditor:CKEditorControl>

    </p></td>
 </tr>
</table>

<!--바이트-->
<div style="color: #707070; font-size: 30px; margin-left: 405px">0/10000byte</div>

<!--저장 버튼-->
<table style="margin-left: 1675px; margin-top: 30px; margin-bottom: 150px">
<tr>
<td style="margin-left: 1570px; margin- margin-top: 60px; margin-bottom: 20px; width: 120px; height: 70px; background-color: #400101;
border-radius: 0.4em; font-size: 25px; color: white; text-align: center">저장
    <asp:Button ID="BerrySaveButton" runat="server" Text="등록" OnClick="BerrySaveButton_Click" />
</td>
</tr>
</table>

<!--저작권 문구-->
<p style="color: #757575; font-size: 27px; text-align: center; padding-top: 12px">2018 Copyright © Team VaryBerry All Right Reserved.</p>

</div>

</body>
</html>
    </form>
    </asp:Content>