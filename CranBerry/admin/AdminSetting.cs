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
                    // 계정 비밀번호 초기화
                    Managers.AdminManager.ChangePassword(NewPassword.Text,OldPassword.Text);
                }
                else if (Request.QueryString["select"] == "delete")
                {
                    // 계정 삭제
                    Managers.AdminManager.DeleteAccount(AdminID.Text, AdminName.Text);
                }
            }

            Response.Redirect("/admin/Accounts.aspx");
        }
    
}
}