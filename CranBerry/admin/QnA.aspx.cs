using System;

namespace CranBerry.admin

{
    public partial class QnA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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