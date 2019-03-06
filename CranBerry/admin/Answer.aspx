<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="Answer.aspx.cs" Inherits="CranBerry.admin.Answer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
 
    <form runat="server" defaultbutton="btnNull">
        
                 <div style="display:none;">
        <asp:Button ID="btnNull" runat="server" OnClientClick="return false" />
    </div>
	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- 페이지 Top -->
	<h1 class="f0 bold text-darkred" style="margin-left: 130px;">Q&A</h1>
     <asp:Button ID="DeleteButton" CssClass="btn cb-bg-darkred float-right text-white" runat="server" Text="삭제"  OnClick="DeleteButton_Click" style="width: 100px; float:right; margin-right:130px;" onclientclick="return DeleteItem();" />
                 <asp:Button ID="AddBan" runat="server" Text="Ban" OnClick="AddBan_Click" />
                 
	<div class="w-100" style="padding: 10px 130px 30px 130px;">
		<div class="cb-bg-red w-100" style="height: 3px;"></div>
	</div>
        
       <script type="text/javascript">
                    function DeleteItem() {
            if (confirm("삭제 하시겠습니다?")) {
                return true;
            }
            return false;
        }
 </script>

	<!-- Question Box -->
	<div class="border border-secondary p-5" style="position: relative; margin: 0 130px 0 130px;">
		<%  
			int id;
			try {
				id = int.Parse(Request.QueryString["id"]);
			} catch (Exception e) {
				id = 1;
			}

			var question = CranBerry.Managers.QnAManager.GetQnA(id);
			if (question.Answer != "0") {
		%>

		<!-- 답변 완료 시 표시 -->
		<div class="answer-rectangle bold">
			<span>답변<br>
				완료</span>
		</div>
		<% } %>
		<!-- 질문 제목 -->
		<br>
		<br>
		<h1 class="text-darkred bold float-left" style="margin: -12px 7px 0 7px;">Q.</h1>
		<h3 class="bold"><%= question.Title %></h3>
		<h5 class="float-right bold" style="margin: -6px 130px 0 0;">등록일: <%= question.QuestionAt.ToString("yyyy-MM-dd") %></h5>
		<div class="cb-bg-red w-100" style="height: 2px; margin-top: 25px;"></div>
		<br>

		<!-- 질문 내용 -->
		<div class="color-black"><%= question.Contents %></div>
		<br>
		<hr>

		<!-- 답변 존재 시 출력 -->
		<div class="p-2">
			<div style="background-color: #D45858; height: 47px; width: 15px; float: left;"></div>
			<h3 class="color-darkred" style="margin-left: 30px; padding-top: 6px; text-align:left;"><b>답변 내용</b></h3>
		</div>
		<br>
		<div class="p-4 border border-secondary"><%= question.Answer == "0" ? "답변 대기중입니다. 잠시만 기다려주세요:)" : question.Answer %></div>
		<br>
	</div>
	<br>
	             <asp:Label ID="txt" runat="server" Text="Label"></asp:Label>
	<br>
	

	<br>
    


               <asp:TextBox ID="Contents" runat="server" Style="margin-left: 200px; margin-top: 0px; font-size: 25px; color: #757575; border:1px #000000 solid" placeholder ="답변을 등록해 주세요." AcceptReturn="True" TextMode="MultiLine" Width="60%" Height="106px" />
                        <!--답변 등록-->

   
                    <asp:Button ID="AnswerButton" CssClass="btn cb-bg-darkred float-right text-white" runat="server" OnClick="AnswerButton_Click" Text="답변 등록" style="margin-right:230px; border-radius:15px; margin-bottom:100px;" Height="66px" Width="168px" ></asp:Button>
                       
        <br />
          <br />
   </form>
</asp:Content>