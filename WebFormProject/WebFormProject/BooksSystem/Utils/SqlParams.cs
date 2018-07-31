using System;
namespace WebFormProject
{
	public class SqlParams
	{

		public string key;
		public object content;
		public int type;
		public SqlParams(string key, object content,int type)
		{
			this.key = key;
			this.content = content;
			this.type = type;
		}
	}
} 
