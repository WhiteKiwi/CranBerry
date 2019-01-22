using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace CranBerry.admin {
	public partial class Login : System.Web.UI.Page {
		MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);

		protected void BtnLogin_Click(object sender, EventArgs e) {
			if (UserID.Text == String.Empty) {
				ScriptManager.RegisterClientScriptBlock(LoginButton, this.GetType(), "AlertMsg", "<script language='javascript'>alert('아이디를 입력해주세요.');</script>", false);
			}
			if (UserPW.Text == String.Empty) {
				ScriptManager.RegisterClientScriptBlock(LoginButton, this.GetType(), "AlertMsg", "<script language='javascript'>alert('비밀번호를 입력해주세요.');</script>", false);
			}

			con.Open();
			MySqlCommand cmd = con.CreateCommand();
			cmd.CommandType = CommandType.Text;
			cmd.CommandText = "select*from login where ID = '" + UserID.Text + "'and Password='" + UserPW.Text + "'";
			cmd.ExecuteNonQuery();
			DataTable dt = new DataTable();
			MySqlDataAdapter da = new MySqlDataAdapter(cmd);
			da.Fill(dt);
			foreach (DataRow dr in dt.Rows) {
				Session["ID"] = dr["ID"].ToString();
				Response.Redirect("AdminQaA.aspx");
			}

			con.Close();
			ScriptManager.RegisterClientScriptBlock(LoginButton, this.GetType(), "AlertMsg", "<script language='javascript'>alert('회원정보가 일치하지 않습니다.');</script>", false);

		}
	}
}

