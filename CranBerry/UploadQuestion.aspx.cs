using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace CranBerry {
	public partial class UploadQuestion : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

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