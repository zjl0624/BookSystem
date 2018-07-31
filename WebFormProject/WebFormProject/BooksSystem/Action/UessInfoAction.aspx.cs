using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Collections.Generic;
namespace WebFormProject
{

	public partial class UessInfoAction : System.Web.UI.Page
	{
		public string userInfo;
		protected void Page_Load(object sender, EventArgs e)
		{
			string param = Request.Form["userId"];
			int userId = Convert.ToInt32(param);
			string directoryPath = Server.MapPath("~/BooksSystem/UploadImages/");
			userInfo = UsersInfoService.QueryUserInfoService(userId,directoryPath);
		}
	}
}
