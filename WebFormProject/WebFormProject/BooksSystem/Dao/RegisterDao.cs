using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
namespace WebFormProject
{
	public class RegisterDao:BaseDao
	{

		public RegisterDao()
		{

		}


		public int RegisterUser(string account,string password,string username,int isAdmin,string tablename)
		{
			SqlParams accountParam = new SqlParams("account", account, (int)SqlParamsType.StringType);
			SqlParams passwordParam = new SqlParams("password", password, (int)SqlParamsType.StringType);
			SqlParams usernameParam = new SqlParams("username", username, (int)SqlParamsType.StringType);
			SqlParams isAdminParam = new SqlParams("isAdmin", isAdmin, (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(accountParam);
			arr.Add(passwordParam);
			arr.Add(usernameParam);
			arr.Add(isAdminParam);
			string sql = "insert into Users(Account,Password,Username,IsAdmin,IsLogin,CreateTime) values(@" + accountParam.key + ",@" + passwordParam.key + ",@" + usernameParam.key + ",@" + isAdminParam.key + ",0," + "(select now())" + ")";
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}


		public DataSet SelectIsRepeat(string account, string tablename)
		{
			SqlParams p = new SqlParams("account", account, (int)SqlParamsType.StringType);
			ArrayList arr = new ArrayList();
			arr.Add(p);

			string sql = "select count(*) as Count from Users where Account = @" + p.key;
			DataSet data = conn.ExecuteSqlForDataSet(arr,sql,tablename);
			return data;

		}
	}
}
