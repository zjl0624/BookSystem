using System;
using System.Collections.Generic;
namespace WebFormProject
{
    public class AccessTokenAction
    {
        public AccessTokenAction()
        {
        }

        public static string GetAccessToken() {
            string url = "https://api.weixin.qq.com/cgi-bin/token";
            string data = "grant_type=client_credential&appid=" + WXStatic.appid + "&secret=" + WXStatic.secret;
            string jsonStr = NetRequest.HttpGet(url, data);
            Dictionary<string, object> dic = JsonSerialize.JsonStrToDictionary(jsonStr);
            string result = dic["access_token"].ToString();
            //WXStatic.access_token = result;
            return result;
        }
    }
}
