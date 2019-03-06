using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry
{
    public partial class Apply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // 지원 
        protected void ApplyUpload(object sender, EventArgs e)
        {
            if (Encoding.UTF8.GetByteCount(Answer1.Text.Trim().ToCharArray()) > 2500)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('1번이 너무 깁니다.')", true);

                return;
            }
            else if (Encoding.UTF8.GetByteCount(Answer2.Text.Trim().ToCharArray()) >150)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('2번이 너무 깁니다.')", true);

                return;
            }
            else if (Encoding.UTF8.GetByteCount(Answer3.Text.Trim().ToCharArray()) < 1000)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('3번이 너무 짧습니다.')", true);

                return;
            }

            if (studentNumber.Text.Trim() == "" || Answer1.Text.Trim() == "" || Answer2.Text.Trim() == "" || Answer3.Text.Trim() == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('모든 항목을 입력해주세요.')", true);

                return;
            }

            // Connect to DB;
            MySqlConnection conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("Insert Into apply (Number, Answer1,Answer2,Answer3) values (@Number, @Answer1, @Answer2 , @Answer3)");
            cmd.Parameters.AddWithValue("@Number", studentNumber.Text);
            cmd.Parameters.AddWithValue("@Answer1", Answer1.Text);
            cmd.Parameters.AddWithValue("@Answer2", Answer2.Text);
            cmd.Parameters.AddWithValue("@Answer3", Answer3.Text);
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            conn.Close();
            studentNumber.Text = " ";
            Answer1.Text = " ";
            Answer2.Text = " ";
            Answer3.Text = " ";



        }
    }
}
