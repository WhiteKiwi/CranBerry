﻿using CranBerry.managers;
using MySql.Data.MySqlClient;
using System;
using System.Web;

namespace CranBerry {
	public partial class QnA : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
            if (Response.Cookies["UserID"] == null)
            {

                MySqlConnection conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);

                var rand = new Random(DateTime.Now.Millisecond);
                HttpCookie UserID = new HttpCookie("UserID");
                Response.Cookies["UserID"].Value = rand.Next().ToString() + "/" + rand.Next().ToString();
                Response.Cookies["UserID"].Expires = DateTime.Now.AddYears(5);
                var Cookies = Response.Cookies["UserID"].Value;

                string sql = "INSERT INTO User(UserId)VALUES (?)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.Add("UserId", MySqlDbType.VarChar).Value = Cookies;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


            }

            string UserId = Server.HtmlEncode(Response.Cookies["UserID"].Value);
            if (BanManager.IsBan(UserId))
            {
                Response.Redirect("/");

                
            }
            // 분류 목록 추가
            titleOrContents.Items.Add("제목");
			titleOrContents.Items.Add("내용");
		}

		protected void Searching(object sender, EventArgs e) {
			if (titleOrContents.SelectedValue == "제목")
				Response.Redirect("/QnA.aspx?titleSearch=" + SearchText.Text);
			else
				Response.Redirect("/QnA.aspx?contentsSearch=" + SearchText.Text);
		}

		protected void LeftButton_Click(object sender, EventArgs e) {
			int page;
			try {
				page = int.Parse(Request.QueryString["page"]);
			} catch (Exception ex) {
				page = 1;
			}

			if (page > 1)
				Response.Redirect("/QnA.aspx?page=" + (page - 1));
		}

		protected void RightButton_Click(object sender, EventArgs e) {
			int page;
			try {
				page = int.Parse(Request.QueryString["page"]);
			} catch (Exception ex) {
				page = 1;
			}

			if (page < Managers.QnAManager.GetPagesCount())
				Response.Redirect("/QnA.aspx?page=" + (page + 1));
		}
	}
}