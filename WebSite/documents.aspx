<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="documents.aspx.cs" Inherits="WebSite.documents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
            <h1>Накладные</h1>
            <div style="text-align: center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
         onrowcommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Номер_накладной" HeaderText="№ " ReadOnly="True" SortExpression="Номер_накладной" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
            <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
            <asp:BoundField DataField="Код_пользователя" HeaderText="Код_пользователя" SortExpression="Код_пользователя" Visible="False" />
            <asp:BoundField DataField="Код_контрагента" HeaderText="Код_контрагента" SortExpression="Код_контрагента" Visible="False" />
            <asp:BoundField DataField="Код_типа" HeaderText="Код_типа" SortExpression="Код_типа" Visible="False" />
            <asp:CommandField HeaderText="Просмотр" ShowSelectButton="True" SelectText="Подробнее">
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
            </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Накладные] WHERE ([Код_пользователя] = @Код_пользователя)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_пользователя" SessionField="IDUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

    </div>
        </div>
</asp:Content>
