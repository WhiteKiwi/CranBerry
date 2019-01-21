<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CranBerry.Login" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
       <div>
        <!--위에 상자-->
<div style="width: 1920px; height: 55px; background-color: #BF0404"></div>
<div style="height: 255px"></div>
<!--매니저 로그인 상자-->
           <table style="margin-left: 630px; margin-top: 60px">
               <tr>
                   <td style="width: 660px; height: 420px; background-color: white; border: 3px solid #BF0404; border-radius: 1em; margin-top: 60px">
                       <div style="color: #BF0404; font-size: 50px; margin-left: 195px; margin-top: 50px">CRANBERRY</div>
                       <div style="color: #757575; font-size: 30px; margin-left: 220px; margin-top: 5px; margin-bottom: 50px">MANAGER PAGE</div>
                       <!--ID-->
                       <table style="margin-left: 65px">
                           <tr>
                               <td style="width: 380px; height: 45px; background-color: white; border: 1px solid #757575">
                                   <asp:TextBox ID="txtId" runat="server" Height="44px" Width="376px" /></td>
                               <!--여백1-->
                               <td rowspan="3" style="width: 25px"></td>

                               <!--로그인 버튼-->
                               <td rowspan="3" style="width: 120px; height: 120px; background-color: #BF0404; border: 1px solid #BF0404; border-radius: 1em;">
                                   <asp:Button ID="BtnLogin" runat="server" Height="118px" Width="117px" Text="로그인" OnClick="BtnLogin_Click"></asp:Button></td>
                           </tr>

                           <!--여백2-->
                           <tr>
                               <td class="auto-style1"></td>
                           </tr>

                           <!--PASSWORD-->
                           <tr>
                               <td style="width: 380px; height: 45px; background-color: white; border: 1px solid #757575">
                                   <asp:TextBox ID="txtPassword" runat="server" Width="380px" Height="45px"></asp:TextBox></td>
                   </tr>
</table>

                       <hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 585px; margin-left: 15px; margin-top: 50px"/>
                   <hr style="border: 1px solid #BF0404; background-color: #BF0404; width: 585px; margin-left: 15px"/>
                   <hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 585px; margin-left: 15px; margin-bottom: 30px"/>
                   </td>
               </tr>
           </table>



<!--아래 상자-->
<div style="height: 255px"></div>
<div style="width: 1920px; height: 55px; background-color: #BF0404"></div>
           </div>
    </form>
</body>
</html>
