using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
namespace WebFormProject
{
	public class LoginService
	{
		enum ReturnCode : int
		{
			LoginSuccess = 1000,
			NoAccount = 1001,
			CannotNull = 1002,
			IsLogined = 1003
		};

		public LoginService()
		{
		}

		public static string VerifyLoginService(string account, string password)
		{
			string jsonStr = "";
			if (!String.IsNullOrEmpty(account) && !String.IsNullOrEmpty(password))
			{
				LoginDao dao = new LoginDao();
				string tablename = "VerifyLogin";
				DataSet data = dao.VerifyLoginDao(account, password, tablename);
				int count = Convert.ToInt32(data.Tables[tablename].Rows[0]["Count"]);
				if (count == 0)
				{
					jsonStr = JsonSerialize.GetResultsJsonStr((int)ReturnCode.NoAccount, "账号不存在或密码错误", null);
				}
				else
				{
					int isLogin = Convert.ToInt32(data.Tables[tablename].Rows[0]["IsLogin"]);
					if (isLogin == 1)
					{
						jsonStr = JsonSerialize.GetResultsJsonStr((int)ReturnCode.IsLogined, "账号已登录",null);
					}
					else
					{
						jsonStr = JsonSerialize.GetResultsJsonStr((int)ReturnCode.LoginSuccess, "登录成功", null);
						int userId = Convert.ToInt32(data.Tables[tablename].Rows[0]["UserId"]);
						dao.ChangeLoginStauts(userId,"ChangeLoginStauts");
					}

				}
				dao.conn.CloseConn();
			}
			else
			{
				jsonStr = JsonSerialize.GetResultsJsonStr((int)ReturnCode.CannotNull, "账号和密码不能为空", null);
			}

			return jsonStr;
		}
	}
}
