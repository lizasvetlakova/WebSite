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
                int kod = Convert.ToInt32(selectedRow.Cells[2].Text);
                decimal sumInit = Convert.ToDecimal(selectedRow.Cells[5].Text);
                decimal k = Convert.ToDecimal(kol.Text);
                decimal c = Convert.ToDecimal(selectedRow.Cells[4].Text);
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
                Response.Redirect("orders.aspx");
            }
            else if(e.CommandName == "DelCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView2.Rows[index];
                int kod = Convert.ToInt32(selectedRow.Cells[2].Text);
                decimal sumDel = Convert.ToDecimal(selectedRow.Cells[5].Text);
                int num = Convert.ToInt32(Session["IDN"]);

                string crit = "DELETE FROM Содержание_накладной WHERE Номер_накладной = " + num + "and Код_товара = " + kod;
                DataClasses1DataContext db = new DataClasses1DataContext();
                SqlDataSource3.SelectCommand = crit;
                GridView2.DataBind();

                DataClasses1DataContext db2 = new DataClasses1DataContext();
                var updateNakl = (from item in db2.Накладные
                                  where item.Номер_накладной == num
                                  select item).Single();
                updateNakl.Сумма -= sumDel;

                db2.SubmitChanges();
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            foreach (GridViewRow row in GridView1.Rows)
            {
                int kodK = int.Parse(row.Cells[1].Text);
                var agent = (from item in db.Контрагенты
                            where item.Код_контрагента == kodK
                            select item).Single();

                row.Cells[1].Text = agent.Короткое_имя;
                                
            }
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            decimal sum = 0;
            int K = 0;

            foreach (GridViewRow row in GridView2.Rows)
            {
                decimal price = decimal.Parse(row.Cells[5].Text);
                TextBox kol = (TextBox)row.FindControl("Количество");
                int k = Convert.ToUInt16(kol.Text);
                sum += price;
                K += k;
            }

            GridViewRow footer = GridView2.FooterRow;

            footer.Cells[0].ColumnSpan = 3;
            footer.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            footer.Cells.RemoveAt(1); footer.Cells.RemoveAt(2);

            footer.Cells[0].Text = "Итого:";
            footer.Cells[1].Text = K.ToString();
            footer.Cells[3].Text = sum.ToString("C");

            //footer.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            //footer.Cells[3].HorizontalAlign = HorizontalAlign.Center;

        }
    }
}