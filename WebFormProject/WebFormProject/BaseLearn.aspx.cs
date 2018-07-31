using System;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Collections.Generic;
using System.Web.Script.Serialization;
//using System.Web.Extensions;
namespace WebFormProject
{

	public partial class BaseLearn : System.Web.UI.Page
	{
		const int max = 500;//设置不可修改的常量
		//定义枚举
		enum color : int 
		{
			red=1,
			yellow=2,
			green=3
		};
		public string result;
		protected void Page_Load(object sender, EventArgs e)
		{
			//声明数组
			string[] arr1 = {"haha","hehe","heihei"};


			string str1 = "haha";
			string str2 = "haha";
			//比较两个字符串值是否相等
			if (str1 == str2)
			{
				result = "值相等";
			}
			else
			{
				result = "不相等";
			}

			//比较两个值指针是否相等
			if (str1.CompareTo(str2) > 0)
			{
				result = "指针不相等";
			}
			else
			{
				result = "指针相等";
			}

			//拼接字符串
			result = str1 + "拼上" + str2;

			string str3 = "BeiJing,Shanghai,GuangZhou,WuHan,ShenYang";
			//获取某个关键词所在的索引
			int index = str3.IndexOf("Shang");
			result = index.ToString();

			//通过逗号讲字符串分割成一个数组
			string[] arr2 = str3.Split(',');
			result = "";
			foreach (string s in arr2)
			{
				result = result + " " + s;
			}

			//更改字符串大小写
			str1 = str1.ToUpper();
			result = str1;
			str1 = str1.ToLower();
			result = str1;
			//判断字符串是否为空
			str1 = "";
			if (!String.IsNullOrEmpty(str1))
			{
				result = str1;
			}
			else
			{
				result = "字符串为空";
			}

			//替换字符串
			result = str3.Replace("BeiJing", "chengdu");
			int n = (int)color.yellow;
			result = n.ToString();


			//数组的使用
			ArrayList arr3 = new ArrayList();
			arr3.Add(str1);
			arr3.Add(str2);

			Dictionary<string, string> dic1 = new Dictionary<string, string>();
			dic1.Add("key1","value1");
			dic1.Add("key2", "value2");


			//字典转json字符串
			string jsonStr = "";
			JavaScriptSerializer jss = new JavaScriptSerializer();
			try
			{
				jsonStr = jss.Serialize(dic1);
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}

			Dictionary<string, string> dic2 = new Dictionary<string, string>();
			dic2 = jss.Deserialize < Dictionary<string, string> > (jsonStr);
		}
	}
}
