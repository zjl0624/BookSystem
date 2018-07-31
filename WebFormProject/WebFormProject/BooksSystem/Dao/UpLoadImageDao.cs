using System;
using System.Collections;
namespace WebFormProject
{
	public class UpLoadImageDao:BaseDao
	{
		public UpLoadImageDao()
		{
		}


		public int UpdateIcon(string iconUrl, string userId, string tablename)
		{
			SqlParams userIdParam = new SqlParams("userId", userId, (int)SqlParamsType.IntType);
			SqlParams iconUrlParam = new SqlParams("iconUrl", iconUrl, (int)SqlParamsType.StringType);
			ArrayList arr = new ArrayList();
			arr.Add(iconUrlParam);
			arr.Add(userIdParam);
			string sql = "update Users set Icon = @" + iconUrlParam.key + " where UserId = @" + userIdParam.key;
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}
	}
}
