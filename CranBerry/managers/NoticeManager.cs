using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
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
}