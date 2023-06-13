using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class lk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDN"] = this.GridView1.SelectedValue;
            Response.Redirect("checkOrder.aspx");
        }

        protected void OrderButton_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var nakl = (from item in db.Накладные
                        orderby item.Номер_накладной descending
                        select item).First();
            Session["Nomer"] = nakl.Номер_накладной + 1;
            Session["Data"] = DateTime.Now.ToShortDateString();
            Response.Redirect("order.aspx");
        }
    }
}