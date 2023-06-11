<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="checkOrder.aspx.cs" Inherits="WebSite.checkOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
    <table class="auto-style7">
        <tr>
            <td style="width: 177px"><h1>Содержание заявки</h1></td>
            <td style="width: 278px" >
                <asp:Button ID="OrdersButton" runat="server" Text="Все заявки" CssClass="buton" OnClick="Return_Click" Width="160px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h1>Заявка № 
        <asp:Label ID="Nomer" runat="server" Text=""></asp:Label>
        от
        <asp:Label ID="Data" runat="server" Text=""></asp:Label>
        </h1>
          <h1>Сумма:
        <asp:Label ID="Сумма" runat="server" Text=""></asp:Label>
              </h1>
        <h1>
        Наименования:</h1><br />
                <br />
                <div class="auto-style6" style="text-align: center">
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
                <br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
            </div>
        </div>
</asp:Content>
