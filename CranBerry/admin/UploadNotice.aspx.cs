using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace CranBerry.admin
{
    public partial class UploadNotice : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);



        protected void btnWrite_Click(object sender, EventArgs e)
        {
            if (txtTitle.Text == String.Empty)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "enterTitle", "alert('제목을 입력해주세요.')", true);
            }
            if (txtContent.Text == String.Empty)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "enterContent", "alert('내용을 입력해주세요.')", true);
            }
            if ((txtTitle.Text.Length > 0) && (txtContent.Text.Length > 0))
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("insert into question(Title,Content,PostDate,PostIP)values('{0}','{1}','{2}','{3}')", txtTitle.Text, txtContent.Text, DateTime.Now, Request.UserHostAddress);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Questions.aspx");
            }
        }

    }
}