<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="checkDoc.aspx.cs" Inherits="WebSite.checkDoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
    <table class="auto-style7">
        <tr>
            <td style="width: 100px; height: 43px;"><h1 style="left: -30px; top: 5px; width: 500px"> 
        <asp:Label ID="Type" runat="server" Text=""></asp:Label> № <asp:Label ID="Nomer" runat="server" Text=""></asp:Label> 
        от
        <asp:Label ID="Data" runat="server" Text="" DataFormatString="{0:dd/MM/yyyy}"></asp:Label>
                </h1></td>
            <td style="width: 142px; text-align: left; height: 43px;" >
                <asp:Button ID="Button2" runat="server" Text="Редактировать" CssClass="buton" OnClick="Update_Click" 
                    Width="135px" style="z-index: 1; position: absolute; top: 20px; left: 550px"/>
            </td>
            <td style="width: 142px; text-align: right; height: 43px;" >
                <asp:Button ID="Button1" runat="server" Text="Провести" CssClass="buton" OnClick="Prov_Click" 
                    Width="135px" style="z-index: 1; position: absolute; top: 55px; left: 550px"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
          <h1 style="left: -29px; top: -12px; width: 607px">
              <asp:Label ID="Kontr" runat="server" Text=""></asp:Label> <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="246px"></asp:TextBox>
              </h1>
                <asp:Label ID="Label2" runat="server" Text=""
                    style="z-index: 1; position: absolute; top: 100px; left: 550px; width: 145px;"></asp:Label>
                </td></tr>
        <tr>
            <td colspan="2">
          <h1 style="left: -29px; top: -35px; width: 607px">Сумма:
        <asp:Label ID="Сумма" runat="server" Text=""></asp:Label>
              </h1>
        <h1 style="left: -29px; top: -39px; width: 270px">Наименования:</h1>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/plus.JPG" CssClass="buton" Visible="false" OnClick="Добавление_Click" 
                    style="z-index: 1; position: absolute; top: 155px; left: 161px; width: 20px; height: 20px;"/>
               
                <div class="auto-style6" style="text-align: center">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" 
                            DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="675px" 
                            ShowFooter="True" OnDataBound="GridView2_DataBound" Height="280px" Visible="true"
                            style="z-index: 1; position: absolute; top: 200px; left: 10px">
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Содержание] WHERE ([Номер_накладной] = @Номер_накладной) ORDER BY [Номер_записи] ASC">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="Номер_накладной" SessionField="IDN" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div class="auto-style6" style="text-align: center">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" 
                            DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="675px" Visible ="false" 
                            ShowFooter="True" OnDataBound="GridView3_DataBound" OnRowCommand="GridView3_RowCommand" Height="280px"
                            style="z-index: 1; position: absolute; top: 200px; left: 10px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <%--<asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />
                                <asp:BoundField DataField="Код_товара" HeaderText="Код_товара" ReadOnly="True" SortExpression="Код_товара" Visible="False" />--%>
                                <asp:BoundField DataField="Номер_записи" HeaderText="№" SortExpression="Номер_записи" />
                                <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
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

<%--<asp:Panel ID="Panel1" runat="server" Width="922px" Visible="false" Height="250px" CssClass="auto-style9">
        <strong>
        Накладная № 
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        &nbsp;</strong>от<strong> </strong>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <strong>
        <br />
        <br />
        Контрагент: </strong>
        <asp:Label ID="Kontr" runat="server" Text="Label"></asp:Label>
        <strong>
        <br />
        <br />
        Сумма: </strong>
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        <strong>
        <br />
        <br />
        Наименования</strong><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной,Код_товара" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="470px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Номер_накладной" HeaderText="Номер_накладной" ReadOnly="True" SortExpression="Номер_накладной" Visible="False" />
                <asp:BoundField DataField="Номер_записи" HeaderText="№" SortExpression="Номер_записи" />
                <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
                <asp:BoundField DataField="Код_товара" HeaderText="Код товара" ReadOnly="True" SortExpression="Код_товара" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Содержание] WHERE ([Номер_накладной] = @Номер_накладной)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="Номер_накладной" SessionField="IDN" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </asp:Panel>--%>