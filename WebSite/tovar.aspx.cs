using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class tovar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.Visible = false;
            GridView1.Visible = true;
            AddPanel.Visible = false;
            Session["IDK"] = this.DropDownList1.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            DetailsView1.Visible = true;
            AddPanel.Visible = false;
            Session["IDT"] = this.GridView1.SelectedValue;
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    DataClasses1DataContext db = new DataClasses1DataContext();

                    Товары товар = new Товары();

                    string a = "1351";
                    string art = a + Convert.ToString(TextBoxArt.Text);
                    товар.Код_товара = Convert.ToInt32(TextBoxArt.Text);
                    товар.Наименование = TextBoxName.Text;
                    товар.Артикул = Convert.ToInt32(art);
                    товар.Объём = TextBoxOb.Text;
                    товар.Ед_измерения = TextBoxEd.Text;
                    товар.Цена = Convert.ToDecimal(TextBoxPrice.Text);
                    товар.Количество = 0;
                    товар.Код_категории = Convert.ToInt32(ListKategory.SelectedValue);

                    db.Товары.InsertOnSubmit(товар);
                    db.SubmitChanges();
                    TextBoxArt.Text = TextBoxName.Text = TextBoxOb.Text =
                        TextBoxEd.Text = TextBoxPrice.Text = " ";
                    Errorlabel.Visible = true;
                    Errorlabel.Text = "Товар успешно добавлен";
                    
                }
                catch (Exception exception)
                {
                    Errorlabel.Visible = true;
                    Errorlabel.Text = exception.Message;
                }
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            AddPanel.Visible = true;
            DetailsView1.Visible = false;
            GridView1.Visible = false;
            Errorlabel.Visible = false;
        }

        protected void AddKat_Click(object sender, EventArgs e)
        {

        }

        protected void AllButton_Click(object sender, EventArgs e)
        {
            AddPanel.Visible = false;
            GridView1.Visible = true;
            DetailsView1.Visible = false;
            SqlDataSource2.SelectCommand = "SELECT [Код_товара], [Наименование], [Цена], [Код_категории] FROM [Товары]";
            GridView1.DataBind();
        }
    }
}