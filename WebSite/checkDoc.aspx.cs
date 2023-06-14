using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class checkDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(Session["IDN"]);

            DataClasses1DataContext db = new DataClasses1DataContext();

            var nakl = (from item in db.Накладные
                        where item.Номер_накладной == num
                        select item).Single();
            var kodT = nakl.Код_типа;
            Session["KodT"] = kodT;
            var kodK = nakl.Код_контрагента;

            var type = (from item in db.Типы_накладной
                        where item.Код_типа == kodT
                        select item).Single();

            var agent = (from item in db.Контрагенты
                         where item.Код_контрагента == kodK
                         select item).Single();

            if (kodT == 1 || kodT == 4)
            {
                //post
                Kontr.Text = "Поставщик: ";
                TextBox1.Text = agent.Короткое_имя;
            }
            else if (kodT == 2)
            {
                //rash
                Kontr.Text = "Магазин: ";
                TextBox1.Text = agent.Короткое_имя;
            }
            else if (kodT == 3)
            {
                //spisanie
                Kontr.Visible = false;
                TextBox1.Visible = false;
            }
            Type.Text = Convert.ToString(type.Название_накладной);
            Nomer.Text = Convert.ToString(nakl.Номер_накладной);
            Data.Text = DataBank.FormatData(Convert.ToString(nakl.Дата));
            Сумма.Text = Convert.ToString(nakl.Сумма) + " ₽";
        }


        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            decimal sum = 0;
            int K = 0;

            foreach (GridViewRow row in GridView2.Rows)
            {
                decimal price = decimal.Parse(row.Cells[4].Text);
                int kol = int.Parse(row.Cells[2].Text);
                sum += price;
                K += kol;
            }

            GridViewRow footer = GridView2.FooterRow;

            footer.Cells[0].ColumnSpan = 2;
            footer.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            footer.Cells.RemoveAt(1); 

            footer.Cells[0].Text = "Итого:";
            footer.Cells[1].Text = K.ToString();
            footer.Cells[3].Text = sum.ToString("C");

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            GridView2.Visible = false;
            GridView3.Visible = true;
            ImageButton1.Visible = true;
        }

        protected void Prov_Click(object sender, EventArgs e)
        {
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                int type = Convert.ToInt32(Session["kodT"]);
                bool flag = false;

                if (type == 1)
                {
                    //post + dobavlenie
                    foreach (GridViewRow row in GridView2.Rows)
                    {
                        string name = row.Cells[1].Text;
                        short kol = Int16.Parse(row.Cells[2].Text);

                        var tovar = (from item in db.Товары
                                     where item.Наименование == name
                                     select item).Single();

                        tovar.Количество += kol;

                    }
                }
                else
                {
                    foreach (GridViewRow row in GridView2.Rows)
                    {
                        string name = row.Cells[1].Text;
                        short kol = Int16.Parse(row.Cells[2].Text);

                        var tovar = (from item in db.Товары
                                     where item.Наименование == name
                                     select item).Single();
                       
                        if (tovar.Количество < kol)
                        {
                            flag = true;
                            break;
                        }
                        else
                        {
                            tovar.Количество -= kol;
                        }

                    }
                }

                if (flag == true)
                {
                    //отмена проводки
                    Label2.Visible = true;
                    Label2.Text = "Для проведения недостаточно товаров!";
                }
                else if (flag == false)
                {
                    int num = Convert.ToInt32(Session["IDN"]);
                    var updateNakl = (from item in db.Накладные
                                      where item.Номер_накладной == num
                                      select item).Single();
                    updateNakl.Статус = "Проведена";

                    //сохраняем изменения
                    db.SubmitChanges();
                    Label2.Visible = true;
                    Label2.Text = "Успешно!";
                }
            }
            catch (Exception exception)
            {
                Label2.Visible = true;
                Label2.Text = exception.Message;
            }
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "KolCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView3.Rows[index];
                TextBox kol = (TextBox)selectedRow.FindControl("Количество");
                string name = selectedRow.Cells[1].Text;
                decimal sumInit = Convert.ToDecimal(selectedRow.Cells[4].Text);
                decimal k = Convert.ToDecimal(kol.Text);
                decimal c = Convert.ToDecimal(selectedRow.Cells[3].Text);
                decimal sum = k * c;
                decimal razn = sum - sumInit;

                DataClasses1DataContext db = new DataClasses1DataContext();

                int num = Convert.ToInt32(Session["IDN"]);

                var tovar = (from item in db.Товары
                             where item.Наименование == name
                             select item).Single();
                int kod = tovar.Код_товара;

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
                Response.Redirect("checkDoc.aspx");
            }
            else if (e.CommandName == "DelCommand")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView2.Rows[index];
                string name = selectedRow.Cells[1].Text;
                decimal sumDel = Convert.ToDecimal(selectedRow.Cells[4].Text);
                int num = Convert.ToInt32(Session["IDN"]);

                DataClasses1DataContext db = new DataClasses1DataContext();
                var tovar = (from item in db.Товары
                             where item.Наименование == name
                             select item).Single();
                int kod = tovar.Код_товара;

                string crit = "DELETE FROM Содержание_накладной WHERE Номер_накладной = " + num + "and Код_товара = " + kod;

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

        protected void GridView3_DataBound(object sender, EventArgs e)
        {
            decimal sum = 0;
            int K = 0;

            foreach (GridViewRow row in GridView3.Rows)
            {
                decimal price = decimal.Parse(row.Cells[4].Text);
                TextBox kol = (TextBox)row.FindControl("Количество");
                int k = Convert.ToUInt16(kol.Text);
                sum += price;
                K += k;
            }

            GridViewRow footer = GridView3.FooterRow;

            footer.Cells[0].ColumnSpan = 2;
            footer.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            footer.Cells.RemoveAt(1);

            footer.Cells[0].Text = "Итого:";
            footer.Cells[1].Text = K.ToString();
            footer.Cells[3].Text = sum.ToString("C");
        }

        protected void Добавление_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}