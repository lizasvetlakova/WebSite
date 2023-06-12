<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="lk.aspx.cs" Inherits="WebSite.lk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
    <table class="auto-style7" style="width: 650px">
        <tr>
            <td style="width: 177px"><h1 style="left: -18px; top: 0px; width: 217px">Оформленные заявки:</h1></td>
            <td style="width: 278px; text-align: right;">
                <asp:Button ID="OrdersButton" runat="server" Text="Создать заявку" CssClass="buton" OnClick="OrderButton_Click" Width="160px" />
            </td>
        </tr>
        
    </table>
            <div style="text-align: center">
            <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="576px" style="z-index: 1; width: 576px; height: 257px; position: absolute; top: 80px; left: 50px">
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
    <br />
            </div>
    </div>
</asp:Content>
