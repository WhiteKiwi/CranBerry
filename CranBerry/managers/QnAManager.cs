using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;

namespace CranBerry.Managers {
    public static class QnAManager
    {
        /// <summary>
        /// Get recent QnAs
        /// </summary>
        public static List<Models.Question> GetRecentQuestions()
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();

                List<Models.Question> questions = new List<Models.Question>();

                string sql = "SELECT * FROM questions ORDER BY Id DESC LIMIT 9;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    questions.Add(new Models.Question
                    {
                        Id = (int)rdr["Id"],
                        Title = (string)rdr["Title"],
                        Contents = (string)rdr["Contents"],
                        QuestionAt = (DateTime)rdr["Question_At"]
                    });
                }

                return questions;
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

        /// <summary>
        /// Get QnA by Id
        /// </summary>
        public static Models.Question GetQnA(int Id)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();

                string sql = "SELECT * FROM questions WHERE Id=" + Id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var rdr = cmd.ExecuteReader();
                rdr.Read();
                Models.Question question = new Models.Question
                {
                    Id = (int)rdr["Id"],
                    Title = (string)rdr["Title"],
                    Contents = (string)rdr["Contents"],
                    QuestionAt = (DateTime)rdr["Question_At"],
                    Answer = (string)rdr["Answer"]
                };
                rdr.Close();

                return question;
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
        /*
         * 이준모 - 랜덤 문자열 생성
         */
        public static char[] rndchrset = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
        //사용될 문자들

        public static string RandText()
        {
            Random rnd = new Random();
            int i;
            string randstr = "";
            for (i = 0; i < 7; i++) randstr += rndchrset[rnd.Next(0, 61)];
            return randstr;
        }

        /*
         * 서정민 - 페이지 질문 불러오기
         */

        public static List<Models.Question> GetQuestionsByPage(int page)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();

                List<Models.Question> questions = new List<Models.Question>();

                // Get Questions Count
                string sql = "SELECT count(*) FROM questions;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int questionCount = Convert.ToInt32(cmd.ExecuteScalar());

                // Get Questions
                sql = "SELECT Id, Title, Question_At FROM questions ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
                cmd.CommandText = sql;

                var rdr = cmd.ExecuteReader();
                rdr.Read();
                while (rdr.Read())
                {
                    questions.Add(new Models.Question
                    {
                        Id = (int)rdr["Id"],
                        Title = (string)rdr["Title"],
                        QuestionAt = (DateTime)rdr["Question_At"]
                    });
                }

                return questions;
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
        //질문 수정
        public static int ModifyQuestion(Models.Question question, string RandText)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();

            if (question.Answer != "0" )
                return -1;
                    
            {
                try
                {
                    int result = 0;
                    
                    cmd.Connection = con;
                    cmd.CommandText = string.Format("SELECT RandText FROM questions WHERE Id = "+ question.Id);
                    con.Open();
                    if (RandText == (string)cmd.ExecuteScalar())
                    {
                        //질문 업데이트
                        cmd.CommandText = string.Format("update question set Contents='{0}' where Id='{1}'", question.Contents, question.Id);
                        result = cmd.ExecuteNonQuery();
                        return result;
                    }
                    else return -1;
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
        public static int AddAnswer(Models.Question answer)
        {
            int result = 0;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            try
            {

               
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = string.Format("update answer Set Answer=@Answer, Id= @Id where Id=" + answer.Id);

                cmd.Parameters.AddWithValue("@Answer", answer.Contents);
                cmd.Parameters.AddWithValue("@Id", answer.Id);
                result = cmd.ExecuteNonQuery();
                return result;
              
                

            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }


            }

        public static void DeleteQuestion(int id)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = string.Format("DELETE FROM question WHERE Id=" + id);
            }
            catch(Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                cmd.Dispose();
                con.Close();
            }


        }

        }


        
        
   }
