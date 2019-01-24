using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {



        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //계정 확인

            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select * from admins where Id = @Id and Password = @Password", con);
            cmd.Parameters.AddWithValue("@Id", UserID.Text.ToString());
            cmd.Parameters.AddWithValue("@Password", UserPW.Text.ToString());
            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["Id"] = reader["Id"].ToString();
                Session["Name"] = reader["Name"].ToString();
                reader.Close();
                cmd.Dispose();
                con.Close();
                Response.Redirect("Default.aspx");
            }
            else
            {
                reader.Close();
                cmd.Dispose();
                con.Close();
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('회원정보가 일치하지않습니다.')", true);
            }




        }


    }


}



