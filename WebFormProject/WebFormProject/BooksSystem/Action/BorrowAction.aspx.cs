using System;
using System.Web;
using System.Web.UI;

namespace WebFormProject
{

	public partial class BorrowAction : System.Web.UI.Page
	{
		public string result;
		protected void Page_Load(object sender, EventArgs e)
		{
			string userId = Request.Form["userId"];
			string bookId = Request.Form["BookId"];
			result = BorrowService.BorrowBook(userId, bookId);
		}
	}
}
