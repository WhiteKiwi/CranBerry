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
		public static List<Models.Notice> GetRecentNotices() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Models.Notice> notices = new List<Models.Notice>();

				string sql = "SELECT * FROM notices ORDER BY Id DESC LIMIT 5;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var dr = cmd.ExecuteReader();
				while (dr.Read()) {
					notices.Add(new Models.Notice {
						Id = (int)dr["Id"],
						Title = (string)dr["Title"],
						Contents = (string)dr["Contents"],
						NoticeAt = (DateTime)dr["Notice_At"]
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
        // 공지 추가
		public static int AddNotice(Models.Notice notice) {
			int result = 0;
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			try {
			
                string sql = "INSERT INTO  notices(Title, Contents, Notice_At) VALUES (?, ?, ?);";
                MySqlCommand cmd = new MySqlCommand(sql, con);

             
                cmd.Parameters.Add("Title", MySqlDbType.VarChar).Value = notice.Title;
                cmd.Parameters.Add("Contents", MySqlDbType.VarChar).Value = notice.Contents;
                cmd.Parameters.Add("Question_At", MySqlDbType.DateTime).Value = DateTime.Now;
      
                con.Open();
				result = cmd.ExecuteNonQuery();
				return result;
			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {
				con.Close();
			}
		}

		/// <summary>
		/// Get Notices by page
		/// 목록 렌더링을 위해 제목과 글번호만 반환
		/// </summary>
		public static List<Models.Notice> GetNoticeByPage(int page) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Models.Notice> noticeList = new List<Models.Notice>();

				// Get Notices Count
				string sql = "SELECT count(*) FROM notices;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				int noticeCount = Convert.ToInt32(cmd.ExecuteScalar());

				// Get Notices
				sql = "SELECT Id, Title, Notice_At FROM notices ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
				cmd.CommandText = sql;

				var dr = cmd.ExecuteReader();
				while (dr.Read()) {
					noticeList.Add(new Models.Notice {
						Id = (int)dr["Id"],
						Title = (string)dr["Title"],
						NoticeAt = (DateTime)dr["Notice_At"]
					});
				}

				return noticeList;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}

		/// <summary>
		/// Get Pages Count
		/// </summary>
		public static int GetPagesCount() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				// Get Notices Count
				string sql = "SELECT count(*) FROM notices;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				int noticeCount = Convert.ToInt32(cmd.ExecuteScalar());

				// 공지 갯수의 1의 자리가 0일 경우
				if (noticeCount % 10 != 0) {
					return noticeCount / 10 + 1;
				} else {
					return noticeCount / 10;
				}
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}

		//공지 목록 가져오기
		public static List<Models.Notice> GetNoticesyPage(int page) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Models.Notice> notices = new List<Models.Notice>();

				// Get notices Count
				string sql = "SELECT count(*) FROM notices;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				int noticeCount = Convert.ToInt32(cmd.ExecuteScalar());

				// Get notices
				sql = "SELECT Id, Title, Notice_At FROM notices ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
				cmd.CommandText = sql;

				var dr = cmd.ExecuteReader();
				dr.Read();
				while (dr.Read()) {
					notices.Add(new Models.Notice {
						Id = (int)dr["Id"],
						Title = (string)dr["Title"],
						NoticeAt = (DateTime)dr["Notice_At"]
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
        // 공지 수정
		public static int ModifyNotice(Models.Notice notice) {
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			MySqlCommand cmd = new MySqlCommand();
			try {
				int result = 0;

				cmd.Connection = con;
				cmd.CommandText = string.Format("SELECT notices FROM  WHERE Id = " + notice.Id);
				con.Open();

				//공지 업데이트
				cmd.CommandText = string.Format("update notices set Contents='{0}' where Id='{1}'", notice.Contents, notice.Id);
				result = cmd.ExecuteNonQuery();
				return result;

			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {
				con.Close();
			}
		}


        /// <summary>
        /// Get Notice by Id
        /// </summary>
        public static Models.Notice GetNoticeByID(int id)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();

                string sql = "SELECT * FROM notices WHERE Id=" + id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var dr = cmd.ExecuteReader();
                dr.Read();
                Models.Notice notice = new Models.Notice
                {
                    Id = (int)dr["Id"],
                    Title = (string)dr["Title"],
                    Contents = (string)dr["Contents"],
                    NoticeAt = (DateTime)dr["Notice_At"]
                  
                };
                dr.Close();





                return notice;
           
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
            public static int DeleteNotice(Models.Notice notice) // 공지 삭제
            {
                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                MySqlCommand cmd = new MySqlCommand();
                try
                {
                    int result = 0;
                    cmd.Connection = con;
                    cmd.CommandText = string.Format("Delete From notice Where Id={0}", notice.Id);
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
        }
	}
