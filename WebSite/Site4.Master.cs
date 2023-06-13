using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Site4 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long idUser = Convert.ToInt64(Session["IDUser"]);
            string nameUser = Convert.ToString(Session["NameUser"]);
            if (idUser != 0)
            {
                FIO.Text = nameUser;

            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
        protected void Kontr_Click(object sender, EventArgs e)
        {
           
        }

        protected void Katalog_Click(object sender, EventArgs e)
        {
            Response.Redirect("tovar.aspx");
        }

        protected void Sklad_Click(object sender, EventArgs e)
        {
            Response.Redirect("sklad.aspx");
        }
        protected void Doc_Click(object sender, EventArgs e)
        {
            Response.Redirect("documents.aspx");
        }
        protected void Orders_Click(object sender, EventArgs e)
        {
            Response.Redirect("orders.aspx");
        }
    }
}