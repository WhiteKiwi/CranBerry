using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
	public partial class EditNotice : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
            var noticeID = Request.QueryString["id"];

            var notice = Managers.NoticeManager.GetNoticeByID(int.Parse(noticeID));

            TitleLabel.Text = notice.Title;
            ContentsLabel.Text = notice.Contents;
        }

        protected void NoticeSaveButton_Click(object sender, EventArgs e)
        {
            Managers.NoticeManager.ModifyNotice(new Models.Notice
            {
                Id = int.Parse(Request.QueryString["id"]),
                Contents = ContentsLabel.Text

            });
        }

    }
}