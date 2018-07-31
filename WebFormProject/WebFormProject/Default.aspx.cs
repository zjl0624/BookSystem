using System;
using System.Web;
using System.Web.UI;
using System.Collections.Generic;
using System.Collections;
namespace WebFormProject
{

	public partial class Default : System.Web.UI.Page
	{
        string result = "";
		//public static string directoryPath = "";
		public void button1Clicked(object sender, EventArgs args)
		{
			//button1.Text = "You clicked me";
            //new DBConnection();
            Dictionary<string, object> dic = new Dictionary<string, object>();
            ArrayList btnArray = new ArrayList();
            Dictionary<string, string> btnDic = new Dictionary<string, string>();
            btnDic.Add("type","click");
            btnDic.Add("name","haha");
            btnDic.Add("key","lalala");
            btnArray.Add(btnDic);
            dic.Add("button",btnArray);
            dic = CreateMenu.CreateCustomMenu(dic,"7stPbVcT4HwNMnfijB_2DGjvqxSi2FBRseJMPEZM0E9sWKsbmunkQG-O3ml-cJGUK74qh68CudPxFmyr_gnqg1p5eRaFiJ8I5IwCmoxl4t_C88uQJO0M_U4tqft7eO7YCYSeAEAVRL");
		}
		public void button2Clicked(object sender, EventArgs args)
		{
			//button1.Text = "You clicked me";
			//new DBConnection();
            result = AccessTokenAction.GetAccessToken();
            button2.Text = result;
		}
		protected void Page_Load(object sender, EventArgs e)
		{
            //directoryPath = Server.MapPath("~/BooksSystem/UploadImages/");

		}
	}
}
