using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace CranBerry {
	public partial class Notice : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

			
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Update notices Set Count = Count + 1 where Id = " + Request.QueryString["Id"], con);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

            // noticeid가 존재할 경우
            if (!String.IsNullOrEmpty(noticeID)) {
				var notice = Managers.NoticeManager.GetNoticeByID(int.Parse(noticeID));

				nTitle.Text = notice.Title;
				Contents.Text = notice.Contents;
				NoticeAt.Text = notice.NoticeAt.ToString("yyyy-MM-dd");
			} else {
				nTitle.Text = "404 Not Found.";
				Contents.Text = "404 Not Found.";
				NoticeAt.Text = "404 Not Found.";
			}
		}
	}
}