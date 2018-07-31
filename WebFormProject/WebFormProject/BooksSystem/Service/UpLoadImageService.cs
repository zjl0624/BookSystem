using System;
using System.Web;
using System.Web.UI;
using System.IO;
using System.ComponentModel;
namespace WebFormProject
{
	public class UpLoadImageService
	{
		public UpLoadImageService()
		{
		}

		public static string SaveUpLoadImage(HttpPostedFile uploadFile,string directoryPath,string userId,string tablename)
		{
			string fileName = uploadFile.FileName;
			int fileSize = uploadFile.ContentLength;
			string fileExt = Path.GetExtension(fileName).ToLower();
			string message = "";
			if (!(fileExt == ".png" || fileExt == ".gif" || fileExt == ".jpg" || fileExt == ".jpeg"))
			{
				message = JsonSerialize.GetResultsJsonStr(1001, "图片类型只能为gif,png,jpg,jpeg", null);
				return message;
			}
			else
			{
				if (fileSize > (int)(500 * 1024))
				{
					message = JsonSerialize.GetResultsJsonStr(1002, "图片大小不能超过500KB", null);
					return message;
				}
				else
				{
					Random r = new Random();
					string uploadFileName = DateTime.Now.ToString("yyyyMMddhhmmss") + r.Next(100000, 999999) + fileExt;
					try
					{
						if (!Directory.Exists(directoryPath))//不存在这个文件夹就创建这个文件夹 
						{
							Directory.CreateDirectory(directoryPath);
						}
						uploadFile.SaveAs(directoryPath + uploadFileName);
						//message = uploadFileName;
						UpLoadImageDao dao = new UpLoadImageDao();
						dao.UpdateIcon(uploadFileName, userId, tablename);
						dao.conn.CloseConn();
						message = JsonSerialize.GetResultsJsonStr(1000, "上传成功", null);
						return message;
					}
					catch (Exception ex)
					{
						message = JsonSerialize.GetResultsJsonStr(1003, ex.Message, null);
						return message;
					}
				}
			}
		}
	}
}
