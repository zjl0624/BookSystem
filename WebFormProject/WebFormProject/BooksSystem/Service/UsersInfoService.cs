using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
namespace WebFormProject
{
	public class UsersInfoService
	{
		public UsersInfoService()
		{
			
		}

		public static string QueryUserInfoService(int userId,string directoryPath)
		{
			UserInfoDao dao = new UserInfoDao();
			string tablename = "UsersInfo";
			DataSet data = dao.QueryUsersInfoDao(userId,tablename);
			dao.conn.CloseConn();
			string jsonStr = "";
			if (data.Tables[tablename].Rows.Count > 0)
			{
				ArrayList userInfoList = new ArrayList();
				for (int i = 0; i < data.Tables[tablename].Rows.Count; i++)
				{
					string username = data.Tables[tablename].Rows[i]["Username"].ToString();
					string account = data.Tables[tablename].Rows[i]["Account"].ToString();
					string password = data.Tables[tablename].Rows[i]["Password"].ToString();
					string createTime = data.Tables[tablename].Rows[i]["CreateTime"].ToString();
					string id = data.Tables[tablename].Rows[i]["UserId"].ToString();
					int isAdmin = Convert.ToInt32(data.Tables[tablename].Rows[i]["IsAdmin"]);

					string icon = StaticSettings.ServerUrl + data.Tables[tablename].Rows[i]["Icon"].ToString();
					UserModel user = new UserModel(Convert.ToInt32(id), username, account, password, createTime,isAdmin,icon);
					Dictionary<string, string> dic = new Dictionary<string, string>();
					dic.Add("username", user.username);
					dic.Add("userId", user.userId.ToString());
					dic.Add("account", user.account);
					dic.Add("password", user.password);
					dic.Add("createTime", user.createTime);
					dic.Add("isAdmin", user.isAdmin.ToString());
					dic.Add("icon", user.icon);
					userInfoList.Add(dic);
				}
				jsonStr = JsonSerialize.GetResultsJsonStr(1000, "", userInfoList);
			}
			else
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1001, "您查找的用户不存在", null);
			}

			return jsonStr;
		}
	}
}
