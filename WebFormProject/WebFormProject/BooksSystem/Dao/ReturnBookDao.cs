using System;
using System.Collections;
namespace WebFormProject
{
	public class ReturnBookDao:BaseDao
	{
		public ReturnBookDao()
		{
		}

		public int DeleteBorrowInfoList(string bookId, string userId)
		{
			SqlParams pBookId = new SqlParams("bookId", Convert.ToInt32(bookId), (int)SqlParamsType.IntType);
			SqlParams pUserId = new SqlParams("userId", Convert.ToInt32(userId), (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(pBookId);
			arr.Add(pUserId);
			string sql = "delete  from BorrowInfo where BookId = @" + pBookId.key + " and UserId = @" + pUserId.key;
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}

		public int UpdateBooksStatus(string bookId)
		{
			SqlParams bookIdParam = new SqlParams("bookId", Convert.ToInt32(bookId), (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(bookIdParam);
			string sql = "update Books set IsBorrow = 0 where BookId = @" + bookIdParam.key;
			int num = conn.ExecuteSqlForNon(arr, sql);
			return num;
		}
	}
}
