using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;



namespace CranBerry {
	public partial class Login : System.Web.UI.Page {
		MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["ByeongJun"].ConnectionString);

		protected void BtnLogin_Click(object sender, EventArgs e) {
			if (UserID.Text == String.Empty) {
				string scriptStr1 = "<script>alert('아이디을 입력해주세요.'); history.back() ; </script>";
				Page.RegisterClientScriptBlock("done", scriptStr1);
			}
			if (UserPW.Text == String.Empty) {
				string scriptStr1 = "<script>alert('비밀번호를 입력해주세요.'); history.back() ; </script>";
				Page.RegisterClientScriptBlock("done", scriptStr1);
			}
			con.Open();
			MySqlCommand cmd = con.CreateCommand();
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
			string scriptStr = "<script>alert('회원정보가 일치하지 않습니다.'); history.back() ; </script>";
			Page.RegisterClientScriptBlock("done", scriptStr);
		}
	}
}

