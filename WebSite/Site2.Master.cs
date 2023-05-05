using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Site2 : System.Web.UI.MasterPage
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
            LinkButton2.Visible = false;
            LinkButton3.Visible = false;
            LinkButton4.Visible = false;
            LinkButton5.Visible = false;
            LinkButton6.Visible = false;
            LoginLabel.Visible = true;
            PasswordLabel.Visible = true;
            LoginTextBox.Visible = true;
            PasswordTextBox.Visible = true;
            LoginButton.Visible = true;
            LogoutButton.Visible = false;
            Label1.Visible = true;
            Label1.Text = "Авторизация";
        }
        protected void ShowHello(String name)
        {
            LinkButton2.Visible = true;
            LinkButton3.Visible = true;
            LinkButton4.Visible = true;
            LinkButton5.Visible = true;
            LinkButton6.Visible = true;
            LoginLabel.Visible = false;
            PasswordLabel.Visible = false;
            LoginTextBox.Visible = false;
            PasswordTextBox.Visible = false;
            LoginButton.Visible = false;
            LogoutButton.Visible = true;
            Label1.Visible = true;
            Label1.Text = "Здравствуйте, " + name + "!";
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("indexM.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("tovar.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("documents.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("nakl.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("orders.aspx");
        }
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("sklad.aspx");
        }
        
    }
}