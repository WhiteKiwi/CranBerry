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
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Update User Set Visit = Visit + 1 where Total="+ "Total", conn);
            cmdd.CommandType = CommandType.Text;
            cmdd.ExecuteNonQuery();
            cmdd.Dispose();
            conn.Close();
        }
	}
}   