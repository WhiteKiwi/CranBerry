using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
    public partial class Accounts : System.Web.UI.Page
    {
        protected void ChangePasswordButton_Click(object sender, EventArgs e)
        {
            Managers.AdminManager.ChangePassword(new Models.Admin
            {
                OldPasswrod = OldPassword.Text,
                NewPassword = NewPassword.Text

            });
        }
        protected void AddAdminButton_Click(object sender, EventArgs e)
        {
            Managers.AdminManager.AddAdmin(new Models.Admin
                { 
                    ID = AdminID.Text,
                    Name = AdminName.Text


                });
        }
    }
}