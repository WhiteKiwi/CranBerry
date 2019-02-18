using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
     public partial class Accounts : System.Web.UI.Page

{
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["select"] != null && Request.QueryString["adminID"] != null)
            {
                if (Request.QueryString["select"] == "reset")
                {
                    // ���� ��й�ȣ �ʱ�ȭ
                    Managers.AdminManager.AddAdmin(AdminID.Text, AdminName.Text);
                }
                else if (Request.QueryString["select"] == "delete")
                {
                    // ���� ����
                    Managers.AdminManager.ChangePassword(OldPassword.Text, NewPassword.Text);
                }
            }

            Response.Redirect("/admin/Accounts.aspx");
        }
    
}
}