<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="tovar.aspx.cs" Inherits="WebSite.tovar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td style="width: 110%">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Название_категории" DataValueField="Код_категории" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;
    &nbsp;<asp:Button ID="AllButton" runat="server" Text="Все средства" Width="104px" OnClick="AllButton_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="AddButton" runat="server" Text="Добавить новый товар" OnClick="AddButton_Click" Width="169px" />
                &nbsp;&nbsp;
                <br />
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Категории]">
    </asp:SqlDataSource>
                <div class="auto-style6">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Код_товара" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="16px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="464px" Visible="False" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Код_товара" HeaderText="№" ReadOnly="True" SortExpression="Код_товара" Visible="False" />
            <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
            <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
            <asp:BoundField DataField="Код_категории" HeaderText="Код_категории" SortExpression="Код_категории" Visible="False" />
            
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/image/red.jpg" ShowSelectButton="True">
            <ControlStyle Height="25px" Width="25px" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/image/del.jpg" ShowDeleteButton="True">
            <ControlStyle Height="25px" Width="25px" />
            </asp:CommandField>
            
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_товара], [Наименование], [Цена], [Код_категории] FROM [Товары] WHERE ([Код_категории] = @Код_категории)" DeleteCommand="DELETE FROM [Товары] WHERE [Код_товара] = @Код_товара" InsertCommand="INSERT INTO [Товары] ([Код_товара], [Наименование], [Цена], [Код_категории]) VALUES (@Код_товара, @Наименование, @Цена, @Код_категории)" UpdateCommand="UPDATE [Товары] SET [Наименование] = @Наименование, [Цена] = @Цена, [Код_категории] = @Код_категории WHERE [Код_товара] = @Код_товара">
        <DeleteParameters>
            <asp:Parameter Name="Код_товара" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Код_товара" Type="Int32" />
            <asp:Parameter Name="Наименование" Type="String" />
            <asp:Parameter Name="Цена" Type="Decimal" />
            <asp:Parameter Name="Код_категории" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_категории" SessionField="IDK" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Наименование" Type="String" />
            <asp:Parameter Name="Цена" Type="Decimal" />
            <asp:Parameter Name="Код_категории" Type="Int32" />
            <asp:Parameter Name="Код_товара" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Код_товара" DataSourceID="SqlDataSource3" Visible="False" Height="50px" Width="439px" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateEditButton="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Код_товара" HeaderText="№" ReadOnly="True" SortExpression="Код_товара" Visible="False" />
            <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
            <asp:BoundField DataField="Артикул" HeaderText="Артикул" SortExpression="Артикул" />
            <asp:BoundField DataField="Объём" HeaderText="Объём" SortExpression="Объём" />
            <asp:BoundField DataField="Ед_измерения" HeaderText="Ед. измерения" SortExpression="Ед_измерения" />
            <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_товара], [Наименование], [Артикул], [Объём], [Ед_измерения], [Цена] FROM [Товары] WHERE ([Код_товара] = @Код_товара)" DeleteCommand="DELETE FROM [Товары] WHERE [Код_товара] = @Код_товара" InsertCommand="INSERT INTO [Товары] ([Код_товара], [Наименование], [Артикул], [Объём], [Ед_измерения], [Цена]) VALUES (@Код_товара, @Наименование, @Артикул, @Объём, @Ед_измерения, @Цена)" UpdateCommand="UPDATE [Товары] SET [Наименование] = @Наименование, [Артикул] = @Артикул, [Объём] = @Объём, [Ед_измерения] = @Ед_измерения, [Цена] = @Цена WHERE [Код_товара] = @Код_товара">
        <DeleteParameters>
            <asp:Parameter Name="Код_товара" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Код_товара" Type="Int32" />
            <asp:Parameter Name="Наименование" Type="String" />
            <asp:Parameter Name="Артикул" Type="Int32" />
            <asp:Parameter Name="Объём" Type="String" />
            <asp:Parameter Name="Ед_измерения" Type="String" />
            <asp:Parameter Name="Цена" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_товара" SessionField="IDT" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Наименование" Type="String" />
            <asp:Parameter Name="Артикул" Type="Int32" />
            <asp:Parameter Name="Объём" Type="String" />
            <asp:Parameter Name="Ед_измерения" Type="String" />
            <asp:Parameter Name="Цена" Type="Decimal" />
            <asp:Parameter Name="Код_товара" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

                <br />
                <asp:Panel ID="AddPanel" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>Наименование: </td>
                            <td><asp:TextBox ID="TextBoxName" runat="server" Width="272px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Код товара: </td>
                            <td><asp:TextBox ID="TextBoxArt" runat="server" Width="100px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Объём: </td>
                            <td><asp:TextBox ID="TextBoxOb" runat="server" Width="100px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Ед. измерения: </td>
                            <td><asp:TextBox ID="TextBoxEd" runat="server" Width="100px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Цена: </td>
                            <td><asp:TextBox ID="TextBoxPrice" runat="server" Width="100px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Категория:</td>
                            <td> 
                                <asp:DropDownList ID="ListKategory" runat="server" DataSourceID="LinqDataSource1" DataTextField="Название_категории" DataValueField="Код_категории">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSite.DataClasses1DataContext" EntityTypeName="" Select="new (Код_категории, Название_категории)" TableName="Категории">
                                </asp:LinqDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6" colspan="2"> 
                                <br />
                                <asp:Button ID="SaveButton" runat="server" Text="Добавить" Width="97px" OnClick="SaveButton_Click" />
                                <br />
                                <br />
                                <asp:Label ID="Errorlabel" runat="server" Text="" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
            </td>
        </tr>
    </table>
    <br />
    </asp:Content>
