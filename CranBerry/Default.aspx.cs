using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry {
	public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
          
            object obj;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            conn.Open();
            MySqlCommand cmmdd = new MySqlCommand("Update User Set Visit = Visit + 1 where Total=" + "Total", conn);
            cmmdd.CommandType = CommandType.Text;
            string Date = DateTime.Today.ToShortDateString();
          
            MySqlCommand cmdd = new MySqlCommand("Select * from User where Date=@Date",conn);
            cmdd.CommandType = CommandType.Text;
            cmdd.Parameters.AddWithValue("@Date", Date);    
            obj = cmdd.ExecuteScalar();
            MySqlDataReader reader = cmdd.ExecuteReader();
           



            if (obj != null){
                while (reader.Read())
                {
                    MySqlCommand cmd = new MySqlCommand("Update User Set Visit = Visit + 1 where Date=" + Date, conn);
                    cmd.CommandType = CommandType.Text;
                   
                }
                cmdd.Dispose();
               
                conn.Close();
            }
            else
            {
                string sql = "Insert Into User (Visit, Date) VAlues (?,?);";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.Add("Visit", MySqlDbType.Int32).Value = 1;
                cmd.Parameters.Add("Date", MySqlDbType.DateTime).Value = DateTime.Now;

                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
	}
}   