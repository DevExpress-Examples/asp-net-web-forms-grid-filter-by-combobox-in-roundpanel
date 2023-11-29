<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128540188/13.1.6%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2040)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# Grid View for ASP.NET Web Forms - How to use an external ASPxComboBox in ASPxRoundPanel to filter a grid
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2040/)**
<!-- run online end -->

This example demonstrates how to use [ASPxComboBox](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxComboBox) placed in the [ASPxRoundPanel](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxRoundPanel) control to filter [ASPxGridView](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView) data. The grid is bound to **SqlDataSource**. The `ControlParameter` is passed to the `SqlDataSource` from the `ASPxComboBox` control. 

## Implementation Details

In this example, [ASPxRoundPanel](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxRoundPanel) contains [ASPxComboBox](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxComboBox). When a user selects a value in the combobox, the value is applied to the datasource as a control parameter. 

You can specify the `ControlParameter`'s `ControlID` property in markup and at runtime.

### Specify ControlID property in markup

Use the following syntax to access `ASPxComboBox` inside `ASPxRoundPanel`: **{containerID}${controlID}**.

```aspx
<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ... >
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
            <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInContent" runat="server" ... />
            ...
</dx:ASPxRoundPanel>
<asp:SqlDataSource ID="SqlDataSourceProducts1" runat="server" ... >
    <SelectParameters>
        <asp:ControlParameter ControlID="ASPxRoundPanel1$ASPxComboBoxCategoriesInContent" Name="CategoryID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
```

If `ASPxComboBox` is placed inside a `TemplateControl`, the `ControlID` property should contain additional markers.

```aspx
<dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ...>
    <HeaderTemplate>
        <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInHeader" runat="server" ... />
        ...
</dx:ASPxRoundPanel>

<asp:SqlDataSource ID="SqlDataSourceProducts2" runat="server" ... >
    <SelectParameters>
        <asp:ControlParameter ControlID="ASPxRoundPanel2$HTC$TC$ASPxComboBoxCategoriesInHeader" Name="CategoryID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
```

### Specify ControlID property at runtime

When `ASPxComboBox` is inside a `TemplateControl` it can be difficult to correctly specify the `ControlID` property manually. In this case, you can determine the `ControlID` property value at runtime. The `ControlParameter`'s `ControlID` property equals the `UniqueID` property of an external `ASPxComboBox`.

```csharp
protected void ASPxComboBoxCategoriesInHeader_Init(object sender, EventArgs e) {
    var cb = (ASPxComboBox)sender;
    ControlParameter controlParameter = (ControlParameter)SqlDataSourceProducts3.SelectParameters[0];
    controlParameter.ControlID = cb.UniqueID;
}
```

```aspx
<dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ... >
    <HeaderTemplate>
        <dx:ASPxComboBox ID="ASPxComboBoxCategoriesInHeader2" runat="server" OnInit="ASPxComboBoxCategoriesInHeader_Init" ... />
        ...
</dx:ASPxRoundPanel>

<asp:SqlDataSource ID="SqlDataSourceProducts3" runat="server" ... >
    <SelectParameters>
        <asp:ControlParameter Name="CategoryID" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
```

## Files to Review

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
