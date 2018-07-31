using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
namespace WebFormProject
{
	public class BorrowlistService
	{
		public BorrowlistService()
		{
		}

		public static string queryBorrowlistService(string tablename, string userId)
		{
			BorrowlistDao dao = new BorrowlistDao();
			DataSet data = dao.queryBorrowlistDao(tablename, userId);
			dao.conn.CloseConn();
			ArrayList arr = new ArrayList();
			string jsonStr = "";
			for (int i = 0; i < data.Tables[tablename].Rows.Count; i++)
			{
				Dictionary<string, string> dic = new Dictionary<string, string>();
				string uId = data.Tables[tablename].Rows[i]["UserId"].ToString();
				string bookId = data.Tables[tablename].Rows[i]["BookId"].ToString();
				string bookname = data.Tables[tablename].Rows[i]["BookName"].ToString();
				string author = data.Tables[tablename].Rows[i]["Author"].ToString();
				string summary = data.Tables[tablename].Rows[i]["Summary"].ToString();
				string isBorrow = data.Tables[tablename].Rows[i]["IsBorrow"].ToString();
				string bookCover = StaticSettings.BookCoverUrl + data.Tables[tablename].Rows[i]["Cover"].ToString();
				dic.Add("cover", bookCover);
				dic.Add("userId", uId);
				dic.Add("bookId", bookId);
				dic.Add("bookName", bookname);
				dic.Add("author",author);
				dic.Add("summary", summary);
				dic.Add("isBorrow", isBorrow);
				arr.Add(dic);
			}
			if (arr.Count > 0)
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1000, "获取成功", arr);
			}
			else
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1001, "无已借图书", null);
			}
			return jsonStr;
		}
	}
}
