using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
namespace WebFormProject
{
	public class BookListDao:BaseDao
	{
		public BookListDao()
		{
		}

		public DataSet queryBookList(string tablename,string isBorrow)
		{
			ArrayList arr = new ArrayList();
			string sql = "";
			if (isBorrow == null)
			{
				sql = "select * from Books";
			}
			else
			{
				SqlParams p = new SqlParams("isBorrow", Convert.ToInt32(isBorrow), (int)SqlParamsType.IntType);
				arr.Add(p);
				sql = "select * from Books where IsBorrow = @" + p.key;
			}
			DataSet data = conn.ExecuteSqlForDataSet(arr, sql, tablename);
			return data;
		}
	}
}
