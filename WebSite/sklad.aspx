<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="sklad.aspx.cs" Inherits="WebSite.sklad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content">
        <div class="page">
    <h1>Товары на складе</h1><br />

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Название_категории" DataValueField="Код_категории" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="27px">
    </asp:DropDownList>
    &nbsp;
    &nbsp;<asp:Button ID="AllButton" runat="server" CssClass="buton" Text="Все средства" Width="115px" OnClick="AllButton_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Категории]"></asp:SqlDataSource>
    <div class="auto-style6" style="text-align: center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Код_товара" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="16px" Width="646px" 
            OnDataBound ="GridView1_DataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Код_товара" HeaderText="Код товара" ReadOnly="True" SortExpression="Код_товара" />
                <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
                <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
                <asp:BoundField DataField="Количество" HeaderText="Количество" SortExpression="Количество" />
                <asp:BoundField DataField="Код_категории" HeaderText="Код_категории" SortExpression="Код_категории" Visible="False" />
                <asp:BoundField HeaderText="Сумма" />
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_товара], [Наименование], [Цена], [Количество], [Код_категории] FROM [Товары] WHERE ([Код_категории] = @Код_категории)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_категории" SessionField="IDK" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            </div>
         </div>
</asp:Content>
