using System;
using System.Data;
namespace WebFormProject
{
	public class RegisterService
	{
		public RegisterService()
		{
		}

		public static string RegisterUserService(string account, string password, string username, int isAdmin, string tablename)
		{
			string jsonStr = "";
			if (account == null || password == null)
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1003, "用户名或密码不能为空", null);
				return jsonStr;
			}
			RegisterDao dao = new RegisterDao();

			DataSet ds = dao.SelectIsRepeat(account, "IsRepeat");
			if (Convert.ToInt32(ds.Tables["IsRepeat"].Rows[0]["Count"]) > 0)
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1001, "你输入的账号已存在", null);
				dao.conn.CloseConn();
				return jsonStr;
			}
			else
			{
				int num = dao.RegisterUser(account, password, username, isAdmin, tablename);
				dao.conn.CloseConn();
				if (num == 1)
				{
					jsonStr = JsonSerialize.GetResultsJsonStr(1000, "注册成功", null);
				}
				else
				{
					jsonStr = JsonSerialize.GetResultsJsonStr(1002, "注册失败", null);
				}
				return jsonStr;
			}


		}
	}
}
