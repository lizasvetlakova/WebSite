using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebSite
{
    public partial class nakl: System.Web.UI.Page
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
            Panel1.Visible = false;
            Response.Redirect("nakl.aspx");
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
                накладная.Код_контрагента = Convert.ToInt32(DropDownList2.SelectedValue); ;
                накладная.Код_типа = Convert.ToInt32(DropDownList3.SelectedValue);
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

                ErrorLabel.Text = "Накладная сохранена!";

            }
            catch (Exception exception)
            {
                ErrorLabel.Text = exception.Message;
            }
            DataBank.SummaN = 0;
            DataBank.Counter = 0;
            DataBank.flagN = 0;
        }

        protected void AllItems_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT [Код_товара], [Наименование], [Цена], [Код_категории] FROM [Товары]";
            GridView2.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count != 0)
            {
                decimal sum = 0;
                int K = 0;

                foreach (GridViewRow row in GridView1.Rows)
                {
                    decimal price = decimal.Parse(row.Cells[4].Text);
                    int kol = int.Parse(row.Cells[2].Text);
                    sum += price;
                    K += kol;
                }

                GridViewRow footer = GridView1.FooterRow;

                footer.Cells[0].ColumnSpan = 2;
                footer.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                footer.Cells.RemoveAt(1);

                footer.Cells[0].Text = "Итого:";
                footer.Cells[1].Text = K.ToString();
                footer.Cells[3].Text = sum.ToString("C");
            }

        }

        protected void ProvButton_Click(object sender, EventArgs e)
        {

        }
    }
}