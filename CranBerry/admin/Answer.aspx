<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Answer.aspx.cs" Inherits="CranBerry.admin.Answer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <form runat="server">
        <head>
            <meta charset="utf-8" />
            <title>관리자페이지-Q&A답변</title>
            <style>
                p, h1, span, div {
                    font-family: Segoe UI;
                }
                .auto-style1 {
                    width: 1241px;
                }
                .auto-style2 {
                    width: 1623px;
                }
            </style>
        </head>
        <body>
          <%
              int id;
              try {
                  id = int.Parse(Request.QueryString["id"]);
              } catch (Exception e) {
                  id = 1;
              }
              var question = CranBerry.Managers.QnAManager.GetQnA(id);


		%>

	
          

                    <!--Q&A 제목-->
                    <h1 style="color: #400101; margin-left: 160px; font-size: 55px"><b>Q&A</b></h1>
                    <hr style="border: 2px solid #BF0404; background-color: #BF0404; width: 1800px; margin-left: 55px">

                    <!--제일 큰 박스-->
            <div style="margin-left:170px">
                    <asp:Button ID="DeleteButton" runat="server" Text="삭제"  OnClick="DeleteButton_Click" /></div>
                    <table style="width: 1550px; height: 886px; background-color: white; border: 1px solid #707070; margin-left: 170px; margin-top: 60px; margin-bottom: 60px">
                    
                        <tr>
                            <td class="auto-style2">

                                <!--여백-->
                                <div style="height: 100px"></div>

                                <!--Q&A 소제목-->
                                <span style="color: #400101; margin-left: 80px; margin-top: 20px; font-size: 65px">Q.</b>
                                    <span style="color: black; margin-top: 20px; margin-left: 15px; font-size: 35px"><b><%=question.Title %></b>
                                       
                                        <span style="color: black; margin-top: 20px; margin-left: 350px; font-size: 25px"><b>등록일시 : 2018-10-26 20:45</b>
                                        </span>
                                    </span>
                                </span>
                                <hr style="border: 1px solid #BF0404; background-color: #BF0404; width: 1500px; margin-top: 13px">

                                <!--작은 박스1-->
                                <table style="width: 1200px; height: 250px; background-color: white; border: 1px solid #707070; margin-left: 55px; margin-top: 60px">
                                    <tr>
                                       
                                            <span style="width: 1000px; height: 220px; margin-top: 30px"><span>
                                                	<div class="border border-secondary p-5" style="position: relative; margin: 0 130px 0 130px; height: 250px; width: 1400px;">
                                                         
                                        <% 
                                            
                                            if (question.Answer != "0")
                                            {
                                            %>
<div class="answer-rectangle bold">
			<span>답변<br>
				완료</span>
		</div>
                                                        <%} %>
                                            <p style="margin-left: 60px; margin-top: 30px; font-size: 25px"><%= question.Contents %></p>
                                        </td>
                                    </tr>
                                </table>


                                <!--답변내용 소제목-->
               
                                <table style="margin-left: 60px; margin-top: 30px">
                                    <tr>
                                  
                                       
                                        <td><span style="font-family: Segoe UI; color: #400101; margin-left: 20px; font-size: 35px"><b>답변내용</b></span></td>
                                       
                                    </tr>
                                </table>
                   

                                <!--작은 박스2-->
                                <table style="width: 1430px; height: 220px; background-color: white; border: 1px solid #707070; margin-left: 55px; margin-top: 12px; margin-bottom: 90px">
                                    <tr>
                                        <td>
                                            <span style="width: 1430px; height: 20px; margin-top: 30px"> <%= question.Answer == "0" ? "답변 대기중입니다. 잠시만 기다려주세요 :)" : question.Answer %><span>
                                          
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>

                    <!--답변 등록-->
                    <asp:Button ID="AnswerButton" CssClass="btn float-right cb-bg-darkred text-white" runat="server" OnClick="AnswerButton_Click" Style="font-family: Segoe UI; color: #400101; margin-right: 170px; font-size: 35px" Text="답변 등록"></asp:Button>
                    
                        <tr>
                            <td>
                               
                                <asp:TextBox ID="Contents" runat="server" Style="margin-left: 200px; margin-top: 0px; font-size: 25px; color: #757575" Width="1534px" Height="216px" >답변을 등록해주세요.</asp:TextBox>
                            
                            </td>
                        </tr>
                    </table>

                 
                    <!--저작권 문구-->
                    <p style="color: #757575; font-size: 27px; text-align: center; padding-top: 12px">2018 Copyright © Team VaryBerry All Right Reserved.</p>

                </div>
        </body>

    </form>

   </asp:Content>