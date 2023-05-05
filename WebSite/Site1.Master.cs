using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long idUser = Convert.ToInt64(Session["IDUser"]);
            string nameUser = Convert.ToString(Session["NameUser"]);
            if (idUser != 0)
            {
                ShowHello(nameUser);
                
            }
            else
            {
                ShowLogin();
                
            }
        }

        protected void ShowLogin()
        {
            LinkButton3.Visible = false;
            LoginLabel.Visible = true;
            PasswordLabel.Visible = true;
            LoginTextBox.Visible = true;
            PasswordTextBox.Visible = true;
            LoginButton.Visible = true;
            RegisterButton.Visible = true;
            LogoutButton.Visible = false;
            Button1.Visible = false;
            Label1.Visible = true;
            Label1.Text = "Авторизация";
        }
        protected void ShowHello(String name)
        {
            LinkButton3.Visible = true;
            LoginLabel.Visible = false;
            PasswordLabel.Visible = false;
            LoginTextBox.Visible = false;
            PasswordTextBox.Visible = false;
            LoginButton.Visible = false;
            RegisterButton.Visible = false;
            LogoutButton.Visible = true;
            Button1.Visible = true;
            Label1.Visible = true;
            Label1.Text = "Здравствуйте, " + name + "!";
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            long idUser;
            string nameUser="";

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
                Session["is_admin"] = selectedUser.Роль;
                Session["IDKontr"] = selectedUser.Код_контрагента;
                ShowHello(nameUser);

            }
            catch (Exception exception)
            {
                Label1.Text = exception.Message;
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            ShowLogin();
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("katalog.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            var nakl = (from item in db.Накладные
                        orderby item.Номер_накладной descending
                        select item).First();
            Session["Nomer"] = nakl.Номер_накладной + 1;
            Session["Data"] = DateTime.Now.ToShortDateString();

            Response.Redirect("order.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("lk.aspx");
        }
    }
}