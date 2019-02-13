using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CranBerry.admin {
	public partial class Edit : System.Web.UI.Page {
		protected void Page_Load(object sender, EventArgs e) {
		}

		protected void GetBerry(object sender, EventArgs e) {
			var berry = Managers.BerryManager.GetBerryByID(int.Parse(BerryNum.Text));

			Contents.Text = berry.Contents;
		}

		protected void EditBerry(object sender, EventArgs e) {
			Managers.BerryManager.EditBerry(int.Parse(BerryNum.Text), Contents.Text);

			//Response.Redirect("/admin/Edit.aspx");
		}
	}
}