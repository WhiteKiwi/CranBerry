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
            //아이디 입력 확인
            if (UserID.Text == String.Empty)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('아이디를 입력해주세요.')", true);
            }
            //비밀번호 입력 확인
            if (UserPW.Text == String.Empty)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('비밀번호를 입력해주세요.')", true);
            }
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






