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
    }
}