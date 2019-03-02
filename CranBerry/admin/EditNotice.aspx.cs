using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
	public partial class EditNotice : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack)

            {

                // 넘겨져 온 번호값에 해당하는 글 출력

                DisplayData();


            }
                

        }
        private void DisplayData()
        {
            var noticeID = Request.QueryString["id"];

            var notice = Managers.NoticeManager.GetNoticeByID(int.Parse(noticeID));

            txtTitle.Text = notice.Title;
            Contents.Text = notice.Contents;
        }

        protected void NoticeButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            int noticeID = int.Parse(id);
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("update notices Set  Title = @Title, Contents = @Contents where Id=" + noticeID , con);  

            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@Contents",Contents.Text);
           
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();


        }

    }
}