using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace CranBerry.Managers {

	public static class AdminManager {
        /// <summary>
        /// Get Admin List
        /// </summary>
        const string SALT = "JhCI2?-!?5Df(???H3*??<ICBe_?>W>i?%z|:c??k~B#6:>a";
        public static List<Admin> GetAdmins() {
            MySqlConnection conn = null;
            try {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();

                List<Admin> admins = new List<Admin>();

                string sql = "SELECT * FROM admins;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read()) {
                    admins.Add(new Admin {
                        ID = (string)rdr["Id"],
                        Name = (string)rdr["Name"]
                    });
                }

                return admins;
            } catch (Exception e) {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            } finally {
                conn.Close();
            }
        }

        //계정추가
        public static int AddAdmin(Admin admin)
            {
              
                int result = 0;
                MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("insert into admins(Id, Name, Password)values('{0}','{1}', '{2}')", admin.ID, admin.Name, admin.Password+SALT);

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

        //비밀번호 초기화
        public static int resetPassword(Admin admin)
        {
            int result = 0;
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("update admin set Password = 'cranberry' where Id = '{0}'", admin.ID );
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

        //비밀번호 변경
        public static int ChangePassword(Admin admin)
        {
            int result = 0;
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("update admin set Password = '{0}' where Id = '{1}'", admin.Password+SALT ,admin.ID);
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

        //로그인
        public static bool AdminVerification(string Id, string Password){
            MySqlConnection conn = null;
            try{
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();
                string sql = "SELECT * FROM admin WHERE Id=" + Id + ";";
                if(sql.Password == Password + SALT)
                    return true;
                return false;
                }

            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }



        }
    }
}