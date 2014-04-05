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
        padding-top:40px;
    }
</style>


</head>

<body class="body-pad">
<div class="container">
            <form id="form2" runat="server" class="form-horizontal body-pad">

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

 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jinitabCS %>" 
     DeleteCommand="DELETE FROM jinitab.[UserInfo] WHERE [user_email] = @user_email" 
     InsertCommand="INSERT INTO jinitab.[UserInfo] ([user_email], [username], [pwd]) VALUES (@user_email, @username, @pwd)" 
     ProviderName="<%$ ConnectionStrings:jinitabCS.ProviderName %>" 
     SelectCommand="SELECT [user_email], [username], [pwd] FROM jinitab.[UserInfo] WHERE [user_email]=@user_email" 
     UpdateCommand="UPDATE jinitab.[UserInfo] SET [username] = @username, [pwd] = @pwd WHERE [user_email] = @user_email">
     <SelectParameters>
          <asp:FormParameter FormField="user_email" Name="user_email" Type="String" />
     </SelectParameters>              
      <DeleteParameters>
          <asp:Parameter Name="user_email" Type="String" />
      </DeleteParameters>
                    <InsertParameters>
                        <asp:FormParameter FormField="user_email" Name="user_email" Type="String" />
                        <asp:FormParameter FormField="username" Name="username" Type="String" />
                        <asp:FormParameter FormField="user_pwd" Name="pwd" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="pwd" Type="String" />
                        <asp:Parameter Name="user_email" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>


<div class="row">
    <div class="col-md-8">
         <h3 style="font-family:'Times New Roman'; font-size:32px;"> Register </h3>
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
         <asp:TextBox ID="user_pwd" runat="server" CssClass="form-control" TextMode="Password">
         </asp:TextBox>
        <asp:RequiredFieldValidator ID="password_req"
            runat ="server"
            ControlToValidate="user_pwd"
            ErrorMessage="Password is required"
            SetFocusOnError="true"
            Display="Dynamic"/>
         <br />
         <asp:Label ID="re_pwd" runat="server" Text="Re-enter Password"></asp:Label>
         &nbsp;:
         <asp:TextBox ID="user_re_pwd" runat="server" CssClass="form-control" TextMode="Password">
         </asp:TextBox>
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
    </div> 

<div class="col-md-3" style="margin:15px;">
 <pre>
        Sources :<br />
         <a href="../../fileview/Default.aspx?~/experiments/week6/exp6.2.aspx">ASPX Source</a><br />
        C# Source
     </pre>
 </div>
</div>
</div>
<br />
<asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="Button1_Click"/>
</form>

    <pre style="margin:20px;">
        In this experiment , I have connected to a databse and implemented the 'INSERT' query. 
        Everytime a user enters all their information , it gets inserted into the database. The code also checks whether the
        two password fields contain the same content. On clicking the submit button , it will display a error message if the
        two password fields are nto equal.
    </pre>

</div>

<script>
    $(".user_pwd").html();
</script>

</body>
</html>