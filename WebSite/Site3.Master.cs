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
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("index1.aspx");
        }

        protected void Katalog_Click(object sender, EventArgs e)
        {
            Response.Redirect("katalog.aspx");
        }

        protected void Orders_Click(object sender, EventArgs e)
        {
            Response.Redirect("lk.aspx");
        }
    }
}