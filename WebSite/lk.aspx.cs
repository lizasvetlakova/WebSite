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
            Panel1.Visible = true;
            Session["IDN"] = this.GridView1.SelectedValue;
        }

        protected void OrdersButton_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }
    }
}