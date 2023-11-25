using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void ASPxComboBoxCategoriesInHeader_Init(object sender, EventArgs e) {
        var cb = (ASPxComboBox)sender;
        ControlParameter controlParameter = (ControlParameter)SqlDataSourceProducts3.SelectParameters[0];
        controlParameter.ControlID = cb.UniqueID;
    }
}
