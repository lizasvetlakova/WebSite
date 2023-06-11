<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="lk.aspx.cs" Inherits="WebSite.lk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
    <table class="auto-style7">
        <tr>
            <td style="width: 177px"><h1>Оформленные заявки</h1></td>
            <td style="width: 278px" >
                <asp:Button ID="OrdersButton" runat="server" Text="Создать заявку" CssClass="buton" OnClick="OrderButton_Click" Width="160px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <br />
                <div class="auto-style6" style="text-align: center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="441px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Код_пользователя" HeaderText="Код_пользователя" SortExpression="Код_пользователя" Visible="False" />
                            <asp:BoundField DataField="Номер_накладной" HeaderText="№" ReadOnly="True" SortExpression="Номер_накладной" />
                            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
                            <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
                            <asp:CommandField ShowSelectButton="True" SelectText="Подробнее">
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
                    <h1>Содержание заявки</h1><br />
                    <br />
                    <div style="text-align: center">
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
                    </div>
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
            </div>
        </div>
</asp:Content>
