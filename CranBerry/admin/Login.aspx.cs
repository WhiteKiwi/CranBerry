using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MySql.Data.MySqlClient;



namespace CranBerry
{
    public partial class Login : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["ByeongJun"].ConnectionString);



        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (txtId.Text == String.Empty)
            {
                string scriptStr1 = "<script>alert('아이디을 입력해주세요.'); history.back() ; </script>";
                Page.RegisterClientScriptBlock("done", scriptStr1);
            }
            if (txtPassword.Text == String.Empty)
            {
                string scriptStr1 = "<script>alert('비밀번호를 입력해주세요.'); history.back() ; </script>";
                Page.RegisterClientScriptBlock("done", scriptStr1);
            }
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select*from login where ID = '" + txtId.Text + "'and Password='" + txtPassword.Text + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Session["ID"] = dr["ID"].ToString();
                Response.Redirect("AdminQaA.aspx");


            }

            con.Close();
            string scriptStr = "<script>alert('회원정보가 일치하지 않습니다.'); history.back() ; </script>";
            Page.RegisterClientScriptBlock("done", scriptStr);





        }


    }

}

