using System;
using System.Web;
using System.Web.UI;
using System.IO;
namespace WebFormProject
{

	public partial class UpLoadImageAction : System.Web.UI.Page
	{
		public string message;
		protected void Page_Load(object sender, EventArgs e)
		{
			HttpPostedFile uploadFile = Request.Files[0];
			string directoryPath = Server.MapPath("~/BooksSystem/UploadImages/");
			string userId = Request.Form["userId"];
			message = UpLoadImageService.SaveUpLoadImage(uploadFile, directoryPath, userId, "SaveIcon");
		}
	}
}
