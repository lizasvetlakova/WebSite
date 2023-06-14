<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="kontr.aspx.cs" Inherits="WebSite.kontr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content">
        <div class="page">
            <asp:Panel runat="server" HorizontalAlign="Center" style="z-index: 1; position: absolute; top: 5px; left: -17px; width: 755px;">
    <table>
        <tr>
            <td style="width: 117%">
    <h1 style="left: -22px; top: -6px; width: 619px">Тип контрагента:&nbsp;&nbsp; 
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="23px" DataSourceID="SqlDataSource1" DataTextField="Название_типа" DataValueField="Код_типа" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="159px">
    </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="AddButton" runat="server" CssClass="buton" Text="Добавить" OnClick="AddButton_Click" Width="127px" /> </h1>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Типы_контрагентов]"></asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="Код_контрагента" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="663px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Короткое_имя" HeaderText="Наименование" SortExpression="Короткое_имя" />
                        <asp:BoundField DataField="Код_контрагента" HeaderText="Код_контрагента" ReadOnly="True" SortExpression="Код_контрагента" Visible="False" />
                        <asp:BoundField DataField="Код_типа" HeaderText="Код_типа" SortExpression="Код_типа" Visible="False" />
                        <asp:BoundField DataField="Адрес" HeaderText="Адрес" SortExpression="Адрес" />
                        <asp:BoundField DataField="Телефон" HeaderText="Телефон" SortExpression="Телефон" />
                        <asp:BoundField DataField="ИНН" HeaderText="ИНН" SortExpression="ИНН" />
                        <asp:CommandField SelectText="Подробнее" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_контрагента], [Код_типа], [Адрес], [Телефон], [ИНН], [Короткое_имя] FROM [Контрагенты] WHERE ([Код_типа] = @Код_типа)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="Код_типа" SessionField="TypeKontr" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <div style="text-align: left">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Visible="False" Width="439px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#999999" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="Полное_имя" HeaderText="Полное имя" SortExpression="Полное_имя" />
                            <asp:BoundField DataField="ИНН" HeaderText="ИНН" SortExpression="ИНН" />
                            <asp:BoundField DataField="Адрес" HeaderText="Адрес" SortExpression="Адрес" />
                            <asp:BoundField DataField="Телефон" HeaderText="Телефон" SortExpression="Телефон" />
                            <asp:BoundField DataField="КПП" HeaderText="КПП" SortExpression="КПП" />
                            <asp:BoundField DataField="Расчетный_счет" HeaderText="Расчетный счет" SortExpression="Расчетный_счет" />
                            <asp:BoundField DataField="Банк" HeaderText="Банк" SortExpression="Банк" />
                            <asp:BoundField DataField="БИК" HeaderText="БИК" SortExpression="БИК" />
                            <asp:BoundField DataField="Кор_счет" HeaderText="Корреспондентский счет" SortExpression="Кор_счет" />
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Полное_имя], [ИНН], [Адрес], [Телефон], [КПП], [Расчетный_счет], [Банк], [БИК], [Кор_счет] FROM [Контрагенты] WHERE ([Код_контрагента] = @Код_контрагента)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_контрагента" SessionField="IDKontr" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

                <br />
                <asp:Panel ID="AddPanel" runat="server" Visible="false" Width="698px">
                    <table>
                        <tr>
                            <td colspan="2">Короткое имя: </td>
                            <td style="text-align: left; width: 531px;"><asp:TextBox ID="Name1" runat="server" Width="174px"></asp:TextBox></td>
                            <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="Name1" EnableClientScript="False" ErrorMessage="Заполните поле Короткое имя"></asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td colspan="2">Полное имя:</td>
                            <td style="text-align: left; width: 531px;">
                                <asp:TextBox ID="Name2" runat="server" Width="272px"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Адрес: </td>
                            <td style="text-align: left; width: 531px;"><asp:TextBox ID="Adress" runat="server" Width="265px"></asp:TextBox></td>
                            <asp:RequiredFieldValidator ID="AdressValidator" runat="server" ControlToValidate="Adress" EnableClientScript="False" ErrorMessage="Заполните поле Адрес"></asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td colspan="2">Телефон: </td>
                            <td style="text-align: left; width: 531px;">
                                <asp:TextBox ID="Phone" runat="server" Width="125px"></asp:TextBox>
                            </td>
                            <asp:RequiredFieldValidator ID="PhoneValidator0" runat="server" ControlToValidate="Phone" EnableClientScript="False" ErrorMessage="Заполните поле Телефон " style="font-size: small"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PhoneValidator1" runat="server" ControlToValidate="Phone" EnableClientScript="False" ErrorMessage="Неправильно введен телефон" ValidationExpression="^((\+7|7|8)+([0-9]){10})$" style="font-size: xx-small"></asp:RegularExpressionValidator>
                        </tr>
                        <tr>
                            <td colspan="2">ИНН:</td>
                            <td style="text-align: left; width: 531px;">
                                <asp:TextBox ID="INN" runat="server" Width="181px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="INNValidator" runat="server" ControlToValidate="INN" EnableClientScript="False" ErrorMessage="Заполните поле ИНН"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">КПП: </td>
                            <td style="text-align: left; width: 531px;"><asp:TextBox ID="KPP" runat="server" Width="181px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">Расчетный счет: </td>
                            <td style="text-align: left; width: 531px;"><asp:TextBox ID="RS" runat="server" Width="203px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2">Банк:</td>
                            <td style="text-align: left; width: 531px;">
                                <asp:TextBox ID="Bank" runat="server" Width="181px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">БИК:</td>
                            <td style="text-align: left; width: 531px;">
                                <asp:TextBox ID="BIK" runat="server" Width="181px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Кор счет:</td>
                            <td style="text-align: left; width: 531px;">
                                <asp:TextBox ID="KS" runat="server" Width="203px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6" style="text-align: right; width: 208px"> 
                                <br />
                                <br />
                                <br />
                            </td>
                            <td class="auto-style6" style="text-align: right; width: 473px">
                                <asp:Button ID="SaveButton" runat="server" CssClass="buton" OnClick="SaveButton_Click" Text="Сохранить" Width="97px" />
                                <br />
                                <asp:Label ID="Errorlabel" runat="server" Text="" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                        </tr>
                    </table>

                </asp:Panel>
            </td>
        </tr>
    </table>
                </asp:Panel>
            </div>
         </div>
    <br />
    </asp:Content>
