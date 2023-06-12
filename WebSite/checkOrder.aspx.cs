using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class checkOrder : System.Web.UI.Page
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
            Сумма.Text = Convert.ToString(nakl.Сумма);
        }

        protected void Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("lk.aspx");
        }

    }
}