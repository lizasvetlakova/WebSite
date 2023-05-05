using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using System.Data.SqlClient;

namespace WebSite
{
    public partial class katalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.Visible = false;
            Session["IDK"] = this.DropDownList1.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.Visible = true;
            Session["IDT"] = this.GridView1.SelectedValue;
        }

        protected void AllItems_Click(object sender, EventArgs e)
        {
            DetailsView1.Visible = false;
            SqlDataSource2.SelectCommand = "SELECT [Код_товара], [Наименование], [Цена], [Код_категории] FROM [Товары]";
            GridView1.DataBind();
        }
    }
}