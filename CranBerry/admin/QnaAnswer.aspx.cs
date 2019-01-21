using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace CranBerry
{




    public partial class QnaAnswer : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["ByeongJun"].ConnectionString);
        protected void Page_Lode(object sender, EventArgs e)
        {
            if (Request.QueryString["Seq"] == null)
            {
                Response.Redirect("QaAList.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    ReadData();
                }

            }
        }
        private void ReadData()
        {

            con.Open();
            MySqlCommand cmd = new MySqlCommand("question", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Num", Request["Seq"]);
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                this.lblTitle1.Text = dr["Title"].ToString();
                this.lblTitle2.Text = dr["Content"].ToString();
                this.lblAnswer.Text = dr["Answer"].ToString();
            }
            dr.Close();
            con.Close();
        }





        protected void btnWrite_Click(object sender, EventArgs e)
        {
            string Answer = " ";
            if (txtAnswer.Text == String.Empty)
            {
                string scriptStr = "<script>alert('답변을 입력해주세요.'); history.back() ; </script>";
                Page.RegisterClientScriptBlock("done", scriptStr);
            }
            else
            {
                Answer = txtAnswer.Text;

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("update question set Answer = '{0}' where Number= 2", txtAnswer.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }





        }

    }
}

