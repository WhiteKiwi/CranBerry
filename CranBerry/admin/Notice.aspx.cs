using System;


namespace CranBerry.admin
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Update notices Set Count = Count + 1 where Id = " + Request.QueryString["Id"], con);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
        protected void ModifyButton_Click(object sender, EventArgs e)
        {
            int Id = int.Parse(Request.QueryString["Id"]);
            Response.Redirect("/admin/EditNotice.aspx?"+ "id=" + Id);


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