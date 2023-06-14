<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="documents.aspx.cs" Inherits="WebSite.documents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="page">
            <h1>Накладные</h1>
    Тип документа: <asp:DropDownList ID="DropDownList1" runat="server" Width="100px"  Height="20px" Font-Bold="True" DataSourceID="SqlDataSource1" DataTextField="Короткое_название" DataValueField="Код_типа">
    </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT [Короткое название] AS Короткое_название, [Код_типа] FROM [Типы_накладной]"></asp:SqlDataSource>
    <asp:Button ID="Button4" runat="server"  Text="OK" CssClass="buton" Height="25px" Width="45px" style="font-size: 14px" OnClick="Type_Click" />
     За период от <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
     до <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
    <asp:Button ID="Button1" runat="server"  Text="OK" CssClass="buton" Height="25px" Width="45px" style="font-size: 14px" OnClick="Date_Click" />

    <asp:Button ID="Button2" runat="server"  Text="Все накладные" CssClass="buton" Height="27px" Width="150px" 
        style="font-size: 14px; z-index: 1; position: absolute; top: 15px; left: 465px" OnClick="All_Click" />
    
    <br /><br />
    <div class="auto-style6" style="text-align: center">
            <div style="text-align: center">
               
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Номер_накладной" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
         onrowcommand="GridView1_RowCommand" OnDataBound="GridView1_DataBound" AllowSorting="True"
        style="z-index: 1; width: 823px; height: 257px; position: absolute; top: 100px; left: -65px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Номер_накладной" HeaderText="№ " ReadOnly="True" SortExpression="Номер_накладной" />
            <asp:BoundField DataField="Код_типа" HeaderText="Тип" SortExpression="Код_типа" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Код_контрагента" HeaderText="Контрагент" SortExpression="Код_контрагента" />
            <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" />
            <asp:BoundField DataField="Сумма" HeaderText="Сумма" SortExpression="Сумма" />
            <asp:BoundField DataField="Код_пользователя" HeaderText="Код_пользователя" SortExpression="Код_пользователя" Visible="False" />
            <asp:CommandField HeaderText="Просмотр" ShowSelectButton="True" SelectText="Подробнее">
            </asp:CommandField>
            <asp:ButtonField ButtonType="Image" CommandName="ProvCommand" HeaderText="Провести" ImageUrl="~/image/save.JPG" Visible="False">
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:skladConnectionString2 %>" SelectCommand="SELECT * FROM [Накладные] WHERE ([Код_пользователя] = @Код_пользователя) ORDER BY [Номер_накладной] DESC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Код_пользователя" SessionField="IDUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

    </div>
        </div>
    </div>
</asp:Content>
