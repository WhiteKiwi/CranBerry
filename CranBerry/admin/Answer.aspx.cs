using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
	public partial class Answer : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
           
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Update questions Set Count = Count + 1 where Id = " + Request.QueryString["Id"], con);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();


        }

        protected void AnswerButton_Click(object sender, EventArgs e)
        {
            if (Contents.Text.Length >= 10 && Contents.Text != " ")
            {
                string name = Session["Name"].ToString();
                Managers.QnAManager.AddAnswer(new Models.Question
                {
                    Id = int.Parse(Request.QueryString["id"]),

                    Answer = Contents.Text
                });

                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("Update questions Set Name ='" + name + "' where Id = " + Request.QueryString["Id"], con);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('답변을 입력해 주세요.')", true);

            }
        }

        protected void List_Click(object sender, EventArgs e)
        {

        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {

          

                var Id = Request.QueryString["Id"];
                Managers.QnAManager.DeleteQuestion(new Models.Question
                {
                    Id = int.Parse(Id)
                });
                Response.Redirect("/admin/QnA.aspx");
            

        }
    }
}