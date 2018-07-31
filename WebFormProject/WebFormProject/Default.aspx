<%@ Page Language="C#" Inherits="WebFormProject.Default" %>
<meta charset = "utf-8">
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
</head>
<body>
	<form id="form1" runat="server">
		<asp:Button id="button1" runat="server" Text="创建菜单" OnClick="button1Clicked" />
			<asp:Button id="button2" runat="server" Text="获取token" OnClick="button2Clicked" />
	</form>
</body>
</html>
