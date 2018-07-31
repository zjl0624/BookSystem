using System;
namespace WebFormProject
{
	public class BaseDao
	{
		public DBConnection conn;
		public BaseDao()
		{
			conn = new DBConnection();
		}
	}
}
