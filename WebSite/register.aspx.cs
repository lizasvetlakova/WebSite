using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    DataClasses1DataContext db = new DataClasses1DataContext();

                     Пользователи пользователь = new Пользователи();

                    пользователь.ФИО = NameTextBox.Text;
                    пользователь.Телефон = PhoneTextBox.Text;
                    пользователь.Логин = EmailTextBox.Text;
                    пользователь.Пароль = PasswordTextBox.Text;
                    пользователь.Роль = Convert.ToInt32(OrgList.SelectedValue);

                    db.Пользователи.InsertOnSubmit(пользователь);
                    db.SubmitChanges();
                    ErrorLabel.Text = "Вы успешно зарегистрировались. Используйте форму входа.";
                }
                catch (Exception exception)
                {
                    ErrorLabel.Text = exception.Message;
                }
            }
        }
    }
}