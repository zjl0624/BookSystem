using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;
using System.Collections;
namespace WebFormProject
{
	public class UserInfoDao:BaseDao
	{

		public UserInfoDao()
		{


		}

		public DataSet QueryUsersInfoDao(int userId,string tablename)
		{
			//string sql = "select * from Users where UserId = " + userId;

			string sql = "";
			ArrayList arr = new ArrayList();
			if (userId == 0)
			{
				sql = "select * from Users order by CreateTime DESC";
			}
			else
			{
				SqlParams p = new SqlParams("userId", userId, (int)SqlParamsType.IntType);
				sql = "select * from Users where UserId = @userId";
				arr.Add(p);
			}
			//DataSet data = conn.QuerySqlstr(sql, tablename);


			object data = conn.ExecuteSqlForDataSet(arr, sql,tablename);
			return (DataSet)data;
		}
	}
}
