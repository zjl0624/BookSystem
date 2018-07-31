using System;
using System.Collections.Generic;
namespace WebFormProject
{
    public class CreateMenu
    {
        public CreateMenu()
        {
        }

        public static Dictionary<string,object> CreateCustomMenu(Dictionary<string,object> body,string accessToken) {
            string url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + accessToken;
            string data = JsonSerialize.ObjectToJsonStr(body);
            string jsonStr = NetRequest.HttpPost(url, data);
            Dictionary<string, object> dic = JsonSerialize.JsonStrToDictionary(jsonStr);
            return dic;
        } 
    }
}
