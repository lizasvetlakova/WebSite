<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="documents.aspx.cs" Inherits="WebSite.documents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    Сотрудник:
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" onrowcommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Номер_накладной" HeaderText="№ " ReadOnly="True" SortExpression="Номер_накладной" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" />
            <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
            <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
            <asp:BoundField DataField="Код_пользователя" HeaderText="Код_пользователя" SortExpression="Код_пользователя" Visible="False" />
            <asp:BoundField DataField="Код_контрагента" HeaderText="Код_контрагента" SortExpression="Код_контрагента" Visible="False" />
            <asp:BoundField DataField="Код_типа" HeaderText="Код_типа" SortExpression="Код_типа" Visible="False" />
            <asp:CommandField ButtonType="Image" HeaderText="Просмотр" SelectImageUrl="~/image/eye.png" ShowSelectButton="True">
            <ControlStyle Height="25px" Width="25px" />
            </asp:CommandField>
            <asp:ButtonField ButtonType="Image" CommandName="ProvCommand" HeaderText="Провести" ImageUrl="~/image/save.JPG">
            <ControlStyle Height="25px" Width="25px" />
            </asp:ButtonField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Накладные] WHERE ([Код_пользователя] = @Код_пользователя)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_пользователя" SessionField="IDUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="922px" Visible="false" Height="250px" CssClass="auto-style9">
        <strong>
        Накладная № 
        <asp:Label ID="Nomer" runat="server" Text=""></asp:Label>
        &nbsp;</strong>от<strong> </strong>
        <asp:Label ID="Data" runat="server" Text=""></asp:Label>
        <strong>
        <br />
        <br />
        Контрагент: </strong>
        <asp:Label ID="Kontr" runat="server" Text="Label"></asp:Label>
        <strong>
        <br />
        <br />
        Сумма: </strong>
        <asp:Label ID="Сумма" runat="server" Text=""></asp:Label>
        <strong>
        <br />
        <br />
        Наименования</strong><br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="470px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />
                <asp:BoundField DataField="Номер_записи" HeaderText="№" SortExpression="Номер_записи" />
                <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
                <asp:BoundField DataField="Код_товара" HeaderText="Код товара" ReadOnly="True" SortExpression="Код_товара" />
                <asp:BoundField DataField="Количество" HeaderText="Количество" SortExpression="Количество" />
                <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
                <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Содержание] WHERE ([Номер_накладной] = @Номер_накладной)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="Номер_накладной" SessionField="IDN" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </asp:Panel>
    <br />
    
</asp:Content>
