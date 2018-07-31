using System;
using System.Collections;
using System.Data;
namespace WebFormProject
{
	public class BorrowDao:BaseDao
	{
		public BorrowDao()
		{
		}

		public int InsertBorrowList(string userId, string bookId)
		{
			SqlParams userIdParam = new SqlParams("userId", Convert.ToInt32(userId), (int)SqlParamsType.IntType);
			SqlParams bookIdParam = new SqlParams("bookId", Convert.ToInt32(bookId), (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(userIdParam);
			arr.Add(bookIdParam);
			string sql = "insert into BorrowInfo(UserId,BookId,BorrowDate) values(@" + userIdParam.key + ",@" + bookIdParam.key + ",(select now()))";
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}

		public int UpdateBooksStatus(string bookId)
		{
			SqlParams bookIdParam = new SqlParams("bookId", Convert.ToInt32(bookId), (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(bookIdParam);
			string sql = "update Books set IsBorrow = 1 where BookId = @" + bookIdParam.key;
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}

		public DataSet QueryIsBorrow(string bookId,string tablename)
		{
			SqlParams bookIdParam = new SqlParams("bookId", Convert.ToInt32(bookId), (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(bookIdParam);
			string sql = "select IsBorrow from Books where BookId = @" + bookIdParam.key;
			DataSet data = conn.ExecuteSqlForDataSet(arr, sql, tablename);
			return data;
		}
	}

}
