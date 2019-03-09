
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;

namespace CranBerry {
	public partial class UploadQuestion : System.Web.UI.Page {
            
		protected void Page_Load(object sender, EventArgs e) {


            var User = Request.Cookies["UserID"].Value;
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            object obj;
            // Connect to Database
            MySqlCommand cmmd = new MySqlCommand("Select * from ban_list where UserID = @UserID", con);

            cmmd.CommandType = CommandType.Text;
            cmmd.Parameters.AddWithValue("@UserID", User);
            obj = cmmd.ExecuteScalar();
            MySqlDataReader rdr = cmmd.ExecuteReader();
            if (obj != null)

            {
                while (rdr.Read())
                {
                    Response.Redirect("/");

                }
            }
            cmmd.Dispose();
            con.Close();

        }

		protected void QuestionButton_Click(object sender, EventArgs e) {

			if (Contents.Text.Length >= 20) {
				QuestionButton.Enabled = false;

				// 질문 등록
				Managers.QnAManager.UploadQuestion(new Models.Question {
					Title = nTitle.Text,
					Contents = Contents.Text,
					UserID = Request.Cookies["UserID"].Value
				});

				Response.Redirect("/QnA.aspx");
			}
		}
	}
}