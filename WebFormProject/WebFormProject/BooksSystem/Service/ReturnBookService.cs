using System;
namespace WebFormProject
{
	public class ReturnBookService
	{
		public ReturnBookService()
		{
		}

		public static string ReturnBooks(string bookId, string userId)
		{
			ReturnBookDao dao = new ReturnBookDao();
			int num1 = dao.DeleteBorrowInfoList(bookId, userId);
			int num2 = dao.UpdateBooksStatus(bookId);
			string jsonstr = "";
			if (num1 == 1 && num2 == 1)
			{
				jsonstr = JsonSerialize.GetResultsJsonStr(1000, "还书成功", "");
			}
			else
			{
				jsonstr = JsonSerialize.GetResultsJsonStr(1001, "还书失败", "");
			}

			return jsonstr;
		}
	}
}
