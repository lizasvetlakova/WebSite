using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            long idUser;
            string nameUser = "";

            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();

                var selectedUser = (from item in db.Пользователи
                                    where item.Логин == Convert.ToString(LoginTextBox.Text)
                                    && item.Пароль == Convert.ToString(PasswordTextBox.Text)
                                    select item).Single();
                nameUser = selectedUser.ФИО;
                idUser = selectedUser.Код_пользователя;
                Session["IDUser"] = idUser;
                Session["NameUser"] = nameUser;
                Session["IDKontr"] = Session["is_admin"] = selectedUser.Роль;
                if(selectedUser.Роль == 1)
                {
                    Response.Redirect("tovar.aspx");
                }
                else
                {
                    Response.Redirect("index1.aspx");
                }
                
            }
            catch (Exception exception)
            {
                Label1.Text = "Пароль неверный";
            }
        }
    }
}