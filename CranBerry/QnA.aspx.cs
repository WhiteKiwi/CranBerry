using CranBerry.managers;
using MySql.Data.MySqlClient;
using System;
using System.Web;

namespace CranBerry {
	public partial class QnA : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

            if (Response.Cookies["UserID"].Value == null)
            {

                MySqlConnection conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);

                var rand = new Random(DateTime.Now.Millisecond);
            //HttpCookie UserID = new HttpCookie("User");

            Response.Cookies["userid"].Value = rand.Next().ToString() + " / " + rand.Next().ToString();

              Response.Cookies["userid"].Expires = DateTime.Now.AddYears(5);
                var  Cookies = Response.Cookies["userid"].Value;
            
            string sql = "INSERT INTO User(UserId)VALUES (?)";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.Add("UserId", MySqlDbType.VarChar).Value = Cookies;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            }


            var User = Response.Cookies["userid"].Value;
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            // Connect to Database
            string mysql = "SELECT * FROM  ban_list  ";
            MySqlCommand cmmd = new MySqlCommand(mysql, con);
            MySqlDataReader rdr = cmmd.ExecuteReader();
            while (rdr.Read())
            {
                if ((string)rdr["UserID"] == User) Response.Redirect("/");

            }

            // 분류 목록 추가
            titleOrContents.Items.Add("제목");
			titleOrContents.Items.Add("내용");
		}

		protected void Searching(object sender, EventArgs e) {
			if (titleOrContents.SelectedValue == "제목")
				Response.Redirect("/QnA.aspx?titleSearch=" + SearchText.Text);
			else
				Response.Redirect("/QnA.aspx?contentsSearch=" + SearchText.Text);
		}

		protected void LeftButton_Click(object sender, EventArgs e) {
			int page;
			try {
				page = int.Parse(Request.QueryString["page"]);
			} catch (Exception ex) {
				page = 1;
			}

			if (page > 1)
				Response.Redirect("/QnA.aspx?page=" + (page - 1));
		}

		protected void RightButton_Click(object sender, EventArgs e) {
			int page;
			try {
				page = int.Parse(Request.QueryString["page"]);
			} catch (Exception ex) {
				page = 1;
			}

			if (page < Managers.QnAManager.GetPagesCount())
				Response.Redirect("/QnA.aspx?page=" + (page + 1));
		}
	}
}