using System;
using System.Web;
using System.Web.UI;
using System.Net;
using System.IO;
using System.Text;
using System.Xml;
namespace WebFormProject
{

	public partial class Verify : System.Web.UI.Page
	{
		public string result = "haha";

		protected void Page_Load(object sender, EventArgs e)
		{
			var echostr = Request["echoStr"];
			if (checkSignature() && !string.IsNullOrEmpty(echostr))
			{
				Response.Write(echostr);//推送  

				Response.End();
			}

            Stream requestStream = Request.InputStream;
			byte[] requestByte = new byte[requestStream.Length];
			requestStream.Read(requestByte, 0, (int)requestStream.Length);
			string requestStr = Encoding.UTF8.GetString(requestByte);
            if (!string.IsNullOrEmpty(requestStr)){
                XmlDocument requestDocXml = new XmlDocument();
                requestDocXml.LoadXml(requestStr);
				XmlElement rootElement = requestDocXml.DocumentElement;
                string openID = rootElement.SelectSingleNode("FromUserName").InnerText;
                string contentStr = "";
                if(openID == "ocKlI1pLWSKOmJ6cKdqZ1mycTS6E") {
                    contentStr = "哈哈";
                }else {
                    contentStr = "呵呵";
                }
                string xmlResponse = "<xml><ToUserName><![CDATA[" + openID + "]]></ToUserName><FromUserName><![CDATA[" + rootElement.SelectSingleNode("ToUserName").InnerText + "]]></FromUserName><CreateTime>12345678</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[" + contentStr + "]]></Content></xml>";
                Response.ContentType = "text/xml";
				Response.Write(xmlResponse);
                Response.End();
            }
		}

		private bool checkSignature()
		{
			var signature = Request["signature"];
			var timestamp = Request["timestamp"];
			var nonce = Request["nonce"];
			var token = "zjl";
			string[] ArrTmp = { token, timestamp, nonce };
			Array.Sort(ArrTmp);     //字典排序  
			string tmpStr = string.Join("", ArrTmp);
			tmpStr = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tmpStr, "SHA1");
			tmpStr = tmpStr.ToLower();
			if (tmpStr == signature)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}
