using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin
{
    public partial class UploadBerry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void UploadBtn_Click(object sender, EventArgs e)
        {
            Managers.BerryManager.AddBerry(new Models.Berry
            {
                Title = BerryTitle.Text,
                Contents = BerryContent.Text
            });
        }
    }
}
