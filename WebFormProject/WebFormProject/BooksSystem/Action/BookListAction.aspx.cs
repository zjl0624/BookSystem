using System;
using System.Web;
using System.Web.UI;

namespace WebFormProject
{

	public partial class BookListAction : System.Web.UI.Page
	{
		public string result;
		protected void Page_Load(object sender, EventArgs e)
		{
			string isBorrow = Request.Form["isBorrow"];
			result = BookListService.queryBookListService("queryBookList", isBorrow);
		}
	}
}
