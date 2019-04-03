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
            int id = 0;
            MySqlCommand cmmdd = new MySqlCommand("Update User Set Visit = Visit + 1 where Total=" + id, conn);
            cmmdd.CommandType = CommandType.Text;
            cmmdd.ExecuteNonQuery();
            cmmdd.Dispose();
            DateTime today = DateTime.Now;
            string Date = today.ToString("yyyy-MM-dd");
      
            MySqlCommand cmdd = new MySqlCommand("Select * from User where Date=@Date",conn);
            cmdd.CommandType = CommandType.Text;
            cmdd.Parameters.AddWithValue("@Date", Date);    
            obj = cmdd.ExecuteScalar();
            MySqlDataReader reader = cmdd.ExecuteReader();

        
            if (obj != null){
                MySqlCommand cmd = new MySqlCommand("Update User Set Visit = Visit + 1 where Date=str_to_date(@Date,'%Y-%m-%d')", conn);
                cmd.Parameters.AddWithValue("@Date", Date);

           
                   
                    cmd.CommandType = CommandType.Text;
                    cmdd.Dispose();
                    cmd.ExecuteNonQuery();




                reader.Close();
                cmd.Dispose();
                conn.Close();
            }
            else
            {
                cmdd.Dispose(); 
                string sql = "Insert Into User (Visit, Date) VAlues (?,?);";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.Add("Visit", MySqlDbType.Int32).Value = 1;
                cmd.Parameters.Add("Date", MySqlDbType.DateTime).Value = Date;

                cmd.ExecuteNonQuery();
                reader.Close();
                cmd.Dispose();
                conn.Close();
            }
        }
	}
}   