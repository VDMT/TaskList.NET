<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TaskList.NET.Default1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Import Namespace="TaskList.NET.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link href="css/tasklist.css" rel="stylesheet" type="text/css" />
	<script src="Scripts/jquery-1.8.1.js" type="text/javascript"></script>
	<script src="Scripts/knockout-2.1.0.js" type="text/javascript"></script>
</head>
<body>
	<form id="form1" runat="server">
	<telerik:RadScriptManager runat="server">
	</telerik:RadScriptManager>
	<div id="MainPanel">
		<div id="SideToggleSwitch">
			<a href="#" id="modeToggle">+</a></div>
		<div id="TaskAddPanel">
			<asp:Label ID="Label1" runat="server" Text="Label">Task Title:</asp:Label>
			<input id="Text1" type="text" />
			<br />
			<asp:Label ID="Label2" runat="server" Text="Label">Due Date:</asp:Label>
			<telerik:RadDateTimePicker ID="RadDateTimePicker1" runat="server">
			</telerik:RadDateTimePicker>
			<br />
			<telerik:RadButton ID="RadButton1" runat="server" Text="Submit">
			</telerik:RadButton>
		</div>
		<div id="DisplayPanel">
			<ul id="todo-list" data-bind="foreach: tasks">
				<!-- add lists of tasks in here -->
				<li>
					<div>
						<label data-bind="text: title"></label>
						<label data-bind="text: duedate"></label>
					</div>
				</li>
			</ul>
		</div>
	</div>
	</form>
	<script type="text/javascript">
		
		$('#TaskAddPanel').toggle();

		var tasksObjArray = [
			{ id: 1, title: 'some title', duedate: new Date('Thu Oct 13 2012 08:54:47 GMT+1300 (New Zealand Daylight Time)'), isComplete: true, isDeleted: false },
			{ id: 2, title: 'schedule a backup', duedate: new Date('Thu Oct 12 2012 08:54:47 GMT+1300 (New Zealand Daylight Time)'), isComplete: false, isDeleted: false },
			{ id: 3, title: 'remove tapes', duedate: new Date('Thu Oct 14 2012 08:54:47 GMT+1300 (New Zealand Daylight Time)'), isComplete: true, isDeleted: false },
		];

		function Task(id, title, duedate, isComplete, isDeleted) {
		    var self = this;
		    self.id = id;
		    self.title = title;
		    self.duedate = duedate;
		    self.isComplete = isComplete;
		    self.isDeleted = isDeleted;
            };

		function TasksListViewModel() {
			var self = this;
			self.tasks = ko.observableArray([]);

			self.populate = function () {
			    $.each(tasksObjArray, function (key,t) {
			        self.tasks.push(new Task(t.id, t.title, t.duedate));
			    });
			};
        }
        
        var create = new TasksListViewModel();
        create.populate();
		ko.applyBindings(create);

		$(document).ready(function () {
			// build task list
			//console.log("building task list...");
//			var listElm = $("#DisplayPanel ul");
//			for (var i = 0; i < dataobjArray.length; i++) {
//				//console.log("adding task..." + dataobjArray[i].title);
//				listElm.append(
//					"<li>"
//					+ "<div>"
//					+ "<label>" + dataobjArray[i].title + "</label>"
//					+ dataobjArray[i].duedate.toDateString().toLowerCase()
//					+ "<div class='taskCommands'>"
//					+ "<a href='#' class='removeTask' value='" + dataobjArray[i].id + "'>x</a>"
//					+ "<a href='#' id='completeTask' class='completeTask' value='" + dataobjArray[i].id + "'>✔</a>"
//					+ "</div>"
//					+ "</div>"
//					+ "</li>");
//			}
		});

			$('#modeToggle').click(function () {
				var toggleSign = $('#modeToggle');
				//console.log('toggleSign: ' + toggleSign.text());
				if (toggleSign.text() == '+') {
					toggleSign.html('x');
				}
				else {
					toggleSign.html('+');
				}
				$('#TaskAddPanel').toggle();
			});

			$('.removeTask').click(function () {
				//+ $(this).attr('value')
				console.log('remove task: ');
			});

	</script>
</body>
</html>
