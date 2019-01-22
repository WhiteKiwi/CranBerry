using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace CranBerry.Managers {
	public static class QnAManager {
		/// <summary>
		/// Get recent QnAs
		/// </summary>
		public static List<Models.Question> GetRecentQuestions() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Models.Question> questions = new List<Models.Question>();

				string sql = "SELECT * FROM questions ORDER BY Id DESC LIMIT 9;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					questions.Add(new Models.Question {
						Id = (int)rdr["Id"],
						Title = (string)rdr["Title"],
						Contents = (string)rdr["Contents"],
						QuestionAt = (DateTime)rdr["Question_At"]
					});
				}

				return questions;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
	}
}