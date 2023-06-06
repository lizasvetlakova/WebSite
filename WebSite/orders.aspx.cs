using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Session["IDN"] = this.GridView1.SelectedValue;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MyCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[index];
                int num = Convert.ToInt32(selectedRow.Cells[0].Text);

                DataClasses1DataContext db = new DataClasses1DataContext();

                var updateN = (from item in db.Накладные
                               where item.Номер_накладной == num
                               select item).Single();

                updateN.Дата = DateTime.Now;
                updateN.Код_пользователя = Convert.ToInt32(Session["IDUser"]);
                updateN.Код_типа = 2;

                db.SubmitChanges();
                Label3.Visible = true;
                Label3.Text = "Успешное создание накладной!";
                
            }
            //сделать создание расходной накладной с новым номером
            //чтобы заявка осталась у пользователя, поменяется статус заявки
            //добаление новой строки в таблицу накладная
            //как перенести содержание???
            //пока что сделано просто: меняется тип накладной

            

        }


        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "KolCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView2.Rows[index];
                TextBox kol = (TextBox)selectedRow.FindControl("Количество");
                int kod = Convert.ToInt32(selectedRow.Cells[3].Text);
                decimal sumInit = Convert.ToDecimal(selectedRow.Cells[6].Text);
                decimal k = Convert.ToDecimal(kol.Text);
                decimal c = Convert.ToDecimal(selectedRow.Cells[5].Text);
                decimal sum = k * c;
                decimal razn = sum - sumInit;

                DataClasses1DataContext db = new DataClasses1DataContext();

                int num = Convert.ToInt32(Session["IDN"]);

                var updateSod = (from item in db.Содержание_накладной
                                  where (item.Номер_накладной == num && item.Код_товара == kod)
                                  select item).Single();

                updateSod.Количество = Convert.ToInt16(kol.Text);
                updateSod.Сумма = sum;
                db.SubmitChanges();

                DataClasses1DataContext db2 = new DataClasses1DataContext();
                var updateNakl = (from item in db2.Накладные
                                  where item.Номер_накладной == num
                                  select item).Single();
                updateNakl.Сумма += razn;

                db2.SubmitChanges();

                Label2.Text = "Успешное обновление!";
                //Response.Redirect("orders.aspx");
            }
            else if(e.CommandName == "DelCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView2.Rows[index];
                int kod = Convert.ToInt32(selectedRow.Cells[3].Text);
                int num = Convert.ToInt32(Session["IDN"]);

                string crit = "DELETE FROM Содержание_накладной WHERE Номер_накладной = " + num + "and Код_товара = " + kod;
                DataClasses1DataContext db = new DataClasses1DataContext();
                SqlDataSource3.SelectCommand = crit;
                GridView2.DataBind();
            }
        }
    }
}