
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.master
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var rand = new Random(DateTime.Now.Millisecond);

            HttpCookie cookie = Request.Cookies["UserID"];
            if (cookie == null)
            {
                cookie = new HttpCookie("UserID");
                cookie.Value = rand.Next().ToString() + " / " + rand.Next().ToString();
                cookie.Expires = DateTime.Now.AddYears(5);
                Response.Cookies.Add(cookie);
            }

        }
    }
}