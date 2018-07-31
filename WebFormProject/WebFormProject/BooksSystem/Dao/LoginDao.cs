using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Collections;
namespace WebFormProject
{
	public class LoginDao:BaseDao
	{

		public LoginDao()
		{
			
		}

		public DataSet VerifyLoginDao(string account, string password,string tablename)
		{
			SqlParams accountParam = new SqlParams("account", account, (int)SqlParamsType.StringType);
			SqlParams passwordParam = new SqlParams("password",password,(int)SqlParamsType.StringType);
			string sql = "select count(*) as Count,IsLogin,UserId from Users where account = @" + accountParam.key + " and " + "Password = @" + passwordParam.key;
			ArrayList arr = new ArrayList();
			arr.Add(accountParam);
			arr.Add(passwordParam);
			DataSet data = conn.ExecuteSqlForDataSet(arr,sql,tablename);
			return data;

		}

		public int ChangeLoginStauts(int userId, string tablename)
		{
			SqlParams p = new SqlParams("userId", userId, (int)SqlParamsType.IntType);
			string sql = "update Users set IsLogin = 1 where UserId = @" + p.key;
			ArrayList arr = new ArrayList();
			arr.Add(p);
			//DataSet data = conn.ExecuteSqlForDataSet(arr,sql,tablename);
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}
	}
}
