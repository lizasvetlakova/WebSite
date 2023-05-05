<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebSite.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1" style="height: 306px">
        <tr>
            <td style="height: 10px; width: 211px">Введите ФИО</td>
            <td style="height: 10px">
                <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="NameTextBox" EnableClientScript="False" ErrorMessage="Заполните поле Имя"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 10px; width: 211px">Логин (e-mail)</td>
            <td style="height: 10px">
                <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailFieldValidator" runat="server" ControlToValidate="EmailTextBox" EnableClientScript="False" ErrorMessage="Заполните поле Логин" style="font-size: x-small"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" EnableClientScript="False" ErrorMessage="Неправильно введен e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="font-size: x-small"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 211px; height: 10px;">Телефон</td>
            <td style="height: 10px">
                <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneValidator0" runat="server" ControlToValidate="PhoneTextBox" EnableClientScript="False" ErrorMessage="Заполните поле Телефон " style="font-size: small"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PhoneValidator1" runat="server" ControlToValidate="PhoneTextBox" EnableClientScript="False" ErrorMessage="Неправильно введен телефон" ValidationExpression="^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$" style="font-size: xx-small"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 211px; height: 11px;">Выберите вашу организацию</td>
            <td style="height: 11px">
                <asp:DropDownList ID="OrgList" runat="server" DataSourceID="LinqDataSource1" DataTextField="Короткое_имя" DataValueField="Код_контрагента">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSite.DataClasses1DataContext" EntityTypeName="" Select="new (Код_контрагента, Короткое_имя)" TableName="Контрагенты">
                </asp:LinqDataSource>
                <asp:RequiredFieldValidator ID="OrgValidator" runat="server" ControlToValidate="OrgList" EnableClientScript="False" ErrorMessage="Выберите организацию"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 11px; width: 211px">Пароль</td>
            <td style="height: 11px">
                <asp:TextBox ID="PasswordTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="PasswordTextBox" EnableClientScript="False" ErrorMessage="Заполните поле Пароль"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10" style="height: 10px; width: 211px">Повторите пароль</td>
            <td style="height: 10px">
                <asp:TextBox ID="ConfirmPasswordTextBox" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="ConfirmPasswordValidator" runat="server" ControlToCompare="ConfirmPasswordTextBox" ControlToValidate="PasswordTextBox" EnableClientScript="False" ErrorMessage="Неправильно введен пароль"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 15px">
                <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Зарегистрироваться" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 15px">
                <asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
