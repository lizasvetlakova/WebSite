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
            long idUser = Convert.ToInt64(Session["IDUser"]);
            string nameUser = Convert.ToString(Session["NameUser"]);
            if (idUser != 0)
            {
                Label4.Text = nameUser;
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDN"] = this.GridView1.SelectedValue;
            int num = Convert.ToInt32(Session["IDN"]);

            DataClasses1DataContext db = new DataClasses1DataContext();

            var nakl = (from item in db.Накладные
                           where item.Номер_накладной == num
                           select item).Single();
            int k = Convert.ToInt32(nakl.Код_контрагента);
            
            var kon = (from item in db.Контрагенты
                       where item.Код_контрагента == k
                       select item).Single();

            Nomer.Text = Convert.ToString(nakl.Номер_накладной);
            Data.Text = Convert.ToString(nakl.Дата);
            Kontr.Text = Convert.ToString(kon.Короткое_имя);
            Сумма.Text = Convert.ToString(nakl.Сумма);
            Panel1.Visible = true;
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

    }
}