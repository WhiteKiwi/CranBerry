﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CranBerry.managers
{
    public static class BanManager
    {   
     
 
        /// <summary>   
        /// Ban Test
        /// </summary>
        public static bool IsBan(string UserId)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
                conn.Open();

                // Connect to Database
                string sql = "SELECT * FROM  ban_list  ";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if ((string)rdr["UserID"] == UserId)
                        return true;
                }

                return false;
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