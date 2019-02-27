using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace CranBerry.admin {
	public partial class Question : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            Managers.QnAManager.AddAnswer(new Models.Question
            {
                Id = int.Parse(Request.QueryString["id"]),
                Answer = txtAnswer.Text
            });
        }


    }
}