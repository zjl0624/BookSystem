using System;
using System.Web;
using System.Web.UI;

namespace WebFormProject
{

	public partial class BorrowlistAction : System.Web.UI.Page
	{
		public string results;
		protected void Page_Load(object sender, EventArgs e)
		{
			string param = Request.Form["userId"];
			results = BorrowlistService.queryBorrowlistService("BorrowList", param);
		}
	}
}
