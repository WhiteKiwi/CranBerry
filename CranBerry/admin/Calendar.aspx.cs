using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;

namespace CranBerry.admin
{
    public partial class Calendar : System.Web.UI.Page
    {
        //Hashtable HolidayList;

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    HolidayList = Getholiday();
        //    Calendar1.Caption = "Calender - Author: Puran Singh Mehra";
        //    Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
        //    Calendar1.NextPrevFormat = NextPrevFormat.ShortMonth;
        //    Calendar1.TitleFormat = TitleFormat.Month;
        //    Calendar1.ShowGridLines = true;
        //    Calendar1.DayStyle.Height = new Unit(50);
        //    Calendar1.DayStyle.Width = new Unit(150);
        //    Calendar1.DayStyle.HorizontalAlign = HorizontalAlign.Center;
        //    Calendar1.DayStyle.VerticalAlign = VerticalAlign.Middle;
        //    Calendar1.OtherMonthDayStyle.BackColor = System.Drawing.Color.AliceBlue;
        //}

        //private Hashtable Getholiday()
        //{
        //    Hashtable holiday = new Hashtable();
        //    holiday["1/1/2019"] = "New Year";
        //    holiday["1/1/2019"] = "Guru Govind Singh Jayanti";

        //    return holiday;
        //}

        //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        //{
        //    LabelAction.Text = "Date changed to :" + Calendar1.SelectedDate.ToShortDateString();
        //}

        //protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        //{
        //    LabelAction.Text = "Month changed to :" + e.NewDate.ToShortDateString();
        //}

        //protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (HolidayList[e.Day.Date.ToShortDateString()] != null)
        //    {
        //        Literal literal1 = new Literal();
        //        literal1.Text = "<br/>";
        //        e.Cell.Controls.Add(literal1);
        //        Label label1 = new Label();
        //        label1.Text = (string)HolidayList[e.Day.Date.ToShortDateString()];
        //        label1.Font.Size = new FontUnit(FontSize.Small);
        //        e.Cell.Controls.Add(label1);
        //    }
        //}
    }
}