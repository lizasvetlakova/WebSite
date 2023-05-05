<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebSite.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="width: 924px; font-family: Cambria; font-size: x-large;"><em>Космомедика - уходовая косметика для кожи</em></h1>
    <p style="width: 976px; font-family: Cambria; font-size: medium;">
    На сайте представлен каталог косметической продукции Космомедика.
    Вы можете оформить <span style="font-family: Cambria">заявку</span> всех необходимых косметических средств с нашего склада.
    </p>

    <h1 style="width: 910px; font-family: Cambria; font-size: x-large;"><em>Новости</em></h1>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1" style="font-size: medium">
        <AlternatingItemTemplate>
            <span style="background-color: #FAFAD2;color: #000000;">Дата:
            <asp:Label ID="ДатаLabel" runat="server" Text='<%# Eval("Дата") %>' />
            <br />
            
            
            <asp:Label ID="НовостьLabel" runat="server" Text='<%# Eval("Новость") %>' />
            <br />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #FFCC66;color: #000000;">Дата:
            <asp:TextBox ID="ДатаTextBox" runat="server" Text='<%# Bind("Дата") %>' />
            <br />
           
            <asp:TextBox ID="НовостьTextBox" runat="server" Text='<%# Bind("Новость") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Обновить" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Отмена" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>Нет данных.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Дата:
            <asp:TextBox ID="ДатаTextBox" runat="server" Text='<%# Bind("Дата") %>' />
            <br />
            
            <asp:TextBox ID="НовостьTextBox" runat="server" Text='<%# Bind("Новость") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Вставить" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Очистить" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #FFFBD6;color: #000000; &gt;" />
            Дата:
            <asp:Label ID="ДатаLabel" runat="server" Text='<%# Eval("Дата") %>' />
            <br />
            
            <asp:Label ID="НовостьLabel" runat="server" Text='<%# Eval("Новость") %>' />
            <br />
            <br />
        </ItemTemplate>
        <LayoutTemplate>
            <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #ffffff;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">Дата:
            <asp:Label ID="ДатаLabel" runat="server" Text='<%# Eval("Дата") %>' />
            <br />
            
            <asp:Label ID="НовостьLabel" runat="server" Text='<%# Eval("Новость") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSite.DataClasses1DataContext" EntityTypeName="" OrderBy="Дата" Select="new (Дата, Новость)" TableName="Новости">
        </asp:LinqDataSource>
    </p>

</asp:Content>
