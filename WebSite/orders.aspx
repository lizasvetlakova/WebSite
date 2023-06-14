<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="WebSite.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content">
        <div class="page">
            <h1>Текущие заявки</h1>
    <div class="auto-style6" style="text-align: center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
            onrowcommand="GridView1_RowCommand" Width="670px" OnDataBound="GridView1_DataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Номер_накладной" HeaderText="№" SortExpression="Номер_накладной" ReadOnly="True" />
                <asp:BoundField DataField="Код_контрагента" HeaderText="Магазин" SortExpression="Код_контрагента" />
                <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
                <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" Visible="False" />
                <asp:BoundField DataField="Код_типа" HeaderText="Код_типа" SortExpression="Код_типа" Visible="False" />
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/image/red.jpg" ShowSelectButton="True">
                <ControlStyle Height="30px" Width="30px" />
                </asp:CommandField>
                <asp:ButtonField ButtonType="Button" Text="Создать накладную" CommandName="MyCommand">
                <ControlStyle Width="170px" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Номер_накладной], [Дата], [Сумма], [Статус], [Код_типа], [Код_контрагента] FROM [Накладные] WHERE (([Код_типа] = @Код_типа) AND ([Статус] = @Статус)) ORDER BY [Номер_накладной] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="Код_типа" Type="Int32" />
            <asp:Parameter DefaultValue="Сохранена" Name="Статус" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="701px" Visible="false" Height="405px" CssClass="auto-style9">
         <h1>Содержание заявки</h1>
        
         <div style="text-align: center">
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" OnDataBound="GridView2_DataBound" onrowcommand="GridView2_RowCommand" ShowFooter="true" Width="670px">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                     <%--<asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />--%>
                     <asp:BoundField DataField="Номер_записи" HeaderText="№" SortExpression="Номер_записи" />
                     <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
                     <asp:BoundField DataField="Код_товара" HeaderText="Код товара" ReadOnly="True" SortExpression="Код_товара" />
                     <asp:TemplateField HeaderText="Количество" SortExpression="Количество">
                         <ItemTemplate>
                             <asp:TextBox ID="Количество" runat="server" Text='<%# Bind("Количество") %>' Width="46px"></asp:TextBox>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
                     <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
                     <asp:ButtonField ButtonType="Image" CommandName="KolCommand" ImageUrl="~/image/save.JPG" Text="Кнопка">
                     <ControlStyle Height="25px" Width="25px" />
                     </asp:ButtonField>
                     <asp:ButtonField ButtonType="Image" CommandName="DelCommand" ImageUrl="~/image/del.JPG" Text="Кнопка">
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Содержание] WHERE ([Номер_накладной] = @Номер_накладной) ORDER BY [Номер_записи] ASC">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="Номер_накладной" SessionField="IDN" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
    </asp:Panel>
            </div>
         </div>
</asp:Content>
