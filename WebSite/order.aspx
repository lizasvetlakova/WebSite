<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="WebSite.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 400px">
        <td style="width: 130px">
                <table style="width: 112%">
                    <tr>
                        <td style="width: 14px; height: 25px">Заявка№ <asp:Label ID="Nomer" runat="server" Text=""></asp:Label>
                &nbsp;</td>
                        <td style="width: 77px; height: 25px"> &nbsp;<asp:Label ID="Data" runat="server" Text=""></asp:Label>
                        </td>
                        <td style="width: 76px; height: 25px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="SaveButton" runat="server" Text="Сохранить" OnClick="SaveButton_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 27px" colspan="3"><asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 14px"><asp:Label ID="Label3" runat="server" Text="Товары"></asp:Label>
                        </td>
                        <td style="width: 77px" class="auto-style10">
                <asp:Button ID="TovarButton" runat="server" Text="Добавить" OnClick="TovarButton_Click" />
                        </td>
                        <td style="width: 76px"><asp:Label ID="Label4" runat="server" Text="Сумма: "></asp:Label>
                            <asp:Label ID="Сумма" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                &nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
                <div class="auto-style6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="450px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />
                        <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" ReadOnly="True" SortExpression="Код_товара" Visible="False" />
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
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Содержание] WHERE ([Номер_накладной] = @Номер_накладной)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="Номер_накладной" SessionField="Nomer" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="ErrorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            <td style="width: 150px">
                <asp:Panel ID="Panel1" runat="server" style="margin-left: 51px" Width="180px" Visible="false" Height="250px">
                    Номенклатура<br /> 
                    <br />
                    Тип средства&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceFilter" DataTextField="Название_категории" DataValueField="Код_категории" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="Button4" runat="server" OnClick="AllItems_Click" style="position: relative; left: 257px; top: -33px; width: 114px" Text="Все средства" />
                    <asp:SqlDataSource ID="SqlDataSourceFilter" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Категории]"></asp:SqlDataSource>
                    <asp:Button ID="Выбрать" runat="server" OnClick="Выбрать_Click" Text="Выбрать" />
                    <br />
                    <br />
                    <div class="auto-style6">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Код_товара" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="16px" Width="450px" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="RowSelector" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Код_товара" HeaderText="№" ReadOnly="True" SortExpression="Код_товара" />
                                <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
                                <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
                                <asp:BoundField DataField="Код_категории" HeaderText="Код_категории" SortExpression="Код_категории" Visible="False" />
                                <asp:TemplateField HeaderText="Количество">
                                    <ItemTemplate>
                                        <asp:TextBox ID="Количество" runat="server" Width="37px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                    </asp:Panel>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
