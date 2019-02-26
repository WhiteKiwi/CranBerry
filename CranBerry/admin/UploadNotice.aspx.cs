using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace CranBerry.admin
{
    public partial class UploadNotice : System.Web.UI.Page
    {
       protected void SaveButton_Click(object sender, EventArgs e)
        {
            Managers.NoticeManager.ModifyNotice(new Models.Notice
            {
                Title = TitleBox.Text,
                Contents = ContentsBox.Text
            });
        }
        

    }
}