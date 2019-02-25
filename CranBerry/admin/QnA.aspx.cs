using System;

namespace CranBerry.admin

{
    public partial class QnA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserID"] == null)
            {
                // Cookie가 없을 경우 발급
                var rand = new Random(DateTime.Now.Millisecond);
                Response.Cookies["UserID"].Value = rand.Next().ToString() + "/" + rand.Next().ToString();
                Response.Cookies["UserID"].Expires = DateTime.Now.AddYears(5);
            }
            else
            {
                // 밴 리스트 검사 후 차단
                // if (BanManager.IsBan(Request.Cookies["UserID"].Value)) {
                //	Response.Redirect("/");

                //	return;
                // }
            }
            // 분류 목록 추가
            titleOrContents.Items.Add("제목");
            titleOrContents.Items.Add("내용");
        }

        protected void Searching(object sender, EventArgs e)
        {
            if (titleOrContents.SelectedValue == "제목")
                Response.Redirect("/QnA.aspx?titleSearch=" + SearchText.Text);
            else
                Response.Redirect("/QnA.aspx?contentsSearch=" + SearchText.Text);
        }

        protected void LeftButton_Click(object sender, EventArgs e)
        {
            int page;
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch (Exception ex)
            {
                page = 1;
            }

            if (page > 1)
                Response.Redirect("/QnA.aspx?page=" + (page - 1));
        }

        protected void RightButton_Click(object sender, EventArgs e)
        {
            int page;
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch (Exception ex)
            {
                page = 1;
            }

            if (page < Managers.QnAManager.GetPagesCount())
                Response.Redirect("/QnA.aspx?page=" + (page + 1));
        }
    }
}