using System;

namespace CranBerry.master
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //// 세션이 비어 있을 경우
            //if (Session["AdminID"] == null)
            //{
            //    // 로그인 페이지로 Redirect
            //    Response.Redirect("/admin/Login.aspx");
            //}
        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session["AdminID"] = null;
            Response.Redirect("/admin/Login.aspx");
        }
    }
}
