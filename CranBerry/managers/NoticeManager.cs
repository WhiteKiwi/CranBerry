using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;

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
        public static int AddNotice(Notice notice)
        {
            int result = 0;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("insert into notices(Title,Contents,Notice_At,Id)values('{0}','{1}','{2}','{3}')", notice.Title, notice.Contents, DateTime.Now, notice.Id);
                con.Open();
                result = cmd.ExecuteNonQuery();
                return result;
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

        //공지 목록 가져오기
        public static List<Notice> GetNoticesyPage(int page)
            {
                MySqlConnection conn = null;
                try
                {
                    // Connect to DB;
                    conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                    conn.Open();

                    List<Notice> notices = new List<Notice>();

                    // Get notices Count
                    string sql = "SELECT count(*) FROM notices;";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    int noticeCount = Convert.ToInt32(cmd.ExecuteScalar());

                    // Get notices
                    sql = "SELECT Id, Title, Question_At FROM notices ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
                    cmd.CommandText = sql;

                    var rdr = cmd.ExecuteReader();
                    rdr.Read();
                    while (rdr.Read())
                    {
                        notices.Add(new Notice
                        {
                            Id = (int)rdr["Id"],
                            Title = (string)rdr["Title"],
                            NoticeAt = (DateTime)rdr["Notice_At"]
                        });
                    }

                    return notices;
                }
                catch (Exception e)
                {
                    // TODO: 예외 처리
                    throw new Exception(e.Message);
                }
                finally
                {
                    conn.Close();
                }
            }


        
    }
}