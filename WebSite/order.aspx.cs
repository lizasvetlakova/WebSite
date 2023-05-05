using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebSite
{
    public partial class order : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Nomer.Text = Convert.ToString(Session["Nomer"]);
            Data.Text = Convert.ToString(Session["Data"]);

            if (DataBank.SummaN == 0)
            {
                Label4.Visible = false;
                Сумма.Visible = false;
            }
            else
                Сумма.Text = Convert.ToString(DataBank.SummaN);
        }

        protected void Выбрать_Click(object sender, EventArgs e)
        {
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();

                foreach (GridViewRow row in GridView2.Rows)
                {
                    CheckBox cb = (CheckBox)row.FindControl("RowSelector");
                    if (cb != null && cb.Checked)
                    {
                        Содержание_накладной sod = new Содержание_накладной();
                        sod.Номер_накладной = Convert.ToInt32(Session["Nomer"]);
                        //int index = row.RowIndex;
                        TextBox kol = (TextBox)row.FindControl("Количество");
                        decimal k = Convert.ToDecimal(kol.Text);
                        decimal c = Convert.ToDecimal(row.Cells[3].Text);
                        decimal sum = k * c;
                        DataBank.Counter += 1;

                        sod.Код_товара = Convert.ToInt32(row.Cells[1].Text);
                        sod.Номер_записи = Convert.ToInt16(DataBank.Counter);
                        sod.Количество = Convert.ToInt16(kol.Text);
                        sod.Цена = c;
                        sod.Сумма = sum;

                        db.Содержание_накладной.InsertOnSubmit(sod);
                        db.SubmitChanges();

                        DataBank.SummaN += sum;
                    }

                }
            }
            catch (Exception exception)
            {
                //Label5.Text = exception.Message;
            }
            //Panel1.Visible = false;
            Response.Redirect("order.aspx");
        }

        protected void TovarButton_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            if (DataBank.flagN == 0)
            {
                DataClasses1DataContext db1 = new DataClasses1DataContext();

                Накладные накладная = new Накладные();

                накладная.Номер_накладной = Convert.ToInt32(Session["Nomer"]);
                накладная.Дата = Convert.ToDateTime(Session["Data"]);
                накладная.Код_пользователя = Convert.ToInt32(Session["IDUser"]);
                накладная.Код_контрагента = Convert.ToInt32(Session["IDKontr"]);
                накладная.Код_типа = 5;
                db1.Накладные.InsertOnSubmit(накладная);

                db1.SubmitChanges();
                DataBank.flagN = 1;
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDK"] = this.DropDownList1.SelectedValue;
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();

                int num = Convert.ToInt32(Session["Nomer"]);

                var накладная = (from item in db.Накладные
                                  where item.Номер_накладной == num
                                  select item).Single();
                накладная.Сумма = DataBank.SummaN;
                накладная.Статус = "Сохранена";
                db.SubmitChanges();
            }
            catch (Exception exception)
            {
                ErrorLabel.Text = exception.Message;
            }
            Label6.Visible = true;
            Label6.Text = "Заявка успешно сохранена!";
            DataBank.SummaN = 0;
            DataBank.Counter = 0;
            DataBank.flagN = 0;
        }

        protected void AllItems_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT [Код_товара], [Наименование], [Цена], [Код_категории] FROM [Товары]";
            GridView2.DataBind();
        }
    }
}