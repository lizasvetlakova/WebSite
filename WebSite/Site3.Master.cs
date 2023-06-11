using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Site3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void Katalog_Click(object sender, EventArgs e)
        {
            Response.Redirect("katalog.aspx");
        }

        protected void Order_Click(object sender, EventArgs e)
        {
            Response.Redirect("order.aspx");
        }

        protected void MyOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("katalog.aspx");
        }
    }
}