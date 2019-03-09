using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;


namespace CranBerry
{
    /*
         * 서정민 - 페이징
    */
    public class CPaging : System.Web.UI.Page
    {
        private int page;
        private int rowPerPage;
        private int totalRecord;
        private int totalPage;
        private int sPage;
        private int ePage;

        public int PageNo {
            set { page = value; }
            get { return page; }
        }

        public int RowPerPage {
            set { rowPerPage = value; }
            get { return rowPerPage; }
        }

        public int TotalRecord {
            set { totalRecord = value; }
            get {
                if (totalRecord / 10 == 0)
                    totalPage = totalRecord / 10;
                else
                    totalPage = totalRecord / 10 + 1;

                return totalPage;
            }
        }

        public int TotalPage {
            set { totalPage = value; }
            get { return totalPage; }
        }

        public int returnePage()
        {
            if ((this.page % this.rowPerPage) == 0)
            {
                this.sPage = ((this.page / this.rowPerPage) * this.rowPerPage + 1) - this.rowPerPage;
                this.ePage = this.sPage + (this.rowPerPage - 1);
            }

            else
            {
                this.sPage = (this.page / this.rowPerPage) * this.rowPerPage + 1;
                this.ePage = this.sPage + (this.rowPerPage - 1);
            }

            if (this.ePage >= this.totalPage)
                this.ePage = this.totalPage;

            return ePage;
        }

    }

    public partial class Question : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var User = Request.Cookies["UserID"].Value;
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            con.Open();
            object obj;
            // Connect to Database
            MySqlCommand cmmd = new MySqlCommand("Select * from ban_list where UserID = @UserID", con);

            cmmd.CommandType = CommandType.Text;
            cmmd.Parameters.AddWithValue("@UserID", User);
            obj = cmmd.ExecuteScalar();
            MySqlDataReader rdr = cmmd.ExecuteReader();
            if (obj != null)

            {
                while (rdr.Read())
                {
                    Response.Redirect("/");

                }
            }
            cmmd.Dispose();
            con.Close();

            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
            conn.Open();
            MySqlCommand cmdd = new MySqlCommand("Update questions Set Count = Count + 1 where Id = " + Request.QueryString["Id"], conn);
            cmdd.CommandType = CommandType.Text;
            cmdd.ExecuteNonQuery();
            cmdd.Dispose();
            conn.Close();
        }
    }

}
