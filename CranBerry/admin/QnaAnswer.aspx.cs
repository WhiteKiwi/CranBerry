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

namespace June
{




    public partial class AdminAnswer : System.Web.UI.Page
    {

        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["ByeongJun"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ReadData();
            }

        }

        private void ReadData()
        {
            int Id;

            try
            {
                Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            }
            catch (Exception e)
            {
                Id = 1;
            }

            try
            {

                string mysql = " Select Id, Title, Content from question where Id=" + Id;
                MySqlCommand cmd = new MySqlCommand(mysql, con);
                con.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    lblTitle1.Text = dr["Title"].ToString();
                    lblTitle2.Text = dr["Content"].ToString();

                }
                dr.Close();

                string mysql1 = "select Answer from answer where Id=" + Id;
                MySqlCommand cmd1 = new MySqlCommand(mysql1, con);
                MySqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.Read())
                {
                    lblAnswer.Text = dr1["Answer"].ToString();
                }

                dr1.Close();

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }


        }





        public void btnWrite_Click(object sender, EventArgs e)
        {


            string Answer = " ";
            int Id;

            if (Request.QueryString["Id"] != null)
            {
                Id = Convert.ToInt32(Request.QueryString["Id"].ToString());

            }
            else
            {
                Id = 1;
            }

            if (txtAnswer.Text == String.Empty)
            {
                ScriptManager.RegisterClientScriptBlock(Btn, this.GetType(), "AlertMsg", "<script language='javascript'>alert('답변을 입력해주세요.');</script>", false);
            }
            else
            {
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
}

