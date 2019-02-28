using System;

namespace CranBerry.admin

{
    public partial class QnA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Searching_Click(object sender, EventArgs e)
        {
            if (TitleOrContents.SelectedValue == "제목")
                Response.Redirect("admin/QnA.aspx?titleSearch=" + txtSearch.Text);
            else
                Response.Redirect("admin/QnA.aspx?contentsSearch=" + txtSearch.Text);


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
                Response.Redirect("admin/QnA.aspx?page=" + (page - 1));
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
                Response.Redirect("admin/QnA.aspx?page=" + (page + 1));
        }
    }
}