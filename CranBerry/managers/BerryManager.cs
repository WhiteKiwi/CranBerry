using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CranBerry.managers
{
    public static class BerryManager //Beryy 추가
    {
        public static int AddBerry(Models.Berry berry)
        {

            int result = 0;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("insert into berries(Title,Contents,Classification)values('{0}','{1}','{2}')", berry.Title, berry.Contents, berry.Classification);
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

