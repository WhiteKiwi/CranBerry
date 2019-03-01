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
            Content.FilebrowserImageUploadUrl = "/admin/Upload.ashx";
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


            
            Managers.BerryManager.AddBerry(new Models.Berry
                {

                    Title = BerryTitle.Text,
                Contents = Content.Text,
                Classification = classification

                });
            
        }
        



    }
}
