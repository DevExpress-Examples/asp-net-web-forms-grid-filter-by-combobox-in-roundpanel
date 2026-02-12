Option Infer On

Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub ASPxComboBoxCategoriesInHeader_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim cb = DirectCast(sender, ASPxComboBox)
		Dim controlParameter As ControlParameter = CType(SqlDataSourceProducts3.SelectParameters(0), ControlParameter)
		controlParameter.ControlID = cb.UniqueID
	End Sub
End Class
