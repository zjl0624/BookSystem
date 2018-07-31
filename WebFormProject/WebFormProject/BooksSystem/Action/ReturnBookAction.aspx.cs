using System;
using System.Web;
using System.Web.UI;

namespace WebFormProject
{

	public partial class ReturnBookAction : System.Web.UI.Page
	{
		public string result;
		protected void Page_Load(object sender, EventArgs e)
		{
			string userId = Request.Form["userId"];
			string bookId = Request.Form["bookId"];
			result = ReturnBookService.ReturnBooks(bookId, userId);
		}
	}
}
