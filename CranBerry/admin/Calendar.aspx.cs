using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


namespace CranBerry.admin {
	public partial class Calendar : System.Web.UI.Page {
        string[,] Schedule = new string[13, 32];
        protected void Page_Load(object sender, EventArgs e)
        {
            Schedule[2, 1] = "하하";

            Schedule[2, 8] = "히히";

          
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            CalendarDay day = (CalendarDay)e.Day;
            TableCell cell = (TableCell)e.Cell;

            if (!day.IsOtherMonth)
            {
                String ScheduleStr = Schedule[day.Date.Month, day.Date.Day];

                if (holidayStr != null)
                {
                    
                    cell.Controls.Add(new LiteralControl(" " + holidayStr)); 
                }
            }
        }
        protected void Calendar1_Selecti0nChanged(object sender, EventArgs e)
        {
            selectedLabel.Text = "선택한 일 : " +
                Calendar1.SelectedDate.ToLongDateString();
        }
    }
}
    