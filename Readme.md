<!-- default badges list -->
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2040)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# # Grid View for ASP.NET Web Forms - How to use an external control placed in TemplateControl to filter a grid bound to SqlDataSource
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2040/)**
<!-- run online end -->

This example demonstrates how to use [ASPxComboBox](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxComboBox) placed in the [ASPxRoundPanel](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxRoundPanel) control to filter [ASPxGridView](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView). The grid is bound to **SqlDataSource** via `ControlParameter`. todo

## Implementation Details

In this example, [ASPxRoundPanel](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxRoundPanel) contains [ASPxComboBox](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxComboBox). When a user selects a value in the combobox, its value is applied as a control parameter to the datasource. 

The example demonstrates how to correctly specify the `ControlParameter`'s `ControlID` property in markup and at runtime.

### Specify ControlID property in markup

Use the following syntax to find `ASPxComboBox` inside the `ASPxRoundPanel`: 

`{containerID}${controlID}`

```aspx
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="300px" HeaderText="Naming Container">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
            <dx:ASPxLabel ID="ASPxLabelCaption1" runat="server" Text="Select Category" />
            <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInContent" runat="server" ValueField="CategoryID" TextField="CategoryName" 
                ValueType="System.Int32" DataSourceID="SqlDataSourceCategories" AutoPostBack="True">
            </dx:ASPxComboBox>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSourceProducts1" />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>
<asp:SqlDataSource ID="SqlDataSourceProducts1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
    SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxComboBoxCategoriesInContent" Name="CategoryID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
```

If `ASPxComboBox` is palced inside a `TemplateControl`, the `ControlID` property contains additional markers:

```aspx
<dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="300px" HeaderText="Naming Container">
    <HeaderTemplate>
        <dx:ASPxLabel ID="ASPxLabelCaption2" runat="server" Text="Select Category" />
        <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInHeader" runat="server" ValueField="CategoryID"  TextField="CategoryName" 
            ValueType="System.Int32" DataSourceID="SqlDataSourceCategories" AutoPostBack="True">
        </dx:ASPxComboBox>
    </HeaderTemplate>
    <PanelCollection>
        <dx:PanelContent ID="PanelContent2" runat="server">
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="SqlDataSourceProducts2" />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>

<asp:SqlDataSource ID="SqlDataSourceProducts2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
    SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ASPxRoundPanel2$HTC$TC$ASPxComboBoxCategoriesInHeader" Name="CategoryID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
```

### Specify ControlID property at runtime

This example demonstrates how to filter the ASPxGridView bound to SqlDataSource via the ControlParameter. The ControlParameter is passed to the SqlDataSource from an external ASPxComboBox. The ASPxComboBox is inside TemplateControl. Sometimes it's hard to correctly build the ControlParameter's ControlID property manually, so it's better to build it at runtime. In fact, the ControlParameter's ControlID property equals the UniqueID property of an external ASPxComboBox.

```csharp
protected void ASPxComboBoxCategoriesInHeader_Init(object sender, EventArgs e) {
    var cb = (ASPxComboBox)sender;
    ControlParameter controlParameter = (ControlParameter)SqlDataSourceProducts3.SelectParameters[0];
    controlParameter.ControlID = cb.UniqueID;
}
```

```aspx
<dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" Width="300px" HeaderText="Naming Container">
    <HeaderTemplate>
        <dx:ASPxLabel ID="ASPxLabelCaption3" runat="server" Text="Select Category" />
        <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInHeader2" runat="server" ValueField="CategoryID"
            TextField="CategoryName" ValueType="System.Int32" DataSourceID="SqlDataSourceCategories"
            AutoPostBack="True" OnInit="ASPxComboBoxCategoriesInHeader_Init">
        </dx:ASPxComboBox>
    </HeaderTemplate>
    <PanelCollection>
        <dx:PanelContent ID="MainPanelContent" runat="server">
            <dx:ASPxGridView ID="ASPxGridViewProducts" runat="server" DataSourceID="SqlDataSourceProducts3" />
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>

<asp:SqlDataSource ID="SqlDataSourceProducts3" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
    SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
    <SelectParameters>
        <asp:ControlParameter Name="CategoryID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
