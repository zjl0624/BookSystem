using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Data;

namespace WebFormProject
{
	public class JsonSerialize
	{
		public JsonSerialize()
		{
		}

		public static string ObjectToJsonStr(object obj)
		{
			JavaScriptSerializer jss = new JavaScriptSerializer();
			try
			{
				return jss.Serialize(obj);
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}

		public static Dictionary<string,object> JsonStrToDictionary(string jsonStr)
		{
			JavaScriptSerializer jss = new JavaScriptSerializer();
			try
			{
				
				return jss.Deserialize<Dictionary<string, object>>(jsonStr);
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}

		}

		public static string GetResultsJsonStr(int code,string msg,object data)
		{
			Dictionary<string, object> dataDic = new Dictionary<string, object>();
			dataDic.Add("Code", code);
			dataDic.Add("Msg", msg);
			if (data != null)
			{
				dataDic.Add("Data", data);
			}
			else
			{
				dataDic.Add("Data", new Dictionary<string, object>());
			}

			string jsonstr = ObjectToJsonStr(dataDic);
			return jsonstr;
		}
	}
}
