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

            Button ButtonLogin = new Button();
            ButtonLogin.ID = "btnClick";


        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //계정 확인
            TextBox UserID = new TextBox();
            TextBox UserPW = new TextBox();

            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "select*from login where ID = '" + UserID.Text + "' and Password='" + UserPW.Text + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Session["UserID"] = dr["UserID"].ToString();
                Response.Redirect("Default.aspx");
            }
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('회원정보가 일치하지않습니다.')", true);

        }


    }


}



