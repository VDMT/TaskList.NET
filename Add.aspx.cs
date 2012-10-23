using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskList.NET.Data;

namespace TaskList.NET
{
	public partial class Default : System.Web.UI.Page
	{
		DatabaseDataContext db = new DatabaseDataContext();

		protected void Page_Load(object sender, EventArgs e)
		{
			System.Configuration.Configuration rootWebConfig =
				System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/TaskList.NET");
			System.Configuration.ConnectionStringSettings connsettings;
			connsettings = rootWebConfig.ConnectionStrings.ConnectionStrings["ToDoListConnectionString"];
			string selectStr = "select * from ";

			SqlDataSource gridsource = new SqlDataSource(connsettings.ToString(), selectStr);
			
		}

		protected void SubmitTodoItem_Click(object sender, EventArgs e)
		{
			string todo_description = newtodo.Value;
			DateTime todo_duedate = RadDateTimePicker1.SelectedDate.Value;

			// insert into db			
			ToDo item = new ToDo();
			item.TodoDescMain = todo_description;
			item.TodoDueDate = todo_duedate;
			try
			{
				db.ToDos.InsertOnSubmit(item);
				db.SubmitChanges();
			}
			catch (Exception ex)
			{
				error.InnerText = "Error: " + ex.Message + Environment.NewLine + "Inner:" + ex.InnerException;
			}

			newtodo.Value = "";
		}
	}

	public class TodoData
	{
		DatabaseDataContext db = new DatabaseDataContext();

		public List<ToDo> Get_ToDos()
		{
			var itemsList = (from item in db.ToDos select item).ToList();
			return itemsList;
		}
	}
}