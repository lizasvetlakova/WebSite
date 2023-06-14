using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class documents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ProvCommand")
            {
                
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];
                int num = Convert.ToInt32(selectedRow.Cells[0].Text);

                DataClasses1DataContext db = new DataClasses1DataContext();

                var updateN = (from item in db.Накладные
                               where item.Номер_накладной == num
                               select item).Single();

                updateN.Статус = "Проведена";

                db.SubmitChanges();

                
                Label2.Visible = true;
                Label2.Text = "Накладная успешно проведена!";

            }


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDN"] = this.GridView1.SelectedValue;
            Response.Redirect("checkDoc.aspx");
        }
    }
}