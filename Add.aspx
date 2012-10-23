<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="TaskList.NET.Default" %>

<%@ Import Namespace="TaskList.NET" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<%--	<link href="css/app.css" rel="stylesheet" type="text/css" />
	<link href="css/base.css" rel="stylesheet" type="text/css" />--%>
	<link href="css/tasklist.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="form1" runat="server">
	<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
	</telerik:RadScriptManager>
	<div>
		<div style="display: inline-block">
			<label>
				ToDo Item:</label>
			<input id="newtodo" runat="server" value="" />
		</div>
		<telerik:RadDateTimePicker ID="RadDateTimePicker1" runat="server">
		</telerik:RadDateTimePicker>
		<div style="display: block">
			<telerik:RadButton ID="SubmitTodoItem" runat="server" Text="RadButton" OnClick="SubmitTodoItem_Click">
			</telerik:RadButton>
		</div>
	</div>
	<%--<span id="todo-count"><strong>0</strong> item left</span>--%>
	<%--<div id="ContainerListItems" runat="server">--%>
	<telerik:RadGrid ID="RadGrid1" runat="server">
	</telerik:RadGrid>
	<%--</div>--%>
	<div id="error" runat="server">
	</div>
	</form>
</body>
</html>
