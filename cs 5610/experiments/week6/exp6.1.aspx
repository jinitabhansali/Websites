<%@ Page Language="C#" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        Response.Redirect("../../Default.aspx");   

    }
</script>

<!DOCTYPE html>

<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> 
<script src="../../bootstrap/js/bootstrap.js"></script>  
<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../../style1.css">
<link rel="stylesheet" type="text/css" href="../../responsive.css">
<meta charset='utf-8' />

<title>Login Form</title>

<style>
    .body-pad
    {
        padding-top:60px;
    }
</style>


</head>

<body class="body-pad">

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="collapse navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li><a class="navbar-brand"  href="#">CS5610</a></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Experiments</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">More <span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="themes">
                        <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
                        <li><a  href="statistics/" target="_blank">Statistics</a></li>
                        <li><a href="source/" target="_blank">Source</a></li>
                        <li><a  href="search/" target="_blank">Search</a></li>
                        <li><a  href="searchtree/" target="_blank">SearchTree</a></li>
                        <li><a  href="textview/" target="_blank">TetView</a></li>
                        <li><a  href="filelist.aspx" target="_blank">FileList</a></li>
                        <li><a  href="autofile.aspx" target="_blank">AutoFile</a></li>
                        <li><a  href="images/autoimage.aspx" target="_blank">Images</a></li>
                        <li><a  href="blog/Default.aspx" target="_blank">Blog</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div class="login-area" style="width:30%;">
        <div><h3>Username</h3><input type="text" class="username form-control" /></div>
        <div><h3>Password</h3><input type="password" class="password form-control" /></div><br />
        <div><button class="submit btn-primary form-control">Login</button></div>
    </div>
</div>
<form runat="server">
<div class="container">
    <div class="registration">
        <h3 style="font-family:'Times New Roman'; font-size:32px;">Register</h3>
        <br />
        <asp:Label ID="email_enter" runat="server" Text="Enter Email"></asp:Label>
        &nbsp;:
        <asp:TextBox ID="user_email" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="username_enter" runat="server" Text="Enter Username"></asp:Label>
        &nbsp;:
        <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Label ID="pwd_enter" runat="server" Text="Enter Password"></asp:Label>
        &nbsp;:
        <asp:TextBox ID="user_pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="password_req"
            runat ="server"
            ControlToValidate="user_pwd"
            ErrorMessage="Password is required"
            SetFocusOnError="true"
            Display="Dynamic"/>
        <br />
        <asp:Label ID="re_pwd" runat="server" Text="Re-enter Password"></asp:Label>
        &nbsp;:
        <asp:TextBox ID="user_re_pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="confirm_pwd"
            runat ="server"
            ControlToValidate="user_re_pwd"
            ErrorMessage="Confirm Password is required"
            SetFocusOnError="true"
            Display="Dynamic"/>
        <asp:CompareValidator ID="comparePasswords"
            runat="server"
            ControlToCompare="user_pwd"
            ControlToValidate="user_re_pwd"
            ErrorMessage= "Your passwords do not match"
            Display="Dynamic"/>
        <br />
        <asp:Button ID='Button1' runat="server" CssClass="form-control btn-primary" Text="Register" OnClick= "Button1_Click"/>
    </div>
    <br /><br />
    <pre>
NOTE: Please Login to Register
In this experiment , I have connected to a databse and implemented the 'INSERT' query. 
Everytime a user enters all their information , it gets inserted into the database. The code also checks whether the
two password fields contain the same content. On clicking the submit button , it will display a error message if the
two password fields are not equal.
    </pre>
    <a href="../../fileview/Default.aspx?~/experiments/week6/exp6.1.aspx">ASPX Source</a><br />
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jinitabCS %>" 
    InsertCommand="INSERT INTO jinitab.[UserInfo] ([user_email], [username], [pwd]) VALUES (@user_email, @username, @pwd)" 
    ProviderName="<%$ ConnectionStrings:jinitabCS.ProviderName %>" 
    SelectCommand="SELECT [user_email], [username], [pwd] FROM jinitab.[UserInfo] WHERE [user_email]=@user_email">
    <SelectParameters>
        <asp:FormParameter FormField="user_email" Name="user_email" Type="String" />
    </SelectParameters>              
    <InsertParameters>
        <asp:FormParameter FormField="user_email" Name="user_email" Type="String" />
        <asp:FormParameter FormField="username" Name="username" Type="String" />
        <asp:FormParameter FormField="user_pwd" Name="pwd" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
</form>
<script>
    $(function () {
        $(".registration").css('display', 'none');
        $(".submit").click(handleClick);
    });

    function handleClick(event) {
        console.log("clicked");
        var name = $(".username").val();
        var pass = $(".password").val();
        if (name == "ketki" && pass == "ketki") {
            $(".login-area").css('display', 'none');
            $(".registration").css('display', 'table');
        }
    }
</script>

</body>
</html>