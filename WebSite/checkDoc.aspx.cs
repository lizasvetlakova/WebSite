using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class checkDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(Session["IDN"]);

            DataClasses1DataContext db = new DataClasses1DataContext();

            var nakl = (from item in db.Накладные
                        where item.Номер_накладной == num
                        select item).Single();
                      

            Nomer.Text = Convert.ToString(nakl.Номер_накладной);
            Data.Text = DataBank.FormatData(Convert.ToString(nakl.Дата));
            Сумма.Text = Convert.ToString(nakl.Сумма) + " ₽";
        }

        protected void Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("lk.aspx");
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            decimal sum = 0;
            int K = 0;

            foreach (GridViewRow row in GridView2.Rows)
            {
                decimal price = decimal.Parse(row.Cells[4].Text);
                int kol = int.Parse(row.Cells[2].Text);
                sum += price;
                K += kol;
            }

            GridViewRow footer = GridView2.FooterRow;

            footer.Cells[0].ColumnSpan = 2;
            footer.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            footer.Cells.RemoveAt(1);
            
            footer.Cells[0].Text = "Итого:";
            footer.Cells[1].Text = K.ToString();
            footer.Cells[3].Text = sum.ToString("C");

        }
    }
}