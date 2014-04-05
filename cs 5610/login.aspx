<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Import Namespace="edu.neu.ccis.rasala" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!--
    File: ~/login.aspx
    
    Copyright 2014,
    Richard Rasala,
    College of Computer and Information Science
    Northeastern University, Boston, MA 02115
    rasala@ccs.neu.edu
-->

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string return_url =
            Request.QueryString["ReturnUrl"];

        if (StringTools.IsTrivial(return_url))
        {
            previous_link_wrap.Visible = false;
        }
        else
        {
            previous_link_wrap.Visible = true;
            
            previous_link.HRef =
                StringTools.Unescape(return_url);
        }
    }

</script>


<!DOCTYPE html>

<html lang='en'>

<head>
<meta charset='utf-8' />
<meta name="viewport" content="initial-scale=1, minimum-scale=1">
  
<title>Login</title>
  
<link rel="Stylesheet" type="text/css" href="css/style.css" />
    
<link rel="Stylesheet" type="text/css" href="css/style_screen.css" media="screen" />
    
<link rel="Stylesheet" type="text/css" href="css/enlarge.css" />

</head>

<body>
<div class="pad enlarge">

<form id="form1" runat="server" enableviewstate="false">

<div>
<asp:Login
    ID="Login1"
    runat="server"
    LoginButtonText="Login"
    TitleText="Login"
    DisplayRememberMe="False"></asp:Login>
</div>

<p>
Skip login and go
<a href="Default.aspx">Home</a>
</p>

<p id="previous_link_wrap" runat="server">
Skip login and go back to 
<a href="" id="previous_link" runat="server">Previous Page</a>
</p>

</form>

</div>
</body>
</html>