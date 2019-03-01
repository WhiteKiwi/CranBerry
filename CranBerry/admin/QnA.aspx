<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="QnA.aspx.cs" Inherits="CranBerry.admin.QnA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
	<!-- Top Image -->
	<img src="/assets/img/banner.png" style="width: 100%;" />

	<!-- Q&A -->
	<form id="form1" runat="server">
		<div style="width: 100%; padding-top: 50px; padding-left: 100px; padding-right: 100px; text-align: left;">
			<div class="float-left">
				<h2><strong>Q&A</strong></h2>
			</div>
			<div class="float-right" style="margin-left: 10px;">
		
			</div>
			<div class="float-right" style="margin-left: 10px; width: 350px;">
				 
			</div>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
			<div class="float-right">
				
			</div>
            <asp:DropDownList  ID="TitleOrContents" runat="server" CssClass="form-control" Style="width: 80px;">
                <asp:ListItem>제목</asp:ListItem>
                <asp:ListItem>내용</asp:ListItem>
				</asp:DropDownList>
			<br />
			<br />
			<!-- T  able Head -->
			<hr class="hr-red" />
			<div style="text-align: center; margin-top: -12px; margin-bottom: -12px;">
				<span style="float: left; margin-left: 17px;">번호</span>
				<span>제목</span>
				<span style="float: right; margin-right: 37px;">게시일</span>
			</div>
			<hr class="hr-red" />
           <%-- <div style="width: 100%; text-align: center;">
                <img src="/assets/img/Comming-Soon.png" />
            </div>--%>
			<!-- Table Data -->
			<%
				try {
					int rPage;
					try {
						rPage = int.Parse(Request.QueryString["page"]);
					} catch (Exception e) {
						rPage = 1;
					}

					List<CranBerry.Models.Question> questionList = null;

					if (Request.QueryString["titleSearch"] != null) {
						int pageCounts = CranBerry.Managers.QnAManager.GetPagesCountBySearching(Request.QueryString["titleSearch"], false);
						if (rPage > pageCounts)
							rPage = 1;

						questionList = CranBerry.Managers.QnAManager.GetQuestionsBySearching(rPage, Request.QueryString["titleSearch"], false);
					} else if (Request.QueryString["contentsSearch"] != null) {
						int pageCounts = CranBerry.Managers.QnAManager.GetPagesCountBySearching(Request.QueryString["contentsSearch"], true);
						if (rPage > pageCounts)
							rPage = 1;

						questionList = CranBerry.Managers.QnAManager.GetQuestionsBySearching(rPage, Request.QueryString["contentsSearch"], true);
					} else {
						int pageCounts = CranBerry.Managers.QnAManager.GetPagesCount();
						if (rPage > pageCounts)
							rPage = 1;

						questionList = CranBerry.Managers.QnAManager.GetQuestionsByPage(rPage);
					}

					foreach (var question in questionList) {
						// Write on Page
						Response.Write("<div style=\"text-align: center;\">");
						Response.Write("<span style=\"float: left; margin-left: 20px;\">" + question.Id + "</span>");
						string answer = question.Answer != "0" ? "<span style=\"font-size: 0.9rem;\">[답변완료]</span> " : "";
						Response.Write("<span class=\"contents-list\"><a class=\"alert-link\" href=\"/admin/Answer.aspx?id=" + question.Id + "\">" + answer + question.Title + "</a></span>");
						Response.Write("<span style=\"float: right; margin-right: 20px;\">" + question.QuestionAt.ToString("yyyy-MM-dd") + "</span>");
						Response.Write("</div><hr class=\"hr-gray\" />");
					}
				} catch (Exception e) {
					Response.Write(e.Message);
				}
			%>

 

			<!-- Page Link -->
			<div class="text-center">
				<span>
					<strong><b>
						<asp:LinkButton ID="LeftButton" runat="server" OnClick="LeftButton_Click" Text="<" ForeColor="#400101" />
					</b></strong>
				</span>
				<%
                    string queryText = "";
                    int page = 1;
                    int pageCount = 10;
                    if (Request.QueryString["titleSearch"] != null) {
                        pageCount = CranBerry.Managers.QnAManager.GetPagesCountBySearching(Request.QueryString["titleSearch"], false);
                        try {
                            page = int.Parse(Request.QueryString["page"]);
                        } catch (Exception e) {
                            page = 1;
                        }

                        queryText = "&titleSearch=" + Request.QueryString["titleSearch"];
                    } else if (Request.QueryString["contentsSearch"] != null) {
                        pageCount = CranBerry.Managers.QnAManager.GetPagesCountBySearching(Request.QueryString["contentsSearch"], true);
                        try {
                            page = int.Parse(Request.QueryString["page"]);
                        } catch (Exception e) {
                            page = 1;
                        }

                        queryText = "&contentsSearch=" + Request.QueryString["contentsSearch"];
                    } else {
                        pageCount = CranBerry.Managers.QnAManager.GetPagesCount();
                        try {
                            page = int.Parse(Request.QueryString["page"]);
                        } catch (Exception e) {
                            page = 1;
                        }
                    }

                    // 정상적인 페이지 요청일 경우
                    if (page <= pageCount) {
                        // 요청한 페이지가 마지막 장일경우
                        if (pageCount / 10 == page / 10) {
                            if (page % 10 != 0) {
                                for (int i = 1; i <= pageCount % 10; i++) {
                                    string pageStyle = "";
		                            string textStyle = " style=\"color: #343434;\"";
                                    if (i + ((page / 10) * 10) == page) {
                                        pageStyle = " class=\"this-page\"";
                                        textStyle = " style=\"color: white;\"";
                                    }

                                    Response.Write("<span" + pageStyle + " style=\"padding: 3px 9px; margin: 3px;\">");
                                    Response.Write("<a" + textStyle + " href=\"/admin/QnA.aspx?page=" + (i + ((page / 10) * 10)) + queryText + "\">" + (i + ((page / 10) * 10)) + "</a>");
                                    Response.Write("</span>");
                                }
                            } else {
                                // 마지막 페이지의 일의 자릿 수가 0일 경우
                                for (int i = 1; i <= 10; i++) {
                                    string pageStyle = "";
		                            string textStyle = " style=\"color: #343434;\"";
                                    if (i + page - 10 == page) {
                                        pageStyle = " class=\"this-page\"";
                                        textStyle = " style=\"color: white;\"";
                                    }

                                    Response.Write("<span" + pageStyle + " style=\"padding: 3px 9px; margin: 3px;\">");
                                    Response.Write("<a" + textStyle + " href=\"/admin/QnA.aspx?page=" + (i + page - 10) + queryText + "\">" + (i + page - 10) + "</a>");
                                    Response.Write("</span>");
                                }
                            }
                        } else {
                            for (int i = 1; i <= 10; i++) {
                                string pageStyle = "";
	                            string textStyle = " style=\"color: #343434;\"";
                                if (i + ((page / 10) * 10) == page) {
                                    pageStyle = " class=\"this-page\"";
                                    textStyle = " style=\"color: white;\"";
                                }

                                Response.Write("<span" + pageStyle + " style=\"padding: 3px 9px; margin: 3px;\">");
                                Response.Write("<a" + textStyle + " href=\"/admin/QnA.aspx?page=" + (i + ((page / 10) * 10)) + queryText + "\">" + (i + ((page / 10) * 10)) + "</a>");
                                Response.Write("</span>");
                            }
                        }
                    } else {
                        // 첫 목록
                        for (int i = 1; i <= 10; i++) {
                            string pageStyle = "";
                            string textStyle = " style=\"color: #343434;\"";
                            if (i == 1) {
                                pageStyle = " class=\"this-page\"";
                                textStyle = " style=\"color: white;\"";
                            }

                            Response.Write("<span" + pageStyle + " style=\"padding: 3px 9px; margin: 3px;\">");
                            Response.Write("<a" + textStyle + " href=\"/admin/QnA.aspx?page=" + i + queryText + "\">" + i + "</a>");
                            Response.Write("</span>");
                        }
                    }
				%>
				<span>
					<strong><b>
						<asp:LinkButton ID="RightButton" runat="server" OnClick="RightButton_Click" Text=">" ForeColor="#400101" />
					</b></strong>
				</span>
			</div>
		</div>
	</form>
	<br />
	<br />

	<!-- Copyright -->
	<div class="copyright f3 text-white cb-bg-red">
		2017 Copyright &copy; Team VaryBerry All Right Reserved
	</div>
</asp:Content>
