using System;
using System.Data;
using System.Collections;
namespace WebFormProject
{
	public class BorrowlistDao:BaseDao
	{
		public BorrowlistDao()
		{
		}

		public DataSet queryBorrowlistDao(string tablename, string userId)
		{
			SqlParams p = new SqlParams("userId", Convert.ToInt32(userId), (int)SqlParamsType.IntType);
			ArrayList arr = new ArrayList();
			arr.Add(p);
			string sql = "select Users.UserId,Books.BookName,Books.Author,Books.Summary,Books.IsBorrow,Books.BookId,Books.Cover from Users join BorrowInfo on Users.UserId = BorrowInfo.UserId join Books on BorrowInfo.BookId = Books.BookId where Users.UserId = @" + p.key;
			DataSet data = conn.ExecuteSqlForDataSet(arr, sql, tablename);
			return data;
		}
	}
}
