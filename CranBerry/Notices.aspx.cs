﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry {
	public partial class Notices : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {

		}

		protected void LeftButton_Click(object sender, EventArgs e) {
			int page;
			try {
				page = int.Parse(Request.QueryString["page"]);
			} catch (Exception ex) {
				page = 1;
			}

			if (page > 1)
				Response.Redirect("/Notices.aspx?page=" + (page - 1));
		}

		protected void RightButton_Click(object sender, EventArgs e) {
			int page;
			try {
				page = int.Parse(Request.QueryString["page"]);
			} catch (Exception ex) {
				page = 1;
			}

			if (page < Managers.NoticeManager.GetPagesCount())
				Response.Redirect("/Notices.aspx?page=" + (page + 1));
		}
	}
}