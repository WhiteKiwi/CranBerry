﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
	public partial class Answer : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

		}

		protected void AnswerButton_Click(object sender, EventArgs e) {
			Managers.QnAManager.AddAnswer(new Models.Question {
				Id = int.Parse(QuestionID.Text),
				Answer = AnswerContent.Text
			});
		}
	}
}