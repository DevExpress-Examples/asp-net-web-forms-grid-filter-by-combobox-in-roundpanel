<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>








<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="mainForm" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="200px" HeaderText="Naming Container">
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server">
                                    <dx:ASPxLabel ID="ASPxLabelCaption1" runat="server" Text="Select Category">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInContent" runat="server" ValueField="CategoryID"
                                        TextField="CategoryName" ValueType="System.Int32" DataSourceID="SqlDataSourceCategories"
                                        AutoPostBack="True">
                                    </dx:ASPxComboBox>
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSourceProducts1">
                                    </dx:ASPxGridView>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                    <td>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="200px" HeaderText="Naming Container">
                            <HeaderTemplate>
                                <dx:ASPxLabel ID="ASPxLabelCaption2" runat="server" Text="Select Category">
                                </dx:ASPxLabel>
                                <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInHeader" runat="server" ValueField="CategoryID"
                                    TextField="CategoryName" ValueType="System.Int32" DataSourceID="SqlDataSourceCategories"
                                    AutoPostBack="True">
                                </dx:ASPxComboBox>
                            </HeaderTemplate>
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent2" runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="SqlDataSourceProducts2">
                                    </dx:ASPxGridView>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </td>
                </tr>
            </table>

        </div>
        <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceProducts1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxComboBoxCategoriesInContent"
                    Name="CategoryID" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceProducts2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxRoundPanel2$HTC$TC$ASPxComboBoxCategoriesInHeader"
                    Name="CategoryID" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
