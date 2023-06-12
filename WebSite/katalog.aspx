<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="katalog.aspx.cs" Inherits="WebSite.katalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Название_категории" DataValueField="Код_категории" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="25px" Font-Bold="True">
    </asp:DropDownList>
    <asp:Button ID="Button4" runat="server" style="position: relative; left: 116px; top: 1px; width: 114px" Text="Все средства" CssClass="buton" OnClick="AllItems_Click" />
    <br /><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Категории]"></asp:SqlDataSource>
    <div class="auto-style6" style="text-align: center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Код_товара" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="16px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="662px" AllowPaging="True" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" ReadOnly="True" SortExpression="Код_товара" Visible="False" />
            <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
            <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
            <asp:CommandField ShowSelectButton="True" SelectText="Подробнее">
            </asp:CommandField>
            <asp:BoundField DataField="Код_категории" HeaderText="Код_категории" SortExpression="Код_категории" Visible="False" />
            
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_товара], [Наименование], [Цена], [Код_категории] FROM [Товары] WHERE ([Код_категории] = @Код_категории)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_категории" SessionField="IDK" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Код_товара" DataSourceID="SqlDataSource3" Visible="false" Height="50px" Width="526px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" ReadOnly="True" SortExpression="Код_товара" Visible="False" />
            <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
            <asp:BoundField DataField="Артикул" HeaderText="Артикул" SortExpression="Артикул" />
            <asp:BoundField DataField="Объём" HeaderText="Объём" SortExpression="Объём" />
            <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
            <asp:TemplateField HeaderText="Категория" SortExpression="Код_категории">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Код_категории") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Код_категории") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Название_категории" DataValueField="Код_категории">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Категории] WHERE ([Код_категории] = @Код_категории)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="Код_категории" SessionField="IDK" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_товара], [Наименование], [Артикул], [Объём], [Цена], [Код_категории] FROM [Товары] WHERE ([Код_товара] = @Код_товара)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Код_товара" SessionField="IDT" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
              </div>
    </div>
</asp:Content>
