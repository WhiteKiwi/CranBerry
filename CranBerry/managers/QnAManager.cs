using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;



namespace CranBerry.Managers {
	public static class QnAManager {
		/// <summary>
		/// Get recent QnAs
		/// </summary>
		public static List<Question> GetRecentQuestions() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Question> questions = new List<Question>();

				string sql = "SELECT * FROM questions ORDER BY Id DESC LIMIT 9;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					questions.Add(new Question {
						Id = (int)rdr["Id"],
						Title = (string)rdr["Title"],
						Contents = (string)rdr["Contents"],
						QuestionAt = (DateTime)rdr["Question_At"]
					});
				}

				return questions;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
        public static Answer(Answer answer)
        {

            string Answer = " ";
            int Id;

            if (Request.QueryString["Id"] != null)  { 
                Id = Convert.ToInt32(Request.QueryString["Id"].ToString());

            }
            else { 
          
                Id = 1;
            }

            if (txtAnswer.Text == String.Empty) {

                ScriptManager.RegisterClientScriptBlock(BtnLogin, this.GetType(), "AlertMsg", "<script language='javascript'>alert('답변을 입력해주세요.');</script>", false);
            }
            else { 
            
                Answer = txtAnswer.Text;
                con.Open();
                MySqlCommand cmd = new MySqlCommand("update answer Set Answer=@Answer, Id= @Id where Id=" + Id, con);
                cmd.Parameters.AddWithValue("@Answer", txtAnswer.Text);
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                Response.Redirect("AdminAnswer.aspx?id=" + Request.QueryString["Id"]);


            }
        }
	}

        public static UploadQuestion(Question question) {

             MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);        
            if (txtTitle.Text == String.Empty) { 
        
            string scriptStr1 = "<script>alert('제목을 입력해주세요.'); history.back() ; </script>";
            Page.RegisterClientScriptBlock("done", scriptStr1);
        }
            if (txtContent.Text == String.Empty) { 
        
            string scriptStr1 = "<script>alert('내용을 입력해주세요.'); history.back() ; </script>";
            Page.RegisterClientScriptBlock("done", scriptStr1);
        }

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = con;
            cmd.CommandText = string.Format("insert into question(Title,Content,PostDate,PostIP)values('{0}','{1}','{2}','{3}')", txtTitle.Text, txtContent.Text, DateTime.Now, Request.UserHostAddress);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("QaAList.aspx");

    }
}