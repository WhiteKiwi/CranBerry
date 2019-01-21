using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace CranBerry.Managers {
	public static class QnAManager {
		/// <summary>
		/// Get recent QnAs
		/// </summary>
		public static List<Question> GetRecentQuestions() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Question> questions = new List<Question>();

				string sql = "SELECT * FROM questions ORDER BY Id DESC LIMIT 9;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					questions.Add(new Question {
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