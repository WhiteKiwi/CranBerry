using CranBerry.Models;
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
        protected void ClassificationList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Models.Classification classification;
            switch (ClassificationList.SelectedValue)
            {
                case "행사":
                    classification = Models.Classification.Event;
                    break;
                case "학교시설":
                    classification = Models.Classification.Facilities;
                    break;
                case "CNSA 용어":
                    classification = Models.Classification.CNSATerms;
                    break;
                case "생활/학습":
                    classification = Models.Classification.CNSALifeAndStudy;
                    break;
                case "인재관":
                    classification = Models.Classification.Dormitory;
                    break;
                case "동아리":
                    classification = Models.Classification.Club;
                    break;
                case "단체":
                    classification = Models.Classification.Group;
                    break;
                default:
                     classification = Models.Classification.Contest;
                    break;
             

                  

            }
        
                //HttpPostedFile uploads = Request.Files["upload"];

                //string CKEditorFuncNum = Request["CKEditorFuncNum"];

                //string file = System.IO.Path.GetFileName(uploads.FileName);

                //uploads.SaveAs(Server.MapPath("/images/") + file);

                //string url = "/images/" + file;

                //Response.Write(string.Format("<script>window.parent.CKEDITOR.tools.callFunction('{0}', '{1}', '')</script>", CKEditorFuncNum, url));

                //Response.End();
            
            Managers.BerryManager.AddBerry(new Models.Berry
            {

                Title = BerryTitle.Text,
                Contents = BerryContent.Text,
                Classification = classification

            });
        }
        public class Upload : IHttpHandler
        {
            public void ProcessRequest(HttpContext context)
            {
                HttpPostedFile uploads =context.Request.Files["upload"];

                string CKEditorFuncNum = context.Request["CKEditorFuncNum"];

                string file = System.IO.Path.GetFileName(uploads.FileName);

                uploads.SaveAs(context.Server.MapPath("/images/") + file);

                string url = "/images/" + file;

                context.Response.Write(string.Format("<script>window.parent.CKEDITOR.tools.callFunction('{0}', '{1}', '')</script>", CKEditorFuncNum, url));

               context.Response.End();
            }
            public bool IsReusable {
                get {
                    return false;
                }
            }
        }



    }
}
