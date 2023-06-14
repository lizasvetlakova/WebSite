using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class kontr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.Visible = false;
            GridView2.Visible = true;
            AddPanel.Visible = false;
            Session["TypeKontr"] = this.DropDownList1.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            DetailsView1.Visible = true;
            AddPanel.Visible = false;
            Session["IDKontr"] = this.GridView2.SelectedValue;
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    DataClasses1DataContext db = new DataClasses1DataContext();

                    Контрагенты поставщик = new Контрагенты();

                    поставщик.Код_типа = 2;
                    поставщик.Короткое_имя = Name1.Text;
                    поставщик.Полное_имя = Name2.Text;
                    поставщик.Адрес = Adress.Text;
                    поставщик.Телефон = Phone.Text;
                    поставщик.ИНН = INN.Text;
                    поставщик.КПП = KPP.Text;
                    поставщик.Банк = Bank.Text;
                    поставщик.БИК = BIK.Text;
                    поставщик.Расчетный_счет = RS.Text;
                    поставщик.Кор_счет = KS.Text;

                    db.Контрагенты.InsertOnSubmit(поставщик);
                    db.SubmitChanges();
                    //Name1.Text = Name2.Text = Adress.Text = Phone.Text = INN.Text =
                    //    KPP.Text = Bank.Text = BIK.Text = RS.Text = KS.Text = " ";
                    Errorlabel.Visible = true;
                    Errorlabel.Text = "Контрагент успешно добавлен";
                    
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
            GridView2.Visible = false;
            Errorlabel.Visible = false;
        }

    }
}