using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace CranBerry {
	public partial class UploadQuestion : System.Web.UI.Page {
		MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);

		protected void Page_Load(object sender, EventArgs e) {
			// txtRand.Text = CranBerry.Managers.QnAManager.RandText();
		}

		protected void QuestionUpload(object sender, EventArgs e) {
			if (nTitle.Text == String.Empty) {
				ClientScript.RegisterStartupScript(this.GetType(), "enterTitle", "alert('제목을 입력해주세요.')", true);
			}
			if (Contents.Text == String.Empty) {
				ClientScript.RegisterStartupScript(this.GetType(), "enterContent", "alert('내용을 입력해주세요.')", true);
			}

			if ((nTitle.Text.Length > 0) && (Contents.Text.Length > 0)) {
				MySqlCommand cmd = new MySqlCommand();
				cmd.Connection = con;
				cmd.CommandText = string.Format("insert into question(Title, Content, PostDate, PostIP)values('{0}', '{1}', '{2}', '{3}')", nTitle.Text, Contents.Text, DateTime.Now, Request.UserHostAddress);
				con.Open();
				cmd.ExecuteNonQuery();
				con.Close();
				Response.Redirect("Questions.aspx");
			}

		}
	}
}