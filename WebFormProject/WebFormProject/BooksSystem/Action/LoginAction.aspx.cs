using System;
using System.Web;
using System.Web.UI;

namespace WebFormProject
{

	public partial class LoginAction : System.Web.UI.Page
	{
		public string result;
		protected void Page_Load(object sender, EventArgs e)
		{
			string account = Request.Form["account"];
			string password = Request.Form["password"];
			result = LoginService.VerifyLoginService(account, password);
		}
	}
}
