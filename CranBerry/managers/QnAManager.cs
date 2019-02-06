using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;

namespace CranBerry.Managers {
	public static class QnAManager {
		/// <summary>
		/// Upload Question
		/// </summary>
		public static int UploadQuestion(Models.Question question) {
			// 제목 또는 내용이 비어 있을 경우 종료
			if (String.IsNullOrEmpty(question.Title.Trim()) || String.IsNullOrEmpty(question.Contents.Trim()))
				return -1;

			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				int result = 0;

				// Connect to Database
				string sql = "INSERT INTO questions(Title, Contents, Question_At, UserID, RandText) VALUES (?, ?, ?, ?, ?);";
				MySqlCommand cmd = new MySqlCommand(sql, conn);

				// Add Question Info
				cmd.Parameters.Add("Title", MySqlDbType.VarChar).Value = question.Title;
				cmd.Parameters.Add("Contents", MySqlDbType.VarChar).Value = question.Contents.Replace("\r\n", "<br/>");
				cmd.Parameters.Add("Question_At", MySqlDbType.DateTime).Value = DateTime.Now;
				cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = question.UserID;
				cmd.Parameters.Add("RandText", MySqlDbType.VarChar).Value = "12345678";

				result = cmd.ExecuteNonQuery();

				return result;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}

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

		/// <summary>
		/// Get QnA by Id
		/// </summary>
		public static Models.Question GetQnA(int Id) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				string sql = "SELECT * FROM questions WHERE Id=" + Id + ";";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var rdr = cmd.ExecuteReader();
				rdr.Read();
				Models.Question question = new Models.Question {
					Id = (int)rdr["Id"],
					Title = (string)rdr["Title"],
					Contents = (string)rdr["Contents"],
					QuestionAt = (DateTime)rdr["Question_At"],
					Answer = (string)rdr["Answer"]
				};
				rdr.Close();

				return question;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
		/*
         * 이준모 - 랜덤 문자열 생성
         */
		public static char[] rndchrset = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
		//사용될 문자들

		public static string RandText() {
			Random rnd = new Random();
			int i;
			string randstr = "";
			for (i = 0; i < 7; i++) randstr += rndchrset[rnd.Next(0, 61)];
			return randstr;
		}

		/*
         * 서정민 - 페이지 질문 불러오기
         */

		public static List<Models.Question> GetQuestionsByPage(int page) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Models.Question> questions = new List<Models.Question>();

				// Get Questions
				string sql = "SELECT Id, Title, Question_At, Answer FROM questions ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				
				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					questions.Add(new Models.Question {
						Id = (int)rdr["Id"],
						Title = (string)rdr["Title"],
						QuestionAt = (DateTime)rdr["Question_At"],
						Answer = (string)rdr["Answer"]
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
		//질문 수정
		public static int ModifyQuestion(Models.Question question, string RandText) {
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			MySqlCommand cmd = new MySqlCommand();

			if (question.Answer != "0")
				return -1;

			{
				try {
					int result = 0;

					cmd.Connection = con;
					cmd.CommandText = string.Format("SELECT RandText FROM questions WHERE Id = " + question.Id);
					con.Open();
					if (RandText == (string)cmd.ExecuteScalar()) {
						//질문 업데이트
						cmd.CommandText = string.Format("update question set Contents='{0}' where Id='{1}'", question.Contents, question.Id);
						result = cmd.ExecuteNonQuery();
						return result;
					} else return -1;
				} catch (Exception e) {
					throw new Exception(e.Message);
				} finally {
					con.Close();
				}

			}
		}
		public static int AddAnswer(Models.Question answer) {
			int result = 0;
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			MySqlCommand cmd = new MySqlCommand();
			try {
				cmd.Connection = con;
				con.Open();
				cmd.CommandText = string.Format("update questions Set Answer=" + answer.Answer + " where Id=" + answer.Id);

				result = cmd.ExecuteNonQuery();
				return result;
			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {
				con.Close();
			}
		}

		public static void DeleteQuestion(int id) {
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			MySqlCommand cmd = new MySqlCommand();
			try {
				con.Open();
				cmd.Connection = con;
				cmd.CommandText = string.Format("DELETE FROM question WHERE Id=" + id);
			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {

				con.Close();
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

				// Get Questions Count
				string sql = "SELECT count(*) FROM questions;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				int questionCount = Convert.ToInt32(cmd.ExecuteScalar());

				// 공지 갯수의 1의 자리가 0일 경우
				if (questionCount % 10 != 0) {
					return questionCount / 10 + 1;
				} else {
					return questionCount / 10;
				}
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
		public static int GetPagesCountBySearching(string text, bool isContents) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				// SetColumName
				string columName = "";
				if (isContents)
					columName = "Contents";
				else
					columName = "Title";

				// Get Questions Count
				string sql = "SELECT count(*) FROM questions WHERE " + columName + " LIKE '%" + text + "%';";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				int questionCount = Convert.ToInt32(cmd.ExecuteScalar());

				// 공지 갯수의 1의 자리가 0일 경우
				if (questionCount % 10 != 0) {
					return questionCount / 10 + 1;
				} else {
					return questionCount / 10;
				}
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}

		/// Get Questions by Searching
		/// 목록 렌더링을 위해 제목과 글번호만 반환
		/// </summary>
		public static List<Models.Question> GetQuestionsBySearching(int page, string text, bool isContents) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Models.Question> questionList = new List<Models.Question>();

				// SetColumName
				string columName = "";
				if (isContents)
					columName = "Contents";
				else
					columName = "Title";

				// Get Questions Count
				string sql = "SELECT count(*) FROM questions WHERE " + columName + " LIKE '%" + text + "%';";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				int questionCount = Convert.ToInt32(cmd.ExecuteScalar());

				// Get Questions
				sql = "SELECT Id, Title, Question_At FROM questions WHERE " + columName + " LIKE '%" + text + "%' ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
				cmd.CommandText = sql;

				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					questionList.Add(new Models.Question {
						Id = (int)rdr["Id"],
						Title = (string)rdr["Title"],
						QuestionAt = (DateTime)rdr["Question_At"]
					});
				}

				return questionList;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
	}
}
