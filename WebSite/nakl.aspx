<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="nakl.aspx.cs" Inherits="WebSite.nakl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">

    <table style="width: 400px">
        <td style="width: 130px">
            <asp:Panel ID="Panel3" runat="server" style="margin-left: -150px" Width="180px" Visible="true" Height="584px">
                    <h1 style="left: -29px; top: -7px; width: 190px">Накладная № <asp:Label ID="Nomer" runat="server" Text=""></asp:Label></h1>
                            <h1 style="left: 152px; top: -48px; width: 130px; height: 23px">от <asp:Label ID="Data" runat="server" Text=""></asp:Label></h1>

                <asp:Button ID="Button1" runat="server" CssClass="buton" Text="Сохранить" OnClick="SaveButton_Click" style="z-index: 1; position: absolute; top: 15px; left: 250px" />
                <asp:Button ID="Button3" runat="server" CssClass="buton" Text="Провести" OnClick="ProvButton_Click" style="z-index: 1; position: absolute; top: 55px; left: 250px" />
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/plus.JPG" CssClass="buton" OnClick="TovarButton_Click" 
                   style="border-color:#5D7B9D; z-index: 1; position: absolute; top: 158px; left: -60px; width: 20px; height: 20px;"/>
               
                <h1 style="left: -29px; top: -60px; width: 380px">Тип накладной: 
                        <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" DataSourceID="SqlDataSource4" DataTextField="Название_накладной" DataValueField="Код_типа" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Типы_накладной]"></asp:SqlDataSource>
                    </h1>
                <h1 style="left: -29px; top: -70px; width: 64px">Контрагент: 
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" DataSourceID="SqlDataSource3" DataTextField="Короткое_имя" DataValueField="Код_контрагента" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Код_контрагента], [Короткое_имя] FROM [Контрагенты]"></asp:SqlDataSource>
                    </h1>
                    <h1 style="left: -29px; top: -80px; width: 64px">
                        <asp:Label ID="Label5" runat="server" Text="Товары"></asp:Label>
                    </h1>
                    <h1 style="left: -29px; top: -80px; width: 169px">
                        <asp:Label ID="Label4" runat="server" Text="Сумма: "></asp:Label>
                        <asp:Label ID="Сумма" runat="server" Text=""></asp:Label>
                                               
                    </h1>
               <h1 style="left: 300px; top: -120px; width: 170px">
                   <asp:Label ID="Label6" runat="server" Text=""></asp:Label>

               </h1>
                <div class="auto-style6" style="text-align: center;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None"  style="z-index: 1; width: 520px; position: absolute; top: 240px; left: -150px"
                    ShowFooter="True" OnDataBound="GridView1_DataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <%--<asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />
                        <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" ReadOnly="True" SortExpression="Код_товара" Visible="False" />--%>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Содержание] WHERE ([Номер_накладной] = @Номер_накладной)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="Номер_накладной" SessionField="Nomer" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="ErrorLabel" runat="server" Text="Label" Visible="False"></asp:Label>
            </asp:Panel>
            </td>
            <td style="width: 150px">
                <asp:Panel ID="Panel1" runat="server" style="margin-left: 370px" Width="180px" Visible="false" Height="584px">
                    <h1 style="left: -35px; top: -5px; width: 153px">Номенклатура</h1> 
                    
                    Тип средства&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceFilter" DataTextField="Название_категории" DataValueField="Код_категории" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="25px">
                    </asp:DropDownList>
                    <asp:Button ID="Button4" runat="server" CssClass="buton" OnClick="AllItems_Click" style="position: relative; left: 257px; top: -33px; width: 114px" Text="Все средства" />
                    
                    <asp:SqlDataSource ID="SqlDataSourceFilter" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Категории]"></asp:SqlDataSource>
                    <asp:Button ID="Выбрать" runat="server" CssClass="buton" OnClick="Выбрать_Click" Text="Выбрать" />
                    <br />
                    <br />
                    <div class="auto-style6" style="text-align: center">
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
        </div>
    </div>
    </div>
</asp:Content>
