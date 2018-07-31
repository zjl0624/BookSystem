using System;
namespace WebFormProject
{
	public class UserModel
	{
		public int userId;
		public string username;
		public string account;
		public string password;
		public string createTime;
		public int isAdmin;
		public string icon;
		public UserModel(int userId,string username,string account,string password,string createTime,int isAdmin,string icon)
		{
			this.userId = userId;
			this.username = username;
			this.account = account;
			this.password = password;
			this.createTime = createTime;
			this.isAdmin = isAdmin;
			this.icon = icon;
		}

	}
}
