using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class sklad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDK"] = this.DropDownList1.SelectedValue;
        }

        protected void AllButton_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT [Код_товара], [Наименование], [Цена], [Количество], [Код_категории] FROM [Товары]";
            GridView1.DataBind();
            
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            decimal sum = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                decimal price = decimal.Parse(row.Cells[2].Text);
                int kol = int.Parse(row.Cells[3].Text);
                sum = kol*price;
                row.Cells[5].Text = sum.ToString("C");
                sum = 0;
            }
        }
    }
}