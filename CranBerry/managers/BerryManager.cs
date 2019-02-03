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
    
    public static int ModifyBerry(Berry berry) //베리 수정
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
        MySqlCommand cmd = new MySqlCommand();
        try
        {
            int result = 0;
            cmd.Connection = con;
            cmd.CommandText = string.Format("SELECT berries FROM  WHERE Id = " + berry.Id);
            con.Open();
            //베리 업데이트
            cmd.CommandText = string.Format("update berries set Contents='{0}', Title={1} where Id='{2}'", berry.Contents, berry.Title, berry.Id);
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
    public static int DeleteBerry(Berry berry) // 베리삭제
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
           try{
                int result = 0;
                cmd.Connection = con;
                cmd.CommandText = string.Format("Delete From berries Where Id={0}", berry.Id);
                con.Open();
                result = cmd.ExecuteNonQuery();
                return result;

            }catch(Exception e)
            {
                throw new Exception(e.Message);
            }
            finally{
                con.Close();
            }
        }
    }

}

