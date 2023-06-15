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

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            foreach (GridViewRow row in GridView1.Rows)
            {
                int kodT = int.Parse(row.Cells[1].Text);
                int kodK = int.Parse(row.Cells[3].Text);

                var type = (from item in db.Типы_накладной
                             where item.Код_типа == kodT
                             select item).Single();
                var agent = (from item in db.Контрагенты
                             where item.Код_контрагента == kodK
                             select item).Single();

                row.Cells[1].Text = type.Название_накладной;
                row.Cells[3].Text = agent.Короткое_имя;

            }
        }

        protected void Type_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var dd = from item in db.Накладные
                    where item.Код_типа.ToString() == DropDownList1.SelectedValue && item.Код_пользователя == Convert.ToInt64(Session["IDUser"])
                    orderby item.Номер_накладной descending
                    select item;
            GridView1.DataSourceID = "";
            GridView1.DataSource = dd;
            GridView1.DataBind();
        }


        protected void Date_Click(object sender, EventArgs e)
        {
            DateTime data1 = DateTime.Parse(TextBox1.Text);
            DateTime data2 = DateTime.Parse(TextBox2.Text);
            DataClasses1DataContext db = new DataClasses1DataContext();
            var dd = from item in db.Накладные
                     where item.Дата >= data1 && item.Дата <= data2 && item.Код_пользователя == Convert.ToInt64(Session["IDUser"])
                     orderby item.Дата ascending
                     select item;
            GridView1.DataSourceID = "";
            GridView1.DataSource = dd;
            GridView1.DataBind();
        }

        protected void All_Click(object sender, EventArgs e)
        {
           GridView1.DataSourceID = "SqlDataSource2";
           // GridView1.DataSource = dd;
            GridView1.DataBind();
        }

        protected void Добавление_Click(object sender, ImageClickEventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var nakl = (from item in db.Накладные
                        orderby item.Номер_накладной descending
                        select item).First();
            Session["Nomer"] = nakl.Номер_накладной + 1;
            Session["Data"] = DateTime.Now.ToShortDateString();
            Response.Redirect("nakl.aspx");
        }
    }
}