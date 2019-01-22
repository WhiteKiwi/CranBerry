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
	public static class NoticeManager {
		/// <summary>
		/// Get recent Notices
		/// </summary>
		public static List<Notice> GetRecentNotices() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Notice> notices = new List<Notice>();

				string sql = "SELECT * FROM notices ORDER BY Id DESC LIMIT 5;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					notices.Add(new Notice {
						Id = (int)rdr["Id"],
						Title = (string)rdr["Title"],
						Contents = (string)rdr["Contents"],
						NoticeAt = (DateTime)rdr["Notice_At"]
					});
				}

				return notices;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
	}
    public static AddNotice(Notice notice)
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);

            if (txtTitle.Text == String.Empty)
            {
            ScriptManager.RegisterClientScriptBlock(BtnLogin, this.GetType(), "AlertMsg", "<script language='javascript'>alert('제목을 입력해주세요.');</script>", false);
        }
            if (txtContent.Text == String.Empty)
            {
            ScriptManager.RegisterClientScriptBlock(BtnLogin, this.GetType(), "AlertMsg", "<script language='javascript'>alert('내용을 입력해주세요.');</script>", false);
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