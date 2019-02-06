<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Answer.aspx.cs" Inherits="CranBerry.admin.Answer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
		<h1>글 번호</h1>
		<asp:TextBox runat="server" ID="QuestionID"></asp:TextBox><br /><br />
		<h1>답변 내용</h1>
		<asp:TextBox runat="server" ID="AnswerContent" TextMode="MultiLine" Rows="10" Width="100%"></asp:TextBox><br /><br /><br />
		<asp:Button runat="server" ID="AnswerButton" Text="답변 등록" OnClick="AnswerButton_Click" />
    </form>
</body>
</html>
