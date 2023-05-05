<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="lk.aspx.cs" Inherits="WebSite.lk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style7">
        <tr>
            <td style="width: 70px"><strong>Информация<br />
                <br />
                </strong><asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSite.DataClasses1DataContext" EntityTypeName="" TableName="Пользователи" Where="Код_пользователя == @Код_пользователя" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_пользователя" SessionField="IDUser" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="LinqDataSource1" Width="383px" DataKeyNames="Код_пользователя" >
        <EditItemTemplate>
            ФИО:
            <asp:TextBox ID="ФИОTextBox" runat="server" Text='<%# Bind("ФИО") %>' />
            <br />
            Телефон:
            <asp:TextBox ID="ТелефонTextBox" runat="server" Text='<%# Bind("Телефон") %>' />
            <br />
            Логин:
            <asp:TextBox ID="ЛогинTextBox" runat="server" Text='<%# Bind("Логин") %>' />
            <br />
            Пароль:
            <asp:TextBox ID="ПарольTextBox" runat="server" Text='<%# Bind("Пароль") %>' />
            <br />
            Организация:&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceK2" DataTextField="Короткое_имя" DataValueField="Код_контрагента" SelectedValue='<%# Bind("Код_контрагента") %>' Width="168px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceK2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_контрагента], [Короткое_имя] FROM [Контрагенты] WHERE ([Код_контрагента] = @Код_контрагента)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="Код_контрагента" SessionField="IDKontr" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;<asp:TextBox ID="Код_пользователяTextBox" runat="server" Text='<%# Bind("Код_пользователя") %>' Visible="False" />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Обновить" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </EditItemTemplate>
        <InsertItemTemplate>
            ФИО:
            <asp:TextBox ID="ФИОTextBox" runat="server" Text='<%# Bind("ФИО") %>' />
            <br />
            Телефон:
            <asp:TextBox ID="ТелефонTextBox" runat="server" Text='<%# Bind("Телефон") %>' />
            <br />
            Логин:
            <asp:TextBox ID="ЛогинTextBox" runat="server" Text='<%# Bind("Логин") %>' />
            <br />
            Пароль:
            <asp:TextBox ID="ПарольTextBox" runat="server" Text='<%# Bind("Пароль") %>' />
            <br />
            Код_пользователя:
            <asp:TextBox ID="Код_пользователяTextBox" runat="server" Text='<%# Bind("Код_пользователя") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Вставка" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            ФИО:
            <asp:Label ID="ФИОLabel" runat="server" Text='<%# Bind("ФИО") %>' />
            <br />
            Телефон:
            <asp:Label ID="ТелефонLabel" runat="server" Text='<%# Bind("Телефон") %>' />
            <br />
            Логин:
            <asp:Label ID="ЛогинLabel" runat="server" Text='<%# Bind("Логин") %>' />
            <br />
            Пароль:
            <asp:Label ID="ПарольLabel" runat="server" Text='<%# Bind("Пароль") %>' />
            <br />
            Организация:&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceK" DataTextField="Короткое_имя" DataValueField="Код_контрагента" SelectedValue='<%# Bind("Код_контрагента") %>' Width="166px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceK" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_контрагента], [Короткое_имя] FROM [Контрагенты] WHERE ([Код_контрагента] = @Код_контрагента)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="Код_контрагента" SessionField="IDKontr" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Редактировать" CommandName="Edit" />
            <br />
            &nbsp;<asp:Label ID="Код_пользователяLabel" runat="server" Text='<%# Bind("Код_пользователя") %>' Visible="False"></asp:Label>
            <br />

        </ItemTemplate>
    </asp:FormView>
            </td>
            <td >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <asp:Button ID="OrdersButton" runat="server" Text="Мои заявки" OnClick="OrdersButton_Click" />
                <br />
                <br />
                <div class="auto-style6">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="441px" Visible="False">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Код_пользователя" HeaderText="Код_пользователя" SortExpression="Код_пользователя" Visible="False" />
                            <asp:BoundField DataField="Номер_накладной" HeaderText="№" ReadOnly="True" SortExpression="Номер_накладной" />
                            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" />
                            <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
                            <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
                            <asp:CommandField ButtonType="Image" HeaderText="Просмотр" SelectImageUrl="~/image/eye.png" ShowSelectButton="True">
                            <ControlStyle Height="20px" Width="20px" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_пользователя], [Статус], [Сумма], [Дата], [Номер_накладной] FROM [Накладные] WHERE ([Код_пользователя] = @Код_пользователя)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="Код_пользователя" SessionField="IDUser" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:Panel ID="Panel1" runat="server" Width="180px" Visible="false" Height="250px" CssClass="auto-style9">
                    <strong>Содержание заявки</strong><br />
                    <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="573px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />
                        <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" ReadOnly="True" SortExpression="Код_товара" Visible="False" />
                        <asp:BoundField DataField="Номер_записи" HeaderText="№" SortExpression="Номер_записи" />
                        <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
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
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</asp:Content>
