using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace CranBerry.admin {
	public partial class Question : System.Web.UI.Page {
		MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);

		protected void Page_Lode(object sender, EventArgs e) {
			if (Request.QueryString["Seq"] == null) {
				Response.Redirect("Questions.aspx");
			} else {
				if (!Page.IsPostBack) {
					ReadData();
				}
			}
		}

		private void ReadData() {
			con.Open();
			MySqlCommand cmd = new MySqlCommand("question", con);
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@Num", Request["Seq"]);
			MySqlDataReader dr = cmd.ExecuteReader();
			while (dr.Read()) {
				this.lblTitle1.Text = dr["Title"].ToString();
				this.lblTitle2.Text = dr["Content"].ToString();
				this.lblAnswer.Text = dr["Answer"].ToString();
			}
			dr.Close();
			con.Close();
		}

		protected void btnWrite_Click(object sender, EventArgs e) {
			string Answer = " ";
			if (txtAnswer.Text == String.Empty) {
				string scriptStr = "<script>alert('답변을 입력해주세요.'); history.back() ; </script>";
				Page.RegisterClientScriptBlock("done", scriptStr);
			} else {
				Answer = txtAnswer.Text;

				MySqlCommand cmd = new MySqlCommand();
				cmd.Connection = con;
				cmd.CommandText = string.Format("update question set Answer = '{0}' where Number= 2", txtAnswer.Text);
				con.Open();
				cmd.ExecuteNonQuery();
				con.Close();
				Response.Redirect(Request.RawUrl);
			}
		}
	}
}