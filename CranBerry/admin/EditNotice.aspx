<%@ Page Title="" Language="C#" MasterPageFile="~/master/Admin.Master" AutoEventWireup="true" CodeBehind="EditNotice.aspx.cs" Inherits="CranBerry.admin.EditNotice" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <form runat="server">
<!-- 공지수정제목 -->    
	<h1 style="color: #400101; margin-left: 160px; margin-top: 80px; font-size: 55px"><b>공지 수정</b></h1>
	<!-- 본문 붉은 선 -->
	<div class="RedHr"></div>
    

    <!-- 제목 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 60px">
     <div class="SmallTitle"><b>제목</b></div>
     <asp:TextBox runat="server" ID="txtTitle" CssClass="Box"  style=" height: 50px; width: 1520px; margin-bottom : 2%" ></asp:TextBox> 
        
	</div>

    <!-- 내용 박스 -->
    <div style="width: 80%; margin-left: 9%; margin-top: 40px">
     <div class="SmallTitle"><b>내용</b></div>
    <CKEditor:CKEditorControl ID="Contents" BasePath="/assets/CKEditor/" runat="server"></CKEditor:CKEditorControl>

	</div>

    <!-- 바이트 -->
    <div style="color: #707070; font-size: 10pt; margin-left: 14%">0/10000byte</div>


    <!-- 저장버튼 -->
         <script type="text/javascript">
                    function DeleteItem() {
            if (confirm("등록 하시겠습니까?")) {
                return true;
            }
            return false;
        }
 </script>
	 <asp:Button runat="server" onclientclick="return DeleteItem();" ID="NoticeButton"  CssClass="btn cb-bg-darkred float-right text-white" OnClick="NoticeButton_Click" Text="저장"  style=" margin-bottom: 350px; margin-right: 100px;"></asp:Button>
	  



        </form>
</asp:Content>