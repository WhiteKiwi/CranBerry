using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


namespace CranBerry.admin {
	public partial class Calendar : System.Web.UI.Page {
        /*
    public void ddlInit()
    {
        for (int i = 2000; i <= 2050; i++)
        {
            this.                                   ddlYear.Items.Add(i.ToString());
        }
        this.ddlYear.Text = DateTime.Now.Year.ToString();
        for (int i = 1; i <= 12; i++)
        {
            this.ddlMonth.Items.Add(i.ToString());
        }
        this.ddlMonth.Text = DateTime.Now.Month.ToString();
    }
       

     protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlInit();
        }
        DateTime curDay=new DateTime(int.Parse(this.ddlYear.Text),int.Parse(this.ddlMonth.Text),1);
        int 요일 = Convert.ToInt32(curDay.DayOfWeek);
        DateTime useDay=new DateTime(int.Parse(this.ddlYear.Text), int.Parse(this.ddlMonth.Text), 1).AddMonths(1).AddDays(-1);
        int 마지막날짜 = useDay.Day;
        string[] 요일이름 = { "일", "월", "화", "수", "목", "금", "토" };
        TableHeaderRow hrow = new TableHeaderRow();
        
        for (int i = 0; i < 요일이름.Length; i++)
        {
            TableHeaderCell tcell = new TableHeaderCell();
            tcell.Font.Bold = true;
            tcell.Text = 요일이름[i];
            if (요일이름[i] == "일") tcell.ForeColor = System.Drawing.Color.Red;
            if (요일이름[i] == "토") tcell.ForeColor = System.Drawing.Color.Blue;
            hrow.Cells.Add(tcell);
        }
        this.  tblCalendar.Rows.Add(hrow);
        
        for (int i = 0,d=1,p=0,n=0; i < 6; i++)
        {
            TableRow row = new TableRow();
            for (int j = 0; j < 7; j++)
            {
                TableCell cell = new TableCell();
                cell.Width = 100;
                cell.Height = 100;
                cell.Font.Size = 13;
                cell.Font.Bold = true;
                cell.HorizontalAlign = HorizontalAlign.Right;
                cell.BorderWidth = 2;
                cell.BorderColor = System.Drawing.Color.Black;
                if (i * 7 + j + 1 <= 요일)//해당 달의 전달의 끝 날짜들 채워넣기
                {
                    int previousMonthLastDay= curDay.AddDays(-1).Day;
                    int previousMonthDay = previousMonthLastDay - (요일 - 1);
                    cell.ForeColor = System.Drawing.Color.Gray;
                    cell.Text = (previousMonthDay+p).ToString();
                    row.Cells.Add(cell);
                    p++;
                }
                else if (마지막날짜 < d)//해당 달의 날짜를 벗어난 빈 셀들 1부터 채워 넣기
                {
                    n++;
                    cell.ForeColor = System.Drawing.Color.Gray;
                    cell.Text = (n).ToString();
                    row.Cells.Add(cell);
                }
                else//해달 달의 일자 예)1~30일까지 채워넣기
                {
                    DateTime curDate = new DateTime(int.Parse(this.ddlYear.Text), int.Parse(this.ddlMonth.Text), d);
                    if (Convert.ToInt32( curDate.DayOfWeek) == 0) cell.ForeColor = System.Drawing.Color.Red;
                    if (Convert.ToInt32(curDate.DayOfWeek) == 6) cell.ForeColor = System.Drawing.Color.Blue;
                    if (DateTime.Now.Day == d) cell.BackColor = System.Drawing.Color.Yellow;
                    cell.Text = d.ToString();
                    d++;
                    row.Cells.Add(cell);
                }
            }
            this.tblCalendar.Rows.Add(row);
        }
        }
        */
	}
}
    