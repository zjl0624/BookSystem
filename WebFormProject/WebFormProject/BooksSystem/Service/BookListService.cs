using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
namespace WebFormProject
{
	public class BookListService
	{
		public BookListService()
		{
		}

		public static string queryBookListService(string tablename,string isBorrow)
		{
			BookListDao dao = new BookListDao();
			DataSet data = dao.queryBookList(tablename,isBorrow);
			dao.conn.CloseConn();
			ArrayList arr = new ArrayList();
			for (int i = 0; i < data.Tables[tablename].Rows.Count; i++)
			{
				Dictionary<string, string> dic = new Dictionary<string, string>();
				dic.Add("bookId", data.Tables[tablename].Rows[i]["BookId"].ToString());
				dic.Add("bookName", data.Tables[tablename].Rows[i]["BookName"].ToString());
				dic.Add("author", data.Tables[tablename].Rows[i]["Author"].ToString());
				dic.Add("summary", data.Tables[tablename].Rows[i]["Summary"].ToString());
				dic.Add("IsBorrow", data.Tables[tablename].Rows[i]["IsBorrow"].ToString());
				string bookCover = StaticSettings.BookCoverUrl + data.Tables[tablename].Rows[i]["Cover"].ToString();
				dic.Add("Cover", bookCover);
				arr.Add(dic);
			}
			string jsonStr = "";
			if (arr.Count > 0)
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1000, "查询成功", arr);
			}
			else
			{
				jsonStr = JsonSerialize.GetResultsJsonStr(1001, "无图书", null);
			}
			return jsonStr;
		}
	}
}
