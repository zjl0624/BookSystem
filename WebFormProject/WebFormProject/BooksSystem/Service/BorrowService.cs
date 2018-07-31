using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
namespace WebFormProject
{
	public class BorrowService
	{
		public BorrowService()
		{
		}

		public static string BorrowBook(string userId, string bookId)
		{
			string jsonStr = "";
			BorrowDao dao = new BorrowDao();
			string tablename = "queryIsBorrow";
			DataSet data = dao.QueryIsBorrow(bookId, tablename);
			ArrayList arr = new ArrayList();
			for (int i = 0; i < data.Tables[tablename].Rows.Count; i++)
			{
				string isBorrow = data.Tables[tablename].Rows[i]["IsBorrow"].ToString();
				arr.Add(isBorrow);
			}
			if (arr.Count == 0)
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1001, "你所借阅的书籍不存在", null);
			}
			else
			{
				if (Convert.ToInt32(arr[0]) == 0)
				{
					dao.InsertBorrowList(userId, bookId);
					dao.UpdateBooksStatus(bookId);
					jsonStr = JsonSerialize.GetResultsJsonStr(1000, "借阅成功", null);
				}
				else
				{
					jsonStr = JsonSerialize.GetResultsJsonStr(1002, "你所借阅的书籍已被借出", null);
				}
			}
			dao.conn.CloseConn();
			return jsonStr;
		}
	}
}
