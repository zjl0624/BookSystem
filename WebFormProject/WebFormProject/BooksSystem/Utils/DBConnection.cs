using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections.Generic;
using System.Collections;

namespace WebFormProject
{
	enum SqlParamsType : int
	{
		IntType = 0,
		StringType = 1,
		DateType = 2
	};
	public class DBConnection
	{

		private string connstr = "Server=127.0.0.1;Port=3306;Database=MyDb;Uid=root;Pwd=920624;";
		private MySqlConnection conn;
		public DBConnection()
		{

			conn = new MySqlConnection(connstr);
			string errorMsg = "";
			try
			{
				conn.Open();
			}
			catch (Exception ex)
			{
				errorMsg = ex.Message;
			}

		}

		public void CloseConn()
		{
			conn.Close();
		}


		public DataSet ExecuteSqlForDataSet(ArrayList paramList,string sql,string tablename)
		{
			MySqlCommand cmd = CreateCommand(paramList,sql);
			MySqlDataAdapter ad = new MySqlDataAdapter();
			ad.SelectCommand = cmd;
			DataSet data = new DataSet();
			ad.Fill(data,tablename);
			return data;
		}

		public int ExecuteSqlForNon(ArrayList paramList, string sql)
		{
			MySqlCommand cmd = CreateCommand(paramList, sql);
			int num = cmd.ExecuteNonQuery();
			return num;
		}
		private MySqlCommand CreateCommand(ArrayList paramList, string sql)
		{
			MySqlCommand cmd = new MySqlCommand(sql, conn);
			foreach (SqlParams s in paramList)
			{
				MySqlParameter p = new MySqlParameter();
				if (s.type == Convert.ToInt32(SqlParamsType.IntType))
				{
					p = new MySqlParameter(s.key, MySqlDbType.Int32);
				}
				else if (s.type == Convert.ToInt32(SqlParamsType.StringType))
				{
					p = new MySqlParameter(s.key, MySqlDbType.VarChar);
				}
				else if (s.type == Convert.ToInt32(SqlParamsType.DateType))
				{
					p = new MySqlParameter(s.key, MySqlDbType.Date);
				}
				p.Value = s.content;
				cmd.Parameters.Add(p);

			}
			return cmd;
		}
	}
}
