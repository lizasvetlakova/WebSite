<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebSite.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="StyleSheet1.css">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            position: relative;
            top: 5px; 
            left: 30px;
            width: 100px;
            height: 100px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            left: -66px;
            top: 1px;
            margin-top: 1em;
        }
        .auto-style7 {
            padding: 0 0 0 3em;
            font-size: 16px;
            color: black;
            text-align: center;
        }
        .auto-style8 {
            width: 186px;
        }
        .auto-style9 {
            text-align: center;
            width: 48px;
        }
        .auto-style10 {
            width: 106px;
        }
  
        .auto-style12 {
            text-align: justify;
        }
  
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        
    <table class="auto-style1">
        <tr>
            <td class="auto-style8"><asp:Image ID="Image1" runat="server" ImageUrl="~/image/logo3.jpg" CssClass="auto-style2" /></td>
            <td><h2 class="auto-style6">Косметикс</h2></td>
            <td>
                
            </td>
        </tr>
        </table>

        <div class="container">
            <div class="auto-style7">
                <h1 class="auto-style5">Авторизация</h1>

            <table align="center">
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="LoginLabel" runat="server" Text="Логин"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="LoginTextBox" runat="server" Width="140px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="PasswordLabel" runat="server" Text="Пароль"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="PasswordTextBox" runat="server" Width="140px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Button ID="LoginButton" runat="server" Text="Войти" CssClass="buton" OnClick="LoginButton_Click"/>
                </td>
            </tr>
            </table>


                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>


                </div>
            </div>
</form>
</body>
</html>

