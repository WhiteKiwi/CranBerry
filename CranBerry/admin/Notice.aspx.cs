using System;

namespace CranBerry.admin
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var noticeID = Request.QueryString["id"];

            // noticeid가 존재할 경우
            if (!String.IsNullOrEmpty(noticeID))
            {
                var notice = Managers.NoticeManager.GetNoticeByID(int.Parse(noticeID));

                nTitle.Text = notice.Title;
                Contents.Text = notice.Contents;
                NoticeAt.Text = notice.NoticeAt.ToString("yyyy-MM-dd");
            }
            else
            {
                nTitle.Text = "404 Not Found.";
                Contents.Text = "404 Not Found.";
                NoticeAt.Text = "404 Not Found.";
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            var noticeID = Request.QueryString["id"];

            Managers.NoticeManager.DeleteNotice(new Models.Notice
            {
                id = int.Parse(noticeID)
            });
        }
    }
}