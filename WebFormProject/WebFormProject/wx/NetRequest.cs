using System;
using System.Net;
using System.IO;
using System.Text;
namespace WebFormProject
{
    public class NetRequest
    {
        public NetRequest()
        {
        }

		public static string HttpGet(string Url, string postDataStr)
		{
			HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url + (postDataStr == "" ? "" : "?") + postDataStr);
			request.Method = "GET";
			request.ContentType = "text/html;charset=UTF-8";

			HttpWebResponse response = (HttpWebResponse)request.GetResponse();
			Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream,Encoding.UTF8);
			string retString = myStreamReader.ReadToEnd();
			myStreamReader.Close();
			myResponseStream.Close();

			return retString;
		}


		public static string HttpPost(string Url, string postDataStr)
		{
			HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
			request.Method = "POST";
			request.ContentType = "application/x-www-form-urlencoded";
			request.ContentLength = postDataStr.Length;
			StreamWriter writer = new StreamWriter(request.GetRequestStream(), Encoding.ASCII);
			writer.Write(postDataStr);
			writer.Flush();
			HttpWebResponse response = (HttpWebResponse)request.GetResponse();
			string encoding = response.ContentEncoding;
			if (encoding == null || encoding.Length < 1)
			{
				encoding = "UTF-8"; //默认编码  
			}
			StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
			string retString = reader.ReadToEnd();
			return retString;
		}
	}
}
