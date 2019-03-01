using System;


namespace CranBerry.admin
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            var noticeID = Request.QueryString["Id"];

            Managers.NoticeManager.DeleteNotice(new Models.Notice
            {
                Id = int.Parse(noticeID)
            });
            Response.Redirect("/admin/Notices.aspx");
        }
    }
}