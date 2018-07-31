using System;
using System.Web;
using System.Web.UI;

namespace WebFormProject
{

	public partial class RegisterAction : System.Web.UI.Page
	{
		public string result;
		protected void Page_Load(object sender, EventArgs e)
		{
			string account = Request.Form["account"];
			string password = Request.Form["password"];
			string username = Request.Form["username"];
			string isAdmin = Request.Form["isAdmin"];

			result = RegisterService.RegisterUserService(account, password, username, Convert.ToInt32(isAdmin),"Register");
		}
	}
}
