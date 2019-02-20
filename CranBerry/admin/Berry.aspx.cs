using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin
{
    public partial class Berry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeleteBUtton_Click(object sender, EventArgs e)
        {
            Managers.BerryManager.DeleteBerry(new Berry{
                id = Request.Querystring[BerryID]
            });
        }
    }
}